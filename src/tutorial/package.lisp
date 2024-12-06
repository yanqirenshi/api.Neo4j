(defpackage api.neo4j.tutorial
  (:nicknames :neo4j.tutorial)
  (:use #:cl)
  (:import-from :api.neo4j
                #:http))
(in-package :api.neo4j.tutorial)

;;;;;
;;;;; Utils
;;;;;
(defun dolist-times (fn chunk-size lst)
  (when lst
    (let ((chunk (subseq lst 0 (min chunk-size (length lst)))))
      ;; 各チャンクの処理
      (funcall fn chunk)
      ;; (format t "Processing chunk: ~a~%" chunk)
      ;; 残りのリストを再帰的に処理
      (dolist-times fn chunk-size (nthcdr chunk-size lst)))))

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


;;;;;
;;;;; Package
;;;;;
(defun merge-stmt-package (package)
  (cons "MERGE (n:PACKAGE {name: $NAME}) RETURN n"
        (list :name (package-name package))))

(defun merge-stmt-packages (chank)
  (mapcar #'(lambda (plist)
              (merge-stmt-package (getf plist :package)))
          chank))


;;;;;
;;;;; Package symbol
;;;;;

(defun create-package-symbol-stmt (plist)
  (let ((package (getf plist :package))
        (symbol  (getf plist :symbol))
        (export  (getf plist :export)))
    (cons (concatenate 'string
                       " MATCH (p:PACKAGE {name: $PACKAGE_NAME}) "
                       " MERGE (p)-[r:HAVE {export: $EXPORT}]->(s:SYMBOL {name: $SYMBOL_NAME}) "
                       " RETURN p, r, s ")
          (list :package_name (package-name package)
                :export export
                :symbol_name (symbol-name symbol)))))

(defun create-stmts-package-symbol (chank)
  (mapcar #'create-package-symbol-stmt chank))

;;;;;
;;;;; Package import
;;;;;

(defun create-import-stmt (plist)
  (let* ((package-import-to (getf plist :package))
         (symbol  (getf plist :symbol))
         (package-import-from (symbol-package symbol)))
    (cons (concatenate 'string
                       " MATCH (pf:PACKAGE {name: $PACKAGE_NAME_IMPORT_FROM}) "
                       " MATCH (pf)-[HAVE]->(s:SYMBOL {name: $SYMBOL_NAME}) "
                       " MERGE (pf)-[r:IMPORT]->(pt:PACKAGE {name: $PACKAGE_NAME_IMPORT_TO}) "
                       "RETURN pt, r, s ")
          (list :package_name_import_from (package-name package-import-from)
                :symbol_name (symbol-name symbol)
                :package_name_import_to (package-name package-import-to)))))

(defun create-stmts-import (chank)
  (mapcar #'create-import-stmt chank))
