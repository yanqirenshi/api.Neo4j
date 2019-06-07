(in-package :lang.cypher)

(defmacro cypher (&rest statements)
  `'(,@statements))

;; optima つかうか。
;; (string= "MATCH (john {name: 'John'})-[:friend]->()-[:friend]->(fof) RETURN john.name, fof.name"
;;          (cypher
;;            (:match (:john (:name "John")) (:---> :friend) :all (:---> :friend) (:fof))
;;            (:return (:john.name :fof.name))))
