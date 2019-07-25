(defpackage api.neo4j.http-api
  (:use #:cl))
(in-package :api.neo4j.http-api)


;; https://neo4j.com/docs/http-api/current/actions/begin-and-commit-a-transaction-in-one-request/


;; http://localhost:7474/db/data/transaction
;; http://localhost:7474/db/data/transaction/commit
;; http://localhost:7474/db/data/transaction/{id}
;; http://localhost:7474/db/data/transaction/{id}/commit
(defun make-transaction-path (id commit)
  (let ((base "/db/data/transaction"))
    (cond ((and id commit) (format t "~a/~a/commit" base id))
          (id              (format t "~a/~a"        base id))
          (commit          (format t "~a/commit"    base))
          (t               base))))


;; #:api.neo4j.request
(defun transaction (method &key id commit user password)
  (api.neo4j.request:request method
                             (make-transaction-path id commit)
                             :user user :password password))
