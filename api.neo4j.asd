#|
This file is a part of api.neo4j project.
|#

(defsystem "api.neo4j"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (:dexador
               :quri
               :jonathan)
  :components ((:module "libs"
                :components
                ((:file "authentication")
                 (:file "header")
                 (:file "uri")
                 (:file "request")))
               (:module "src"
                :components
                ((:file "environment")
                 (:file "assertions")
                 (:module "http-api"
                  :components
                  ((:file "result")
                   (:file "statement")
                   (:module "adjuster"
                    :components
                            ((:file "adjust-results-default")
                             (:file "adjust-results-nature")))
                   (:file "package")
                   (:file "api")))
                 (:file "package")
                 (:file "variables")
                 (:file "api")
                 (:file "user"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "api.neo4j-test"))))
