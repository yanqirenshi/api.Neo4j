(in-package :api.neo4j.tutorial)

(defun save-pacakges (plist)
  (ensure-package (getf plist :package)))

(defun save-pacakge-symbols (plist)
  (getf plist :package)
  (length (getf plist :symbols)))

(defun save-import-symbols (plist)
  (getf plist :package)
  (length (getf plist :symbols)))

(defun %save (fn lists)
  (dolist (plist lists)
    (funcall fn plist)))

(defun save (lists)
  ;; 1. package を作成する。
  (%save #'save-pacakges lists)
  ;; 2. package の symbol を登録する。
  (%save #'save-pacakge-symbols lists)
  ;; 3. package の import を登録する。
  (%save #'save-import-symbols lists))
