(in-package :api.neo4j.tutorial)

(defun ensure-all-packages (lists &key (chanck-size 10))
  (dolist-times #'(lambda (chank)
                    (neo4j:http :statements (merge-stmt-packages chank) :commit t))
                chanck-size lists))

(defun save-pacakge-symbols (plist)
  (dolist (plist-symbol (getf plist :symbols))
    (when (eq :have (getf plist-symbol :type))
      (ensure-package-symbol (getf plist-symbol :symbol)))))


(defun save-import-symbols (plist)
  (getf plist :package)
  (first (getf plist :symbols)))


(defun %save (fn lists)
  (dolist (plist lists)
    (funcall fn plist)))

(defun save (lists)
  ;; (%save #'create-package-and-symbol lists)
  ;; (%save #'save-pacakge-symbols lists)
  ;;
  ;; 1. package を作成する。
  (ensure-all-packages lists :chanck-size 100)
  ;; 2. package の symbol を登録する。
  ;; (%save #'save-pacakge-symbols lists)
  ;; 3. package の import を登録する。
  ;; (%save #'save-import-symbols lists)
  )


;; (time
;;  (progn (delete-all-elements)
;;         (save (symbol-metrix))))
