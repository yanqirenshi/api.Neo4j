(in-package :lang.cypher.clause)

(defun clause-return (stream statement)
  (declare (ignore statement))
  (write-string "RETURN " stream))

(defun clause-call (stream statement)
  (fire-error-not-supported-clause "CALL"))

(defun clause-create-unique (stream statement)
  (fire-error-not-supported-clause "CREATE-UNIQUE"))

(defun clause-detach-delete (stream statement)
  (fire-error-not-supported-clause "DETACH-DELETE"))

(defun clause-drop-constraint (stream statement)
  (fire-error-not-supported-clause "DROP-CONSTRAINT"))

(defun clause-drop-index (stream statement)
  (fire-error-not-supported-clause "DROP-INDEX"))

(defun clause-foreach (stream statement)
  (fire-error-not-supported-clause "FOREACH"))

(defun clause-limit (stream statement)
  (fire-error-not-supported-clause "LIMIT"))

(defun clause-load-csv (stream statement)
  (fire-error-not-supported-clause "LOAD-CSV"))

(defun clause-merge (stream statement)
  (fire-error-not-supported-clause "MERGE"))

(defun clause-on-create (stream statement)
  (fire-error-not-supported-clause "ON-CREATE"))

(defun clause-on-match (stream statement)
  (fire-error-not-supported-clause "ON-MATCH"))

(defun clause-order-by (stream statement)
  (fire-error-not-supported-clause "ORDER-BY"))

(defun clause-remove (stream statement)
  (fire-error-not-supported-clause "REMOVE"))

(defun clause-set (stream statement)
  (fire-error-not-supported-clause "SET"))

(defun clause-skip (stream statement)
  (fire-error-not-supported-clause "SKIP"))

(defun clause-union (stream statement)
  (fire-error-not-supported-clause "UNION"))

(defun clause-union-all (stream statement)
  (fire-error-not-supported-clause "UNION-ALL"))

(defun clause-unwind (stream statement)
  (fire-error-not-supported-clause "UNWIND"))

(defun clause-using-index (stream statement)
  (fire-error-not-supported-clause "USING-INDEX"))

(defun clause-using-index-seek (stream statement)
  (fire-error-not-supported-clause "USING-INDEX-SEEK"))

(defun clause-using-join (stream statement)
  (fire-error-not-supported-clause "USING-JOIN"))

(defun clause-using-periodic-commit (stream statement)
  (fire-error-not-supported-clause "USING-PERIODIC-COMMIT"))

(defun clause-using-scan (stream statement)
  (fire-error-not-supported-clause "USING-SCAN"))

(defun clause-where (stream statement)
  (fire-error-not-supported-clause "WHERE"))

(defun clause-yield (stream statement)
  (fire-error-not-supported-clause "YIELD"))

(defun clause-optional-match (stream statement)
  (fire-error-not-supported-clause "OPTIONAL-MATCH"))

(defun clause-start (stream statement)
  (fire-error-not-supported-clause "START"))

(defun clause-with (stream statement)
  (fire-error-not-supported-clause "WITH"))
