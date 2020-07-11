(defpackage api.neo4j.http-api.adjust-results-nature
  (:use #:cl)
  (:import-from :alexandria
                #:when-let)
  (:export #:adjust-results-nature))
(in-package :api.neo4j.http-api.adjust-results-nature)


(defun adjust-row (columns row &key adjuster)
  (if (null adjuster)
      row
      (funcall adjuster row columns)))


(defun adjust-rows (columns rows &key adjuster)
  (when-let ((row (car rows)))
    (cons (adjust-row  columns row :adjuster adjuster)
          (adjust-rows columns (cdr rows)
                       :adjuster adjuster))))


(defun adjust-results-nature (results &key adjuster)
  (when-let ((result (car results)))
    (let ((rows (getf result :|data|))
          (columns (getf result :|columns|)))
      (cons (adjust-rows columns rows :adjuster adjuster)
            (adjust-results-nature (cdr results)
                                   :adjuster adjuster)))))
