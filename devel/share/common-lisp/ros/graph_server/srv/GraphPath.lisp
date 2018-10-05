; Auto-generated. Do not edit!


(cl:in-package graph_server-srv)


;//! \htmlinclude GraphPath-request.msg.html

(cl:defclass <GraphPath-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:integer
    :initform 0)
   (goal
    :reader goal
    :initarg :goal
    :type cl:integer
    :initform 0))
)

(cl:defclass GraphPath-request (<GraphPath-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraphPath-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraphPath-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name graph_server-srv:<GraphPath-request> is deprecated: use graph_server-srv:GraphPath-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <GraphPath-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:start-val is deprecated.  Use graph_server-srv:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <GraphPath-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:goal-val is deprecated.  Use graph_server-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraphPath-request>) ostream)
  "Serializes a message object of type '<GraphPath-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'goal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'goal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'goal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'goal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'goal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'goal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'goal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'goal)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraphPath-request>) istream)
  "Deserializes a message object of type '<GraphPath-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'goal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'goal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'goal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'goal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'goal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'goal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'goal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'goal)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraphPath-request>)))
  "Returns string type for a service object of type '<GraphPath-request>"
  "graph_server/GraphPathRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphPath-request)))
  "Returns string type for a service object of type 'GraphPath-request"
  "graph_server/GraphPathRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraphPath-request>)))
  "Returns md5sum for a message object of type '<GraphPath-request>"
  "94f3650515896f2f94175e3d490a0f76")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraphPath-request)))
  "Returns md5sum for a message object of type 'GraphPath-request"
  "94f3650515896f2f94175e3d490a0f76")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraphPath-request>)))
  "Returns full string definition for message of type '<GraphPath-request>"
  (cl:format cl:nil "uint64 start~%uint64 goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraphPath-request)))
  "Returns full string definition for message of type 'GraphPath-request"
  (cl:format cl:nil "uint64 start~%uint64 goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraphPath-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraphPath-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GraphPath-request
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
))
;//! \htmlinclude GraphPath-response.msg.html

(cl:defclass <GraphPath-response> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (lange
    :reader lange
    :initarg :lange
    :type cl:float
    :initform 0.0))
)

(cl:defclass GraphPath-response (<GraphPath-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraphPath-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraphPath-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name graph_server-srv:<GraphPath-response> is deprecated: use graph_server-srv:GraphPath-response instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <GraphPath-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:path-val is deprecated.  Use graph_server-srv:path instead.")
  (path m))

(cl:ensure-generic-function 'lange-val :lambda-list '(m))
(cl:defmethod lange-val ((m <GraphPath-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:lange-val is deprecated.  Use graph_server-srv:lange instead.")
  (lange m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraphPath-response>) ostream)
  "Serializes a message object of type '<GraphPath-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) ele) ostream))
   (cl:slot-value msg 'path))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lange))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraphPath-response>) istream)
  "Deserializes a message object of type '<GraphPath-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lange) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraphPath-response>)))
  "Returns string type for a service object of type '<GraphPath-response>"
  "graph_server/GraphPathResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphPath-response)))
  "Returns string type for a service object of type 'GraphPath-response"
  "graph_server/GraphPathResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraphPath-response>)))
  "Returns md5sum for a message object of type '<GraphPath-response>"
  "94f3650515896f2f94175e3d490a0f76")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraphPath-response)))
  "Returns md5sum for a message object of type 'GraphPath-response"
  "94f3650515896f2f94175e3d490a0f76")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraphPath-response>)))
  "Returns full string definition for message of type '<GraphPath-response>"
  (cl:format cl:nil "uint64[] path~%float32 lange~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraphPath-response)))
  "Returns full string definition for message of type 'GraphPath-response"
  (cl:format cl:nil "uint64[] path~%float32 lange~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraphPath-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraphPath-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GraphPath-response
    (cl:cons ':path (path msg))
    (cl:cons ':lange (lange msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GraphPath)))
  'GraphPath-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GraphPath)))
  'GraphPath-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphPath)))
  "Returns string type for a service object of type '<GraphPath>"
  "graph_server/GraphPath")