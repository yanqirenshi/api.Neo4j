(defpackage api.neo4j
  (:nicknames :neo4j)
  (:use #:cl
        #:api.neo4j.request
        #:api.neo4j.env)
  (:import-from :api.neo4j.http-api
                #:http-api)
  (:import-from :api.neo4j.rest-api
                #:rest-api)
  ;; from api.neo4j.uri
  (:export #:*scheme*
           #:*host*
           #:*port*)
  ;; from native
  (:export #:*db*
           #:*user*
           #:*password*)
  (:export #:api))
(in-package :api.neo4j)
