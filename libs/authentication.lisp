(defpackage api.neo4j.authentication
  (:nicknames :api.neo4j.auth)
  (:use :cl)
  (:export #:make-basic-auth
           #:*user*
           #:*password*))
(in-package :api.neo4j.authentication)

(defvar *user* nil)
(defvar *password* nil)

(defun make-basic-auth (&key (user *user*) (password *password*))
  (when (or user password)
    (cons user password)))

;;;;;
;;;;; Base64
;;;;;
(defun basic-authorization-contents (user password)
  ;; dex の basic-auth でできるので利用してません。
  (cl-base64:usb8-array-to-base64-string
   (babel:string-to-octets (concatenate 'string user ":" password))))
