(defpackage api.neo4j.rest-api
  (:use #:cl
        #:api.neo4j.env
        #:api.neo4j.assertion)
  (:import-from :api.neo4j.request
                #:request)
  (:export #:rest-api))
(in-package :api.neo4j.rest-api)


(defun rest-api (&key user password)
  (assert-rest-api-version)
  (assert-auth-params user password)
  (request :post "/db/data"
           :user user :password password))
