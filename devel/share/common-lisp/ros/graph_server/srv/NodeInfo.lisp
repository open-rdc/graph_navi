; Auto-generated. Do not edit!


(cl:in-package graph_server-srv)


;//! \htmlinclude NodeInfo-request.msg.html

(cl:defclass <NodeInfo-request> (roslisp-msg-protocol:ros-message)
  ((node_id
    :reader node_id
    :initarg :node_id
    :type cl:integer
    :initform 0))
)

(cl:defclass NodeInfo-request (<NodeInfo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NodeInfo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NodeInfo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name graph_server-srv:<NodeInfo-request> is deprecated: use graph_server-srv:NodeInfo-request instead.")))

(cl:ensure-generic-function 'node_id-val :lambda-list '(m))
(cl:defmethod node_id-val ((m <NodeInfo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:node_id-val is deprecated.  Use graph_server-srv:node_id instead.")
  (node_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NodeInfo-request>) ostream)
  "Serializes a message object of type '<NodeInfo-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'node_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'node_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'node_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'node_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'node_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'node_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'node_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'node_id)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NodeInfo-request>) istream)
  "Deserializes a message object of type '<NodeInfo-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'node_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'node_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'node_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'node_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'node_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'node_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'node_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'node_id)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NodeInfo-request>)))
  "Returns string type for a service object of type '<NodeInfo-request>"
  "graph_server/NodeInfoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeInfo-request)))
  "Returns string type for a service object of type 'NodeInfo-request"
  "graph_server/NodeInfoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NodeInfo-request>)))
  "Returns md5sum for a message object of type '<NodeInfo-request>"
  "2029851a1bf8e47ba40fa92c11e0df36")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NodeInfo-request)))
  "Returns md5sum for a message object of type 'NodeInfo-request"
  "2029851a1bf8e47ba40fa92c11e0df36")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NodeInfo-request>)))
  "Returns full string definition for message of type '<NodeInfo-request>"
  (cl:format cl:nil "uint64 node_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NodeInfo-request)))
  "Returns full string definition for message of type 'NodeInfo-request"
  (cl:format cl:nil "uint64 node_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NodeInfo-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NodeInfo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'NodeInfo-request
    (cl:cons ':node_id (node_id msg))
))
;//! \htmlinclude NodeInfo-response.msg.html

(cl:defclass <NodeInfo-response> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass NodeInfo-response (<NodeInfo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NodeInfo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NodeInfo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name graph_server-srv:<NodeInfo-response> is deprecated: use graph_server-srv:NodeInfo-response instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <NodeInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:pose-val is deprecated.  Use graph_server-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NodeInfo-response>) ostream)
  "Serializes a message object of type '<NodeInfo-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NodeInfo-response>) istream)
  "Deserializes a message object of type '<NodeInfo-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NodeInfo-response>)))
  "Returns string type for a service object of type '<NodeInfo-response>"
  "graph_server/NodeInfoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeInfo-response)))
  "Returns string type for a service object of type 'NodeInfo-response"
  "graph_server/NodeInfoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NodeInfo-response>)))
  "Returns md5sum for a message object of type '<NodeInfo-response>"
  "2029851a1bf8e47ba40fa92c11e0df36")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NodeInfo-response)))
  "Returns md5sum for a message object of type 'NodeInfo-response"
  "2029851a1bf8e47ba40fa92c11e0df36")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NodeInfo-response>)))
  "Returns full string definition for message of type '<NodeInfo-response>"
  (cl:format cl:nil "geometry_msgs/PoseStamped pose~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NodeInfo-response)))
  "Returns full string definition for message of type 'NodeInfo-response"
  (cl:format cl:nil "geometry_msgs/PoseStamped pose~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NodeInfo-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NodeInfo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'NodeInfo-response
    (cl:cons ':pose (pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'NodeInfo)))
  'NodeInfo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'NodeInfo)))
  'NodeInfo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeInfo)))
  "Returns string type for a service object of type '<NodeInfo>"
  "graph_server/NodeInfo")