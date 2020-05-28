(defpackage api.neo4j.uri
  (:use #:cl)
  (:export #:make-uri)
  (:export #:*scheme*
           #:*host*
           #:*port*))
(in-package :api.neo4j.uri)

(defvar *scheme* "http")
(defvar *host*   "localhost")
(defvar *port*   7474)

(defun make-uri (path &key (scheme *scheme*) (host *host*) (port *port*))
  (quri:render-uri
   (quri:make-uri :scheme scheme
                  :host host
                  :path path
                  :port port)))
