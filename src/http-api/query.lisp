(in-package :api.neo4j.http-api)

(defun make-query-post-parameter (statement params)
  (list statement params))

(defun query (statement &key params user password)
  (let ((path "/db/data/query"))
    (api.neo4j.request:request :post path
                               :post-parameter (make-query-post-parameter statement params)
                               :user user :password password)))
