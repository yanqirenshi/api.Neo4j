(defpackage api.neo4j
  (:use #:cl
        #:api.neo4j.request)
  (:import-from :api.neo4j.http-api
                #:http-api)
  ;; from api.neo4j.uri
  (:export #:*scheme*
           #:*host*
           #:*port*)
  ;; from native
  (:export #:*db*
           #:*user*
           #:*password*))
(in-package :api.neo4j)

(defvar *db* nil)
(defvar *user* nil)
(defvar *password* nil)

(defun api (api-type &key (db *db*) (user *user*) (password *password*) statements)
  (cond ((eq :http api-type)
         (http-api :statements statements
                   :db db
                   :user user
                   :password password))
        ((eq :rest api-type)
         nil)
        (t (error "Not Supported yet. api-type=~S" api-type))))
