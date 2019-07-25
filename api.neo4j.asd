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
                 (:file "request")))
               (:module "src"
                :components
                ((:file "package")
                 (:file "user")
                 (:file "db")
                 (:module "http-api"
                  :components
                  ((:file "package")
                   (:file "query")
                   (:file "transaction"))))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "api.neo4j-test"))))
