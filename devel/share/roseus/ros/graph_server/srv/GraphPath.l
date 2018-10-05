;; Auto-generated. Do not edit!


(when (boundp 'graph_server::GraphPath)
  (if (not (find-package "GRAPH_SERVER"))
    (make-package "GRAPH_SERVER"))
  (shadow 'GraphPath (find-package "GRAPH_SERVER")))
(unless (find-package "GRAPH_SERVER::GRAPHPATH")
  (make-package "GRAPH_SERVER::GRAPHPATH"))
(unless (find-package "GRAPH_SERVER::GRAPHPATHREQUEST")
  (make-package "GRAPH_SERVER::GRAPHPATHREQUEST"))
(unless (find-package "GRAPH_SERVER::GRAPHPATHRESPONSE")
  (make-package "GRAPH_SERVER::GRAPHPATHRESPONSE"))

(in-package "ROS")





(defclass graph_server::GraphPathRequest
  :super ros::object
  :slots (_start _goal ))

(defmethod graph_server::GraphPathRequest
  (:init
   (&key
    ((:start __start) 0)
    ((:goal __goal) 0)
    )
   (send-super :init)
   (setq _start (round __start))
   (setq _goal (round __goal))
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
    ;; uint64 _start
    8
    ;; uint64 _goal
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint64 _start
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _start (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _start) (= (length (_start . bv)) 2)) ;; bignum
              (write-long (ash (elt (_start . bv) 0) 0) s)
              (write-long (ash (elt (_start . bv) 1) -1) s))
             ((and (class _start) (= (length (_start . bv)) 1)) ;; big1
              (write-long (elt (_start . bv) 0) s)
              (write-long (if (>= _start 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _start s)(write-long (if (>= _start 0) 0 #xffffffff) s)))
     ;; uint64 _goal
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _goal (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _goal) (= (length (_goal . bv)) 2)) ;; bignum
              (write-long (ash (elt (_goal . bv) 0) 0) s)
              (write-long (ash (elt (_goal . bv) 1) -1) s))
             ((and (class _goal) (= (length (_goal . bv)) 1)) ;; big1
              (write-long (elt (_goal . bv) 0) s)
              (write-long (if (>= _goal 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _goal s)(write-long (if (>= _goal 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint64 _start
     
#+(or :alpha :irix6 :x86_64)
      (setf _start (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _start (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint64 _goal
     
#+(or :alpha :irix6 :x86_64)
      (setf _goal (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _goal (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass graph_server::GraphPathResponse
  :super ros::object
  :slots (_path _lange ))

(defmethod graph_server::GraphPathResponse
  (:init
   (&key
    ((:path __path) (make-array 0 :initial-element 0 :element-type :integer))
    ((:lange __lange) 0.0)
    )
   (send-super :init)
   (setq _path __path)
   (setq _lange (float __lange))
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
    ;; uint64[] _path
    (* 8    (length _path)) 4
    ;; float32 _lange
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint64[] _path
     (write-long (length _path) s)
     (dotimes (i (length _path))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _path i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _path i)) (= (length ((elt _path i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _path i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _path i) . bv) 1) -1) s))
             ((and (class (elt _path i)) (= (length ((elt _path i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _path i) . bv) 0) s)
              (write-long (if (>= (elt _path i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _path i) s)(write-long (if (>= (elt _path i) 0) 0 #xffffffff) s)))
       )
     ;; float32 _lange
       (sys::poke _lange (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint64[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (instantiate integer-vector n))
     (dotimes (i n)
     
#+(or :alpha :irix6 :x86_64)
      (setf (elt _path i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _path i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;; float32 _lange
     (setq _lange (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass graph_server::GraphPath
  :super ros::object
  :slots ())

(setf (get graph_server::GraphPath :md5sum-) "94f3650515896f2f94175e3d490a0f76")
(setf (get graph_server::GraphPath :datatype-) "graph_server/GraphPath")
(setf (get graph_server::GraphPath :request) graph_server::GraphPathRequest)
(setf (get graph_server::GraphPath :response) graph_server::GraphPathResponse)

(defmethod graph_server::GraphPathRequest
  (:response () (instance graph_server::GraphPathResponse :init)))

(setf (get graph_server::GraphPathRequest :md5sum-) "94f3650515896f2f94175e3d490a0f76")
(setf (get graph_server::GraphPathRequest :datatype-) "graph_server/GraphPathRequest")
(setf (get graph_server::GraphPathRequest :definition-)
      "uint64 start
uint64 goal
---
uint64[] path
float32 lange

")

(setf (get graph_server::GraphPathResponse :md5sum-) "94f3650515896f2f94175e3d490a0f76")
(setf (get graph_server::GraphPathResponse :datatype-) "graph_server/GraphPathResponse")
(setf (get graph_server::GraphPathResponse :definition-)
      "uint64 start
uint64 goal
---
uint64[] path
float32 lange

")



(provide :graph_server/GraphPath "94f3650515896f2f94175e3d490a0f76")


