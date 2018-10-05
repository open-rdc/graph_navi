;; Auto-generated. Do not edit!


(when (boundp 'graph_server::MinimalPath)
  (if (not (find-package "GRAPH_SERVER"))
    (make-package "GRAPH_SERVER"))
  (shadow 'MinimalPath (find-package "GRAPH_SERVER")))
(unless (find-package "GRAPH_SERVER::MINIMALPATH")
  (make-package "GRAPH_SERVER::MINIMALPATH"))
(unless (find-package "GRAPH_SERVER::MINIMALPATHREQUEST")
  (make-package "GRAPH_SERVER::MINIMALPATHREQUEST"))
(unless (find-package "GRAPH_SERVER::MINIMALPATHRESPONSE")
  (make-package "GRAPH_SERVER::MINIMALPATHRESPONSE"))

(in-package "ROS")





(defclass graph_server::MinimalPathRequest
  :super ros::object
  :slots (_start _goal ))

(defmethod graph_server::MinimalPathRequest
  (:init
   (&key
    ((:start __start) "")
    ((:goal __goal) "")
    )
   (send-super :init)
   (setq _start (string __start))
   (setq _goal (string __goal))
   self)
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:serialization-length
   ()
   (+
    ;; string _start
    4 (length _start)
    ;; string _goal
    4 (length _goal)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _start
       (write-long (length _start) s) (princ _start s)
     ;; string _goal
       (write-long (length _goal) s) (princ _goal s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _start
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _start (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _goal
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _goal (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass graph_server::MinimalPathResponse
  :super ros::object
  :slots (_path _lange ))

(defmethod graph_server::MinimalPathResponse
  (:init
   (&key
    ((:path __path) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:lange __lange) 0)
    )
   (send-super :init)
   (setq _path __path)
   (setq _lange (round __lange))
   self)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:lange
   (&optional __lange)
   (if __lange (setq _lange __lange)) _lange)
  (:serialization-length
   ()
   (+
    ;; string[] _path
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _path)) 4
    ;; uint64 _lange
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _path
     (write-long (length _path) s)
     (dolist (elem _path)
       (write-long (length elem) s) (princ elem s)
       )
     ;; uint64 _lange
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _lange (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _lange) (= (length (_lange . bv)) 2)) ;; bignum
              (write-long (ash (elt (_lange . bv) 0) 0) s)
              (write-long (ash (elt (_lange . bv) 1) -1) s))
             ((and (class _lange) (= (length (_lange . bv)) 1)) ;; big1
              (write-long (elt (_lange . bv) 0) s)
              (write-long (if (>= _lange 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _lange s)(write-long (if (>= _lange 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _path i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; uint64 _lange
     
#+(or :alpha :irix6 :x86_64)
      (setf _lange (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _lange (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass graph_server::MinimalPath
  :super ros::object
  :slots ())

(setf (get graph_server::MinimalPath :md5sum-) "6321f4afb0321f086bd12ec44b09a3b8")
(setf (get graph_server::MinimalPath :datatype-) "graph_server/MinimalPath")
(setf (get graph_server::MinimalPath :request) graph_server::MinimalPathRequest)
(setf (get graph_server::MinimalPath :response) graph_server::MinimalPathResponse)

(defmethod graph_server::MinimalPathRequest
  (:response () (instance graph_server::MinimalPathResponse :init)))

(setf (get graph_server::MinimalPathRequest :md5sum-) "6321f4afb0321f086bd12ec44b09a3b8")
(setf (get graph_server::MinimalPathRequest :datatype-) "graph_server/MinimalPathRequest")
(setf (get graph_server::MinimalPathRequest :definition-)
      "string start
string goal
---
string[] path
uint64 lange

")

(setf (get graph_server::MinimalPathResponse :md5sum-) "6321f4afb0321f086bd12ec44b09a3b8")
(setf (get graph_server::MinimalPathResponse :datatype-) "graph_server/MinimalPathResponse")
(setf (get graph_server::MinimalPathResponse :definition-)
      "string start
string goal
---
string[] path
uint64 lange

")



(provide :graph_server/MinimalPath "6321f4afb0321f086bd12ec44b09a3b8")


