;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;;  https://neo4j.com/docs/http-api/current/security/
;;;;;
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(in-package :api.neo4j)


;;;;;
;;;;; 3.2. Authenticate to access the server
;;;;;
(defun get-user (user-code &key user password)
  (when user-code
    (multiple-value-bind (status json)
        (request :get
                 (concatenate 'string "/user/" user-code)
                 :user user :password password)
      (cond ((= status 200) json)
            ((= status 401) json)
            (t              nil)))))


;;;;;
;;;;; 3.8. Changing the user password
;;;;;
