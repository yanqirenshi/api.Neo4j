(in-package :api.neo4j.http-api)

(defun http-api-tx (statements commit db user password)
  (assert db)
  (let ((c (statements2content statements)))
    (request :post (concatenate 'string "/db/" db "/tx" (if commit "/commit" ""))
             :content c
             :user user :password password)))

(defun http-api-tx-commit (commit-uri user password)
  (api.neo4j.request:request-post-by-uri commit-uri
                                         :user user
                                         :password password))

(defun http-api (&key
                   statements
                   commit-uri
                   (commit t)
                   db user password)
  (cond (commit-uri
         (http-api-tx-commit commit-uri user password))
        ((null statements)
         (request :get  "/" :user user :password password))
        (t
         (http-api-tx statements commit db user password))))
