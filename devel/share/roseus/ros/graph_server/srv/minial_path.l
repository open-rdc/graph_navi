;; Auto-generated. Do not edit!


(when (boundp 'graph_server::minial_path)
  (if (not (find-package "GRAPH_SERVER"))
    (make-package "GRAPH_SERVER"))
  (shadow 'minial_path (find-package "GRAPH_SERVER")))
(unless (find-package "GRAPH_SERVER::MINIAL_PATH")
  (make-package "GRAPH_SERVER::MINIAL_PATH"))
(unless (find-package "GRAPH_SERVER::MINIAL_PATHREQUEST")
  (make-package "GRAPH_SERVER::MINIAL_PATHREQUEST"))
(unless (find-package "GRAPH_SERVER::MINIAL_PATHRESPONSE")
  (make-package "GRAPH_SERVER::MINIAL_PATHRESPONSE"))

(in-package "ROS")





(defclass graph_server::minial_pathRequest
  :super ros::object
  :slots (_start _goal ))

(defmethod graph_server::minial_pathRequest
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

(defclass graph_server::minial_pathResponse
  :super ros::object
  :slots (_path _lange ))

(defmethod graph_server::minial_pathResponse
  (:init
   (&key
    ((:path __path) "")
    ((:lange __lange) 0)
    )
   (send-super :init)
   (setq _path (string __path))
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
    ;; string _path
    4 (length _path)
    ;; uint64 _lange
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _path
       (write-long (length _path) s) (princ _path s)
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
   ;; string _path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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

(defclass graph_server::minial_path
  :super ros::object
  :slots ())

(setf (get graph_server::minial_path :md5sum-) "877cb00e6b709c3bf4e2cda35c97bf9e")
(setf (get graph_server::minial_path :datatype-) "graph_server/minial_path")
(setf (get graph_server::minial_path :request) graph_server::minial_pathRequest)
(setf (get graph_server::minial_path :response) graph_server::minial_pathResponse)

(defmethod graph_server::minial_pathRequest
  (:response () (instance graph_server::minial_pathResponse :init)))

(setf (get graph_server::minial_pathRequest :md5sum-) "877cb00e6b709c3bf4e2cda35c97bf9e")
(setf (get graph_server::minial_pathRequest :datatype-) "graph_server/minial_pathRequest")
(setf (get graph_server::minial_pathRequest :definition-)
      "string start
string goal
---
string path
uint64 lange

")

(setf (get graph_server::minial_pathResponse :md5sum-) "877cb00e6b709c3bf4e2cda35c97bf9e")
(setf (get graph_server::minial_pathResponse :datatype-) "graph_server/minial_pathResponse")
(setf (get graph_server::minial_pathResponse :definition-)
      "string start
string goal
---
string path
uint64 lange

")



(provide :graph_server/minial_path "877cb00e6b709c3bf4e2cda35c97bf9e")


