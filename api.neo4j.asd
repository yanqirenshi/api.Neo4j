#|
  This file is a part of api.neo4j project.
|#

(defsystem "api.neo4j"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (:dexador
               :quri)
  :components ((:module "libs"
                :components
                ((:file "authentication")
                 (:file "header")
                 (:file "uri")
                 (:file "request")
                 (:module "libs"
                  :components
                  ((:file "package")
                   (:file "syntax")
                   (:file "clauses")
                   (:file "functions")
                   (:file "cypher")))))
               (:module "src"
                :components
                ((:file "package")
                 (:file "user")
                 (:file "db"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "api.neo4j-test"))))
