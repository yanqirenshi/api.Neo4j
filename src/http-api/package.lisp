(defpackage api.neo4j.http-api
  (:use #:cl)
  (:import-from :api.neo4j.request
                #:request)
  (:export #:http-api))
(in-package :api.neo4j.http-api)


(defun mkstmt (statement parameters)
  (list :|statement| statement
        :|parameters| parameters))

(defun mkstmts-core (data)
  (alexandria:when-let ((s (car data)))
    (cons (mkstmt (car s)
                  (cdr s))
          (mkstmts-core (cdr data)))))


(defun mkstmts (data)
  (let ((contents (mkstmts-core data)))
    (when contents
      (list :|statements| contents))))


(defun statements2content (statements)
  (cond ((null statements) nil)
        ((stringp statements) statements)
        ((listp statements)
         (jojo:to-json (mkstmts statements)))
        (t (error "Not Supported yet. type=~S" (type-of statements)))))


(defun http-api (&key statements
                   db user password)
  (unless (and db user password)
    (error "A required item has not been completed. Please input."))
  (if (null statements)
      (request :get  "/"
               :user user :password password)
      (request :post (concatenate 'string "/db/" db "/tx")
               :content (statements2content statements)
               :user user :password password)))
