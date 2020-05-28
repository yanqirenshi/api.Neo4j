(defpackage api.neo4j.assertion
  (:use #:cl
        #:api.neo4j.env)
  (:import-from :alexandria
                #:when-let)
  (:export #:assert-rest-api-version
           #:assert-auth-params))
(in-package :api.neo4j.assertion)


;;;;;
;;;;; assert-rest-api-version
;;;;;
(defun get-version-first-num (version)
  (when version
    (parse-integer (first (split-sequence:split-sequence #\. version)))))


(defun assert-rest-api-version ()
  (when-let ((version (env.neo4j-version)))
    (let ((first-ver-num (get-version-first-num version)))
      (when (<= 4 first-ver-num)
        (error (concatenate 'string
                            "Can not use rest api. version=~a~%"
                            "  See Also: https://github.com/neo4j/neo4j/issues/12411")
               version)))))


;;;;;
;;;;; assert-rest-api-version
;;;;;
(defun assert-auth-params (user password)
  (unless (and user password)
    (error "A required item has not been completed. Please input.")))
