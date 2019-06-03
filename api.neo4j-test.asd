#|
  This file is a part of api.neo4j project.
|#

(defsystem "api.neo4j-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("api.neo4j"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "api.neo4j"))))
  :description "Test system for api.neo4j"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
