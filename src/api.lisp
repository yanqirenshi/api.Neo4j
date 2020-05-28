(in-package :api.neo4j)


(defun ensure-environment ()
  (unless *environment*
    (setf *environment* (http-api))))


(defun api (api-type &key
                       (db *db*) (user *user*) (password *password*)
                       statements)
  (ensure-environment)
  (cond ((eq :http api-type)
         (http-api :statements statements
                   :db db
                   :user user
                   :password password))
        ((eq :rest api-type)
         (rest-api :user user
                   :password password))
        (t (error "Not Supported yet. api-type=~S" api-type))))
