(in-package :api.neo4j.http-api)


(defun adjust-row (column meta-data row-data &key adjuster)
  (let ((row (list (make-keyword column)
                   (list :|meta| meta-data
                         :|row| row-data))))
    (if (null adjuster)
        row
        (funcall adjuster row))))


(defun adjust-rows-columns (columns meta row &key adjuster)
  (when-let ((column (car columns)))
    (let ((meta-data (car meta))
          (row-data  (car row)))
      (nconc (adjust-row column meta-data row-data :adjuster adjuster)
             (adjust-rows-columns (cdr columns)
                                  (cdr meta)
                                  (cdr row)
                                  :adjuster adjuster)))))


(defun adjust-rows (columns rows &key adjuster)
  (alexandria:when-let ((row (car rows)))
    (cons (adjust-rows-columns columns
                               (getf row :|meta|)
                               (getf row :|row|)
                               :adjuster adjuster)
          (adjust-rows columns (cdr rows) :adjuster adjuster))))


(defun adjust-results (results &key adjuster)
  (when-let ((result (car results)))
    (let ((rows (getf result :|data|))
          (columns (getf result :|columns|)))
      (cons (adjust-rows columns rows :adjuster adjuster)
            (adjust-results (cdr results) :adjuster adjuster)))))


(defun http-api-tx-path (db commit)
  (concatenate 'string "/db/" db "/tx" (if commit "/commit" "")))


(defun http-api-tx (statements commit db user password &key adjuster nature)
  (assert db)
  (let ((results (request :post (http-api-tx-path db commit)
                          :content (statements2content statements)
                          :user user :password password)))
    (if nature
        (when adjuster
          (setf (getf results :|results|)
                (mapcar adjuster results)))
        (setf (getf results :|results|)
              (adjust-results (getf results :|results|)
                              :adjuster adjuster)))
    results))


(defun http-api-tx-commit (commit-uri user password)
  (api.neo4j.request:request-post-by-uri commit-uri
                                         :user user
                                         :password password))


(defun http-api (&key
                   statements
                   commit-uri
                   (commit t)
                   db user password
                   nature
                   adjuster)
  (cond (commit-uri
         (http-api-tx-commit commit-uri user password))
        ((null statements)
         (request :get  "/" :user user :password password))
        (t
         (http-api-tx statements
                      commit
                      db user password
                      :adjuster adjuster
                      :nature nature))))
