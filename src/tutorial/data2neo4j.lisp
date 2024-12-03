(in-package :api.neo4j.tutorial)

(defun save_ht2lists (metrix)
  (let ((out nil))
    (maphash #'(lambda (key value)
                 (declare (ignore key))
                 (push value out))
             metrix)
    out))

(defun %save (fn lists)
  (when lists
    (let ((plist (car lists)))
      (funcall fn plist)
      (%save fn (cdr lists)))))

(defun save-pacakges (plist)
  (print (getf plist :package)))

(defun save-pacakge-symbols (plist)
  (getf plist :package)
  (length (getf plist :symbols)))

(defun save-import-symbols (plist)
  (getf plist :package)
  (length (getf plist :symbols)))

(defun save (metrix)
  (let ((lists (save_ht2lists metrix)))
    ;; 1. package を作成する。
    (%save #'save-pacakges lists)
    ;; 2. package の symbol を登録する。
    (%save #'save-pacakge-symbols lists)
    ;; 3. package の import を登録する。
    (%save #'save-import-symbols lists)))
