(defpackage api.neo4j.request
  (:use #:cl
        #:api.neo4j.authentication
        #:api.neo4j.uri
        #:api.neo4j.request.header)
  (:export #:request))
(in-package :api.neo4j.request)

(defun return-values  (&key status body response-headers uri stream)
  (values status
          (jojo:parse body)
          response-headers
          uri
          stream))

(defun request-core (method path user password)
  (multiple-value-bind (body status response-headers uri stream)
      (dex:request (make-uri path)
                   :method     method
                   :headers    (make-request-headers)
                   :basic-auth (make-basic-auth :user user :password password))
    (return-values  :status status
                    :body body
                    :response-headers response-headers
                    :uri uri
                    :stream stream)))

(defun request (method path &key user password)
  (handler-case
      (request-core method path user password)
    (dex:http-request-failed (e)
      (describe e)
      (return-values :status (dex:response-status e)
                     :body (dex:response-body e)
                     :response-headers (dex:response-headers e)
                     :uri (dex::request-uri e)))))
