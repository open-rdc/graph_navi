#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import tf
import time
import math
import actionlib
from actionlib_msgs.msg import*
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import Twist
from move_base_msgs.msg import MoveBaseAction,MoveBaseGoal,MoveBaseFeedback

class Warker:
    def __init__(self):
		self.status=0;
		self.last_move_time=time.time();
		self.goal_pose=MoveBaseGoal()
		self.feedback_pose=MoveBaseFeedback()
		
		self.client_moveBase=actionlib.SimpleActionClient('move_base',MoveBaseAction)
		rospy.loginfo("wait waikup move_base")
		self.client_moveBase.wait_for_server()
		sub_cmd_vel=rospy.Subscriber('cmd_vel',Twist, self.callback)
		rospy.loginfo("finish")

    def callback(self,cmd_vel):
		#Do robot stop?
		if(not(cmd_vel.linear.x<0.00001 and cmd_vel.linear.y<0.00001 and cmd_vel.linear.z<0.00001) and (cmd_vel.linear.x<0.00001 and cmd_vel.linear.y<0.00001 and cmd_vel.linear.z<0.00001)):
			self.last_move_time=time.time();

    def warking_to_pose(self,pose):
        self.last_move_time=time.time();
        self.goal_pose.target_pose=pose;
        self.goal_pose.target_pose.header.frame_id='map'

        self.client_moveBase.send_goal(self.goal_pose,feedback_cb=self.callback_feedback)
        rospy.loginfo(self.get_status())

    def warking_to_point(self,x,y,z):
        pose=PoseStamped();
        goal_pose=MoveBaseGoal();     

        pose.pose.position.x=x;
        pose.pose.position.y=y;
        pose.pose.position.z=z;

        q=tf.transformations.quaternion_from_euler(0,0,0);

        pose.pose.orientation.x=q[0];
        pose.pose.orientation.y=q[1];
        pose.pose.orientation.z=q[2];
        pose.pose.orientation.w=q[3];
        self.warking_to_pose(pose)

	def resend_goal(self):
		self.client_moveBase.send_goal(self.goal_pose,feedback_cb=self.callback_feedback);
		rospy.loginfo("resend goal")
    def stop(self):
        self.client_moveBase.cancel_goal()
    def wait_for_arrival(self):
        #self.client_moveBase.wait_for_result()
		while(True):
			time.sleep(0.2);
			dx=self.goal_pose.target_pose.pose.position.x-self.feedback_pose.base_position.pose.position.x
			dy=self.goal_pose.target_pose.pose.position.y-self.feedback_pose.base_position.pose.position.y
			dz=self.goal_pose.target_pose.pose.position.z-self.feedback_pose.base_position.pose.position.z
			
			l=math.sqrt(math.pow(dx,2)+math.pow(dy,2));
			if (l<1.0):
				break;
			if(time.time()-self.last_move_time>5):
				self.warking_to_pose(self.goal_pose.target_pose);
				rospy.loginfo("resend");
			rospy.loginfo(time.time()-self.last_move_time>5);
    def restart(self):
		self.warking_to_pose(self.goal_pose)

    def get_status(self):
        return self.client_moveBase.get_state()

    def callback_feedback(self,feedback):
        #rospy.loginfo(feedback);
        self.feedback_pose=feedback;
        return
        
    def warking(self,pose):
        self.warking_to_pose(pose);

        while 1:
            status=self.get_status();
            if status==4:
                 return False
        return True

   
if __name__=='__main__':
    rospy.init_node('warker')
    wrk=Warker();
    wrk.get_status();
    wrk.warking_to_point(6.5,4.43,0.0);
    wrk.wait();
    """
    while(wrk.get_status()!=3):
        
		#time.sleep(0.2);
        rospy.loginfo(wrk.get_status());
	"""
    rospy.spin()
