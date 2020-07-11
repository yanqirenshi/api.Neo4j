(in-package :api.neo4j)

(export 'http)


(defun ensure-environment ()
  (unless *environment*
    (setf *environment* (http-api))))


(defun http (&key
               (db *db*) (user *user*) (password *password*)
               commit-uri
               commit
               statements
               adjuster
               nature)
  (ensure-environment)
  (http-api :statements statements
            :commit-uri commit-uri
            :commit commit
            :db db
            :user user
            :password password
            :nature nature
            :adjuster adjuster))
