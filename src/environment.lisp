(defpackage api.neo4j.env
  (:use #:cl)
  (:export #:*environment*
           #:env.neo4j-edition
           #:env.neo4j-version
           #:env.transaction
           #:env.bolt-direct
           #:env.bolt-routing))
(in-package :api.neo4j.env)

(defvar *environment* nil)

(defun env.neo4j-edition ()
  (when *environment*
    (getf *environment* :|neo4j_edition|)))

(defun env.neo4j-version ()
  (when *environment*
    (getf *environment* :|neo4j_version|)))

(defun env.transaction ()
  (when *environment*
    (getf *environment* :|transaction|)))

(defun env.bolt-direct ()
  (when *environment*
    (getf *environment* :|bolt_direct|)))

(defun env.bolt-routing ()
  (when *environment*
    (getf *environment* :|bolt_routing|)))
