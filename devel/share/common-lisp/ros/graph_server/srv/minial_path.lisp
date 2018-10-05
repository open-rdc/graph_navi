; Auto-generated. Do not edit!


(cl:in-package graph_server-srv)


;//! \htmlinclude minial_path-request.msg.html

(cl:defclass <minial_path-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:string
    :initform "")
   (goal
    :reader goal
    :initarg :goal
    :type cl:string
    :initform ""))
)

(cl:defclass minial_path-request (<minial_path-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <minial_path-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'minial_path-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name graph_server-srv:<minial_path-request> is deprecated: use graph_server-srv:minial_path-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <minial_path-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:start-val is deprecated.  Use graph_server-srv:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <minial_path-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:goal-val is deprecated.  Use graph_server-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <minial_path-request>) ostream)
  "Serializes a message object of type '<minial_path-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'start))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'start))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'goal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <minial_path-request>) istream)
  "Deserializes a message object of type '<minial_path-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'start) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'goal) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<minial_path-request>)))
  "Returns string type for a service object of type '<minial_path-request>"
  "graph_server/minial_pathRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'minial_path-request)))
  "Returns string type for a service object of type 'minial_path-request"
  "graph_server/minial_pathRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<minial_path-request>)))
  "Returns md5sum for a message object of type '<minial_path-request>"
  "877cb00e6b709c3bf4e2cda35c97bf9e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'minial_path-request)))
  "Returns md5sum for a message object of type 'minial_path-request"
  "877cb00e6b709c3bf4e2cda35c97bf9e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<minial_path-request>)))
  "Returns full string definition for message of type '<minial_path-request>"
  (cl:format cl:nil "string start~%string goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'minial_path-request)))
  "Returns full string definition for message of type 'minial_path-request"
  (cl:format cl:nil "string start~%string goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <minial_path-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'start))
     4 (cl:length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <minial_path-request>))
  "Converts a ROS message object to a list"
  (cl:list 'minial_path-request
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
))
;//! \htmlinclude minial_path-response.msg.html

(cl:defclass <minial_path-response> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type cl:string
    :initform "")
   (lange
    :reader lange
    :initarg :lange
    :type cl:integer
    :initform 0))
)

(cl:defclass minial_path-response (<minial_path-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <minial_path-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'minial_path-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name graph_server-srv:<minial_path-response> is deprecated: use graph_server-srv:minial_path-response instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <minial_path-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:path-val is deprecated.  Use graph_server-srv:path instead.")
  (path m))

(cl:ensure-generic-function 'lange-val :lambda-list '(m))
(cl:defmethod lange-val ((m <minial_path-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:lange-val is deprecated.  Use graph_server-srv:lange instead.")
  (lange m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <minial_path-response>) ostream)
  "Serializes a message object of type '<minial_path-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'lange)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <minial_path-response>) istream)
  "Deserializes a message object of type '<minial_path-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lange)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'lange)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'lange)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'lange)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'lange)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'lange)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'lange)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'lange)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<minial_path-response>)))
  "Returns string type for a service object of type '<minial_path-response>"
  "graph_server/minial_pathResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'minial_path-response)))
  "Returns string type for a service object of type 'minial_path-response"
  "graph_server/minial_pathResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<minial_path-response>)))
  "Returns md5sum for a message object of type '<minial_path-response>"
  "877cb00e6b709c3bf4e2cda35c97bf9e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'minial_path-response)))
  "Returns md5sum for a message object of type 'minial_path-response"
  "877cb00e6b709c3bf4e2cda35c97bf9e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<minial_path-response>)))
  "Returns full string definition for message of type '<minial_path-response>"
  (cl:format cl:nil "string path~%uint64 lange~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'minial_path-response)))
  "Returns full string definition for message of type 'minial_path-response"
  (cl:format cl:nil "string path~%uint64 lange~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <minial_path-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <minial_path-response>))
  "Converts a ROS message object to a list"
  (cl:list 'minial_path-response
    (cl:cons ':path (path msg))
    (cl:cons ':lange (lange msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'minial_path)))
  'minial_path-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'minial_path)))
  'minial_path-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'minial_path)))
  "Returns string type for a service object of type '<minial_path>"
  "graph_server/minial_path")