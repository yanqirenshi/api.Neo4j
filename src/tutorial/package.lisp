(defpackage api.neo4j.tutorial
  (:nicknames :neo4j.tutorial)
  (:use #:cl)
  (:import-from :api.neo4j
                #:http))
(in-package :api.neo4j.tutorial)


;;;;;
;;;;; Utils
;;;;;
(defun dolist-times (chunk-size lst)
  (when lst
    (let ((chunk (subseq lst 0 (min chunk-size (length lst)))))
      ;; 各チャンクの処理
      (format t "Processing chunk: ~a~%" chunk)
      ;; 残りのリストを再帰的に処理
      (dolist-times chunk-size (nthcdr chunk-size lst)))))

(defun make-stmts (list) list)

;;;;;
;;;;; DELETE
;;;;;
(defun delete-all-elements ()
  (let ((stmt "MATCH (n) DETACH DELETE n"))
    (format t "~a~%" stmt)
    (neo4j:http :statements `((,stmt . nil))
                :commit t)))


;;;;;
;;;;; neo4j operators
;;;;;
;;;;; |---1---|-------2-----------------|---------3----------|
;;;;;
;;;;; (Package)------:HAVE------>(Symbol)------:INPORT------>(Package)
;;;;;                 - export t  - type
;;;;;
(defun create-package-and-symbol-stmt (plist)
  (let* ((package (getf plist :package))
         (symbol  (getf plist :symbol)))
    (concatenate 'string
                 (format nil " MERGE (p:PACKAGE {name: '~a'})"         (package-name package))
                 (format nil " MERGE (s:SYMBOL  {name: '~a'})"         (symbol-name symbol))
                 (format nil " MERGE (p)-[r:HAVE {export: '~a'}]->(s)" (getf plist :export)))))

(defun create-package-and-symbol (data)
  (dolist (symbol-data (getf data :symbols))
    (let ((stmt (create-package-and-symbol-stmt symbol-data)))
      ;; (format t "~a~%" stmt)
      (neo4j:http :statements `((,stmt . nil)) :commit t))))

;; (bt:make-thread #'(lambda () (neo4j.tutorial::save (neo4j.tutorial::symbol-metrix))))


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
