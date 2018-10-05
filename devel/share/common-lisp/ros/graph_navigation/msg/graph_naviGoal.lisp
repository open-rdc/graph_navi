; Auto-generated. Do not edit!


(cl:in-package graph_navigation-msg)


;//! \htmlinclude graph_naviGoal.msg.html

(cl:defclass <graph_naviGoal> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:integer
    :initform 0)
   (goal
    :reader goal
    :initarg :goal
    :type cl:integer
    :initform 0)
   (checkPoint
    :reader checkPoint
    :initarg :checkPoint
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass graph_naviGoal (<graph_naviGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <graph_naviGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'graph_naviGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name graph_navigation-msg:<graph_naviGoal> is deprecated: use graph_navigation-msg:graph_naviGoal instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <graph_naviGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_navigation-msg:start-val is deprecated.  Use graph_navigation-msg:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <graph_naviGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_navigation-msg:goal-val is deprecated.  Use graph_navigation-msg:goal instead.")
  (goal m))

(cl:ensure-generic-function 'checkPoint-val :lambda-list '(m))
(cl:defmethod checkPoint-val ((m <graph_naviGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader graph_navigation-msg:checkPoint-val is deprecated.  Use graph_navigation-msg:checkPoint instead.")
  (checkPoint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <graph_naviGoal>) ostream)
  "Serializes a message object of type '<graph_naviGoal>"
  (cl:let* ((signed (cl:slot-value msg 'start)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'goal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'checkPoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'checkPoint))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <graph_naviGoal>) istream)
  "Deserializes a message object of type '<graph_naviGoal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'checkPoint) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'checkPoint)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<graph_naviGoal>)))
  "Returns string type for a message object of type '<graph_naviGoal>"
  "graph_navigation/graph_naviGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'graph_naviGoal)))
  "Returns string type for a message object of type 'graph_naviGoal"
  "graph_navigation/graph_naviGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<graph_naviGoal>)))
  "Returns md5sum for a message object of type '<graph_naviGoal>"
  "f7adec3cf8709088ac0c64d29e882640")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'graph_naviGoal)))
  "Returns md5sum for a message object of type 'graph_naviGoal"
  "f7adec3cf8709088ac0c64d29e882640")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<graph_naviGoal>)))
  "Returns full string definition for message of type '<graph_naviGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%int32 start~%int32 goal~%int32[] checkPoint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'graph_naviGoal)))
  "Returns full string definition for message of type 'graph_naviGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%int32 start~%int32 goal~%int32[] checkPoint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <graph_naviGoal>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'checkPoint) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <graph_naviGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'graph_naviGoal
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
    (cl:cons ':checkPoint (checkPoint msg))
))
