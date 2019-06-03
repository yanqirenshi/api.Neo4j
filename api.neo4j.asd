#|
  This file is a part of api.neo4j project.
|#

(defsystem "api.neo4j"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "libs"
                :components
                ((:file "authentication")))
               (:module "src"
                :components
                ((:file "package"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "api.neo4j-test"))))
