(in-package :api.neo4j.http-api)


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

(defvar *uri-list*
  '(("https://neo4j.com/docs/http-api/current/")
    ("POST   http://localhost:7474/db/data/transaction/commit"    "2.2. Execute multiple statements")
    ("POST   http://localhost:7474/db/data/transaction/commit"    "2.1. Begin and commit a transaction in one request")
    ("POST   http://localhost:7474/db/data/transaction"           "2.3. Begin a transaction")
    ("POST   http://localhost:7474/db/data/transaction/12"        "2.4. Execute statements in an open transaction")
    ("POST   http://localhost:7474/db/data/transaction/2"         "2.5. Reset transaction timeout of an open transaction")
    ("POST   http://localhost:7474/db/data/transaction/6/commit"  "2.6. Commit an open transaction")
    ("DELETE http://localhost:7474/db/data/transaction/3"         "2.7. Rollback an open transaction")
    ("POST   http://localhost:7474/db/data/transaction/commit"    "2.8. Include query statistics")
    ("POST   http://localhost:7474/db/data/transaction/commit"    "2.9. Return results in graph format")
    ("POST   http://localhost:7474/db/data/transaction/11/commit" "2.10. Handling errors")
    ("POST   http://localhost:7474/db/data/transaction/9"         "2.11. Handling errors in an open transaction")))

;;; let x;
;;; x = {
;;;     "statements" : [
;;;         {
;;;             "statement" : "",
;;;             "parameters" : {
;;;                 "props" : {
;;;                     "name" : "My Node"
;;;                 }
;;;             },
;;;             "includeStats" : true,
;;;             "resultDataContents" : [ "row", "graph" ]
;;;         }
;;;     ]
;;; };
