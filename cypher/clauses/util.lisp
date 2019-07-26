(in-package :lang.cypher.clause)

(defun fire-error-not-supported-clause (name)
  (error "Clause does not supported. clause='~a'" name))
