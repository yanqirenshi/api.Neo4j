(defpackage api.neo4j.request
  (:use #:cl
        #:api.neo4j.authentication
        #:api.neo4j.uri
        #:api.neo4j.request.header)
  (:export #:request
           #:request-post-by-uri)
  ;; from api.neo4j.uri
  (:export #:*scheme*
           #:*host*
           #:*port*))
(in-package :api.neo4j.request)


(defun return-values  (&key body status response-headers uri stream)
  (values (jojo:parse body)
          status
          response-headers
          uri
          stream))


(defun assert-user-password (user password)
  (unless (and user password)
    (error "A required item has not been completed. Please input.")))


(defun request-get (method path user password)
  (when (string/= "/" path)
    (assert-user-password user password))
  (multiple-value-bind (body status response-headers uri stream)
      (dex:request (make-uri path)
                   :method     method
                   :headers    (make-request-headers)
                   :basic-auth (make-basic-auth :user user :password password))
    (return-values  :body body
                    :status status
                    :response-headers response-headers
                    :uri uri
                    :stream stream)))


(defun request-post-by-uri (uri &key user password content)
  (dex:request uri
               :method     :post
               :headers    (make-request-headers)
               :basic-auth (make-basic-auth :user user :password password)
               :content    content))

(defun request-post (path content user password)
  (assert-user-password user password)
  (multiple-value-bind (body status response-headers uri stream)
      (request-post-by-uri (make-uri path)
                           :user user
                           :password password
                           :content content)
    (return-values  :body body
                    :status status
                    :response-headers response-headers
                    :uri uri
                    :stream stream)))


(defun request (method path &key content user password)
  (handler-case
      (cond ((eq :get method)
             (request-get method path user password))
            ((eq :post method)
             (request-post path content user password))
            (t (error "Bad method. method=~S" method)))
    (dex:http-request-failed (e)
      (describe e)
      (return-values :status (dex:response-status e)
                     :body (dex:response-body e)
                     :response-headers (dex:response-headers e)
                     :uri (dex::request-uri e)))))
