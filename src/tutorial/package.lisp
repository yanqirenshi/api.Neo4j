(defpackage api.neo4j.tutorial
  (:nicknames :neo4j.tutorial)
  (:use #:cl)
  (:import-from :api.neo4j
                #:http))
(in-package :api.neo4j.tutorial)

;;;;;
;;;;; neo4j operators
;;;;;
;;;;; |---1---|-------2-----------------|---------3----------|
;;;;;
;;;;; (Package)------:HAVE------>(Symbol)------:INPORT------>(Package)
;;;;;                 - export t  - type
;;;;;

;;;;;
;;;;; Package
;;;;;
(defun create-package (package)
  (let ((stmt (concatenate 'string
                           (format nil "CREATE (n:PACKAGE {name: '~a'}) RETURN n"
                                   (package-name package)))))
    (format t "~a~%" stmt)
    (neo4j:http :statements `((,stmt . nil))
                :commit t)))

(defun get-package (package)
  (let ((stmt (concatenate 'string
                           (format nil "MATCH (n:PACKAGE {name: '~a'}) RETURN n"
                                   (package-name package)))))
    (format t "~a~%" stmt)
    (let ((response (neo4j:http :statements `((,stmt . nil)))))
      (first (getf response :|results|)))))

(defun ensure-package (package)
  (or (get-package package)
      (create-package package)))


;;;;;
;;;;; Package symbol
;;;;;
(defun create-package-symbol (data)
  (let ((stmt (concatenate 'string
                           (format nil "CREATE (n:SYMBOL {name: '~a'}) RETURN n"
                                   (symbol-name data)))))
    (format t "~a~%" stmt)
    (neo4j:http :statements `((,stmt . nil))
                :commit t)))

(defun get-package-symbol (data)
  (let ((stmt (concatenate 'string
                           (format nil "MATCH (n:SYMBOL {name: '~a'}) RETURN n"
                                   (symbol-name data)))))
    (format t "~a~%" stmt)
    (let ((response (neo4j:http :statements `((,stmt . nil)))))
      (first (getf response :|results|)))))


(defun ensure-package-symbol (data)
  (or (get-package-symbol data)
      (create-package-symbol data)))


;;;;;
;;;;; Package import
;;;;;
(defun create-import (data) data)

(defun get-import (data) data)

(defun ensure-import (data)
  (or (get-import data)
      (create-import data)))


;; CREATE (p:PACKAGE {name: '~a'})-[r:HAVE {export: 'T'}]->(s:SYMBOL {name: '~a'})
