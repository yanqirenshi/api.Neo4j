(defpackage api.neo4j.http-api.result
  (:use #:cl))
(in-package :api.neo4j.http-api.result)

(export 'recorde.meta)
(export 'recorde.row)
(export 'result.data)
(export 'result.columns)
(export 'response.transaction)
(export 'response.commit)
(export 'response.errors)
(export 'response.results)
(export 'response.results.data)
(export 'response.results.columns)

;;;;;
;;;;; recorde
;;;;;
(defun recorde.meta (recorde)
  (getf recorde :|meta|))

(defun recorde.row (recorde)
  (getf recorde :|row|))


;;;;;
;;;;; result
;;;;;
(defun result.data (result)
  (getf result :|data|))

(defun result.columns (result)
  (getf result :|columns|))


;;;;;
;;;;; response
;;;;;
(defun response.transaction (response)
  (getf response :|transaction|))

(defun response.commit (response)
  (getf response :|commit|))

(defun response.errors (response)
  (getf response :|errors|))

(defun response.results (response &optional i)
  (let ((out (getf response :|results|)))
    (cond ((null i) out)
          ((integerp i) (nth i out))
          (t (error "Not supported yet. i=~S" i)))))

(defun response.results.data (response &optional (i 0))
  (getf (response.results response i) :|data|))

(defun response.results.columns (response &optional (i 0))
  (getf (response.results response i) :|columns|))
