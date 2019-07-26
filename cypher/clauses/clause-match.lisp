(in-package :lang.cypher.clause)

(defun clause-match-type (statement)
  (cond ((listp statement)
         (let ((head (car statement)))
           (cond ((eq :-->   head) :edge)
                 ((eq :<--   head) :edge)
                 ((eq :---   head) :edge)
                 ((keywordp  head) :node)
                 (t (error "clause-match list case")))))
        ((keywordp statement)
         (cond ((eq :all statement) :node)
               ((eq :--> statement) :edge)
               ((eq :<-- statement) :edge)
               ((eq :--- statement) :edge)
               (t (error "clause-match keyword case"))))
        (t (error "clause-match"))))


(defun clause-match-detail-node (stream statements &key befor)
  (list stream statements befor))


(defun clause-match-detail-edge (stream statements &key befor)
  (list stream statements befor))


(defun clause-match-details (stream statements &key befor)
  (when-let ((statement statements))
    (let ((type (clause-match-type statement)))
      (cond ((eq :node type) (clause-match-detail-node stream statements :befor befor))
            ((eq :edge type) (clause-match-detail-edge stream statements :befor befor))))
    (clause-match-details stream (cdr statements))))


(defun clause-match (stream statements)
  (clause-match-details stream (cdr statements)))
