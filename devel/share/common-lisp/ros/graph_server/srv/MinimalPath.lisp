; Auto-generated. Do not edit!


(cl:in-package graph_server-srv)


;//! \htmlinclude MinimalPath-request.msg.html

(cl:defclass <MinimalPath-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass MinimalPath-request (<MinimalPath-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MinimalPath-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MinimalPath-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name graph_server-srv:<MinimalPath-request> is deprecated: use graph_server-srv:MinimalPath-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <MinimalPath-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:start-val is deprecated.  Use graph_server-srv:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <MinimalPath-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:goal-val is deprecated.  Use graph_server-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MinimalPath-request>) ostream)
  "Serializes a message object of type '<MinimalPath-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MinimalPath-request>) istream)
  "Deserializes a message object of type '<MinimalPath-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MinimalPath-request>)))
  "Returns string type for a service object of type '<MinimalPath-request>"
  "graph_server/MinimalPathRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MinimalPath-request)))
  "Returns string type for a service object of type 'MinimalPath-request"
  "graph_server/MinimalPathRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MinimalPath-request>)))
  "Returns md5sum for a message object of type '<MinimalPath-request>"
  "6321f4afb0321f086bd12ec44b09a3b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MinimalPath-request)))
  "Returns md5sum for a message object of type 'MinimalPath-request"
  "6321f4afb0321f086bd12ec44b09a3b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MinimalPath-request>)))
  "Returns full string definition for message of type '<MinimalPath-request>"
  (cl:format cl:nil "string start~%string goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MinimalPath-request)))
  "Returns full string definition for message of type 'MinimalPath-request"
  (cl:format cl:nil "string start~%string goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MinimalPath-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'start))
     4 (cl:length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MinimalPath-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MinimalPath-request
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
))
;//! \htmlinclude MinimalPath-response.msg.html

(cl:defclass <MinimalPath-response> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (lange
    :reader lange
    :initarg :lange
    :type cl:integer
    :initform 0))
)

(cl:defclass MinimalPath-response (<MinimalPath-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MinimalPath-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MinimalPath-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name graph_server-srv:<MinimalPath-response> is deprecated: use graph_server-srv:MinimalPath-response instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <MinimalPath-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:path-val is deprecated.  Use graph_server-srv:path instead.")
  (path m))

(cl:ensure-generic-function 'lange-val :lambda-list '(m))
(cl:defmethod lange-val ((m <MinimalPath-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_server-srv:lange-val is deprecated.  Use graph_server-srv:lange instead.")
  (lange m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MinimalPath-response>) ostream)
  "Serializes a message object of type '<MinimalPath-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'path))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'lange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'lange)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MinimalPath-response>) istream)
  "Deserializes a message object of type '<MinimalPath-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MinimalPath-response>)))
  "Returns string type for a service object of type '<MinimalPath-response>"
  "graph_server/MinimalPathResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MinimalPath-response)))
  "Returns string type for a service object of type 'MinimalPath-response"
  "graph_server/MinimalPathResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MinimalPath-response>)))
  "Returns md5sum for a message object of type '<MinimalPath-response>"
  "6321f4afb0321f086bd12ec44b09a3b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MinimalPath-response)))
  "Returns md5sum for a message object of type 'MinimalPath-response"
  "6321f4afb0321f086bd12ec44b09a3b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MinimalPath-response>)))
  "Returns full string definition for message of type '<MinimalPath-response>"
  (cl:format cl:nil "string[] path~%uint64 lange~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MinimalPath-response)))
  "Returns full string definition for message of type 'MinimalPath-response"
  (cl:format cl:nil "string[] path~%uint64 lange~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MinimalPath-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MinimalPath-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MinimalPath-response
    (cl:cons ':path (path msg))
    (cl:cons ':lange (lange msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MinimalPath)))
  'MinimalPath-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MinimalPath)))
  'MinimalPath-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MinimalPath)))
  "Returns string type for a service object of type '<MinimalPath>"
  "graph_server/MinimalPath")