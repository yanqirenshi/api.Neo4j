(defpackage api.neo4j.request.header
  (:use #:cl)
  (:export #:make-request-headers))
(in-package :api.neo4j.request.header)

(defun make-request-headers ()
  '(("Accept" . "application/json")
    ("charset" . "UTF-8")))
