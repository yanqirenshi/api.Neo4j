(in-package :api.neo4j.tutorial)


(defun ensure-all-packages (lists &key (chanck-size 10))
  "とりあえず package を作成する。"
  (dolist-times #'(lambda (chank)
                    (neo4j:http :statements (merge-stmt-packages chank) :commit t))
                chanck-size lists))


(defun filter-package-symbol-have (list)
  ":symbols を :have だけにする。(:import は除外)"
  (remove-if #'(lambda (v) (eq :have (getf v :type)))
             list))


(defun save-pacakge-symbols (list &key (chanck-size 10))
  (dolist (plist list)
    (let ((symbols (filter-package-symbol-have (getf plist :symbols))))
      (dolist-times #'(lambda (chank)
                        (neo4j:http :statements (create-stmts-package-symbol chank) :commit t))
                    chanck-size symbols))))


(defun save-import-symbols (list &key (chanck-size 10))
  (cons (length list) chanck-size))


(defun %save (fn lists)
  (dolist (plist lists)
    (funcall fn plist)))

(defun save (lists)
  ;; 1. package を作成する。
  (ensure-all-packages  lists :chanck-size 100)
  ;; 2. package の symbol を登録する。
  (save-pacakge-symbols lists :chanck-size 100)
  ;; 3. package の import を登録する。
  (save-import-symbols lists :chanck-size 100))


(defun test! ()
  (bt:make-thread
   #'(lambda ()
       (time
        (progn (neo4j.tutorial::delete-all-elements)
               (neo4j.tutorial::save (neo4j.tutorial::symbol-metrix)))))))