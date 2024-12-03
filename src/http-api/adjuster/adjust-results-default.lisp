(defpackage api.neo4j.http-api.adjust-results-default
  (:use #:cl)
  (:import-from :alexandria
                #:when-let
                #:make-keyword)
  (:export #:adjust-results-default))
(in-package :api.neo4j.http-api.adjust-results-default)


(defun make-default-row (column meta-data row-data)
  (list (make-keyword (string-upcase column))
        (list :|meta| meta-data
              :|row| row-data)))


(defun adjust-rows-columns (columns meta row)
  (when-let ((column (car columns)))
    (let ((meta-data (car meta))
          (row-data  (car row)))
      (nconc (make-default-row column meta-data row-data)
             (adjust-rows-columns (cdr columns)
                                  (cdr meta)
                                  (cdr row))))))


(defun adjust-row (columns row &key adjuster)
  (let ((new-row (adjust-rows-columns columns
                                      (getf row :|meta|)
                                      (getf row :|row|))))
    (if (null adjuster)
        new-row
        (funcall adjuster new-row columns))))


(defun adjust-rows (columns rows &key adjuster)
  (when-let ((row (car rows)))
    (cons (adjust-row columns row :adjuster adjuster)
          (adjust-rows columns (cdr rows)
                       :adjuster adjuster))))


(defun adjust-results-default (results &key adjuster)
  (when-let ((result (car results)))
    (let ((rows (getf result :|data|))
          (columns (getf result :|columns|)))
      (cons (adjust-rows columns
                         rows
                         :adjuster
                         adjuster)
            (adjust-results-default (cdr results)
                                    :adjuster adjuster)))))
