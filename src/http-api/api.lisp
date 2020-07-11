(in-package :api.neo4j.http-api)


(defun adjust-results (results &key adjuster nature)
  (if nature
      (adjust-results-nature  results :adjuster adjuster)
      (adjust-results-default results :adjuster adjuster)))


(defun http-api-tx-path (db commit)
  (concatenate 'string "/db/" db "/tx" (if commit "/commit" "")))


(defun http-api-tx (statements commit db user password &key adjuster nature)
  (assert db)
  (let ((api-results (request :post (http-api-tx-path db commit)
                              :content (statements2content statements)
                              :user user :password password)))
    (when (or adjuster (null nature))
      (setf (getf api-results :|results|)
            (adjust-results (getf api-results :|results|)
                            :adjuster adjuster
                            :nature nature)))
    api-results))


(defun http-api-tx-commit (commit-uri user password)
  (api.neo4j.request:request-post-by-uri commit-uri
                                         :user user
                                         :password password))


(defun http-api (&key
                   statements
                   commit-uri
                   (commit t)
                   db user password
                   nature
                   adjuster)
  (cond (commit-uri
         (http-api-tx-commit commit-uri user password))
        ((null statements)
         (request :get  "/" :user user :password password))
        (t
         (http-api-tx statements
                      commit
                      db user password
                      :adjuster adjuster
                      :nature nature))))
