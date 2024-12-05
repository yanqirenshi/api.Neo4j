(in-package :api.neo4j.tutorial)

(defun save-pacakge-symbols (plist)
  ;; (print (getf plist :package))
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
  (%save #'create-package-and-symbol lists)
  ;; 1. package を作成する。
  ;; (ensure-package (getf plist :package))
  ;; 2. package の symbol を登録する。
  ;; (%save #'save-pacakge-symbols lists)
  ;; 3. package の import を登録する。
  ;; (%save #'save-import-symbols lists)
  )
