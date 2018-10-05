;; Auto-generated. Do not edit!


(when (boundp 'graph_server::NodeInfo)
  (if (not (find-package "GRAPH_SERVER"))
    (make-package "GRAPH_SERVER"))
  (shadow 'NodeInfo (find-package "GRAPH_SERVER")))
(unless (find-package "GRAPH_SERVER::NODEINFO")
  (make-package "GRAPH_SERVER::NODEINFO"))
(unless (find-package "GRAPH_SERVER::NODEINFOREQUEST")
  (make-package "GRAPH_SERVER::NODEINFOREQUEST"))
(unless (find-package "GRAPH_SERVER::NODEINFORESPONSE")
  (make-package "GRAPH_SERVER::NODEINFORESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass graph_server::NodeInfoRequest
  :super ros::object
  :slots (_node_id ))

(defmethod graph_server::NodeInfoRequest
  (:init
   (&key
    ((:node_id __node_id) 0)
    )
   (send-super :init)
   (setq _node_id (round __node_id))
   self)
  (:node_id
   (&optional __node_id)
   (if __node_id (setq _node_id __node_id)) _node_id)
  (:serialization-length
   ()
   (+
    ;; uint64 _node_id
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint64 _node_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _node_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _node_id) (= (length (_node_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_node_id . bv) 0) 0) s)
              (write-long (ash (elt (_node_id . bv) 1) -1) s))
             ((and (class _node_id) (= (length (_node_id . bv)) 1)) ;; big1
              (write-long (elt (_node_id . bv) 0) s)
              (write-long (if (>= _node_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _node_id s)(write-long (if (>= _node_id 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint64 _node_id
     
#+(or :alpha :irix6 :x86_64)
      (setf _node_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _node_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass graph_server::NodeInfoResponse
  :super ros::object
  :slots (_pose ))

(defmethod graph_server::NodeInfoResponse
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass graph_server::NodeInfo
  :super ros::object
  :slots ())

(setf (get graph_server::NodeInfo :md5sum-) "2029851a1bf8e47ba40fa92c11e0df36")
(setf (get graph_server::NodeInfo :datatype-) "graph_server/NodeInfo")
(setf (get graph_server::NodeInfo :request) graph_server::NodeInfoRequest)
(setf (get graph_server::NodeInfo :response) graph_server::NodeInfoResponse)

(defmethod graph_server::NodeInfoRequest
  (:response () (instance graph_server::NodeInfoResponse :init)))

(setf (get graph_server::NodeInfoRequest :md5sum-) "2029851a1bf8e47ba40fa92c11e0df36")
(setf (get graph_server::NodeInfoRequest :datatype-) "graph_server/NodeInfoRequest")
(setf (get graph_server::NodeInfoRequest :definition-)
      "uint64 node_id
---
geometry_msgs/PoseStamped pose


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get graph_server::NodeInfoResponse :md5sum-) "2029851a1bf8e47ba40fa92c11e0df36")
(setf (get graph_server::NodeInfoResponse :datatype-) "graph_server/NodeInfoResponse")
(setf (get graph_server::NodeInfoResponse :definition-)
      "uint64 node_id
---
geometry_msgs/PoseStamped pose


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :graph_server/NodeInfo "2029851a1bf8e47ba40fa92c11e0df36")


