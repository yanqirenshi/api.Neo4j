(in-package :lang.cypher)

(defun cypher-core (stream statements)
  (alexandria:when-let (statement (car statements))
    (print statement)
    (assert (clause-p statement))
    (print statement)
    (cypher-core stream (cdr statements))))

(defmacro cypher (&rest statements)
  `(let ((statement-string (make-array '(0) :element-type 'base-char :fill-pointer 0 :adjustable t)))
     (with-output-to-string (stream statement-string)
       (cypher-core stream '(,@statements)))
     statement-string))

;;;;;
;;;;; create node
;;;;;
(defun test-mutch-simple ()
  (let ((expect "MATCH (john {name: 'John'})-[:friend]->()-[:friend]->(fof) RETURN john.name, fof.name")
        (got (cypher
              (:MATCH  (:john (:name "John")) (:--> :friend) :all (:--> :friend) (:fof))
              (:RETURN (:john.name :fof.name)))))
    (assert (string= expect got))))


;;;;;
;;;;; get node
;;;;;
