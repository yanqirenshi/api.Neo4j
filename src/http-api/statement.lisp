(defpackage api.neo4j.http-api.statement
  (:use #:cl)
  (:export #:statements2content))
(in-package :api.neo4j.http-api.statement)


(defun mkstmt (statement parameters)
  (if (null parameters)
      (list :|statement| statement)
      (list :|statement| statement
            :|parameters| parameters)))


(defun mkstmts-core (data)
  "data: cons cell of (statement . parameters)
statement: string
parameters: plist
"
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
