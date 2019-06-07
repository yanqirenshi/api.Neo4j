(in-package :lang.cypher)


(defvar *clauses* '(
                    :CALL
                    :CREATE
                    :CREATE
                    :CREATE-UNIQUE
                    :DELETE
                    :DETACH-DELETE
                    :DROP-CONSTRAINT
                    :DROP-INDEX
                    :FOREACH
                    :LIMIT
                    :LOAD-CSV
                    :MERGE
                    :ON-CREATE
                    :ON-MATCH
                    :ORDER-BY
                    :REMOVE
                    :SET
                    :SKIP
                    :UNION
                    :UNION-ALL
                    :UNWIND
                    :USING-INDEX
                    :USING-INDEX-SEEK
                    :USING-JOIN
                    :USING-PERIODIC-COMMIT
                    :USING-SCAN
                    :WHERE
                    :YIELD
                    :match
                    :optional-match
                    :return
                    :start
                    :with
                    ))
