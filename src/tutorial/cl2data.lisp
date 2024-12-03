(in-package :api.neo4j.tutorial)

;;;
;;; symbols
;;;
(defun package-external-symbols (package)
  (let ((out nil))
    (do-external-symbols (s package out)
      (push s out))))

(defun external-symbolp (symbol external-symbols)
  (when external-symbols
    (if (eq symbol (car external-symbols))
        t
        (external-symbolp symbol (cdr external-symbols)))))

(defun package-symbols (package)
  (let ((out nil)
        (external-symbols (package-external-symbols package)))
    (do-symbols (symbol package out)
      (push
       (if (eq package (symbol-package symbol))
           (list :package package
                 :symbol symbol
                 :export (external-symbolp symbol external-symbols))
           (list :package (symbol-package symbol)
                 :symbol symbol
                 :import t))
       out))))

;;;
;;; package
;;;
(defun make-package-data (package)
  (list :package package
        :symbols (package-symbols package)))

(defun symbol-metrix ()
  (reduce #'(lambda (ht package)
              (setf (gethash (package-name package) ht)
                    (make-package-data package))
              ht)
          (list-all-packages)
          :initial-value (make-hash-table :test 'equal)))
