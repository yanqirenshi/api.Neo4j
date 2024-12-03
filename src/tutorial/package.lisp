(defpackage api.neo4j.tutorial
  (:nicknames :neo4j.tutorial)
  (:use #:cl)
  (:import-from :api.neo4j
                #:http))
(in-package :api.neo4j.tutorial)

;;;
;;; neo4j operators
;;;
;;; |---1---|-------2-----------------|---------3----------|
;;;
;;; (Package)------:HAVE------>(Symbol)------:INPORT------>(Package)
;;;                 - export t  - type
;;;

(defun save-package (data) data)

(defun get-package (data) data)

(defun ensure-package (data) data)



(defun save-package-symbol (data) data)

(defun get-package-symbol (data) data)

(defun ensure-package-symbol (data) data)



(defun save-import (data) data)

(defun get-import (data) data)

(defun ensure-import (data) data)
