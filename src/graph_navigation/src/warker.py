#!/usr/bin/env python
import rospy
import tf
import time
import math
import actionlib
from actionlib_msgs.msg import*
from geometry_msgs.msg import PoseStamped
from move_base_msgs.msg import MoveBaseAction,MoveBaseGoal,MoveBaseFeedback

class Warker:
    def __init__(self):
        self.status=0;

        self.goal_pose=MoveBaseGoal()
        self.feedback_pose=MoveBaseFeedback()
        self.isGoal_flg=False

        self.client_moveBase=actionlib.SimpleActionClient('move_base',MoveBaseAction)
        rospy.loginfo("wait waikup move_base")
        self.client_moveBase.wait_for_server()
        
        rospy.loginfo("finish")

    def warking_to_pose(self,pose):

        self.goal_pose.target_pose=pose;
        self.goal_pose.target_pose.header.frame_id='map'

        self.client_moveBase.send_goal(self.goal_pose,feedback_cb=self.callback_feedback)
        rospy.loginfo(self.get_status())

    def warking_to_point(self,x,y,z):
        pose=PoseStamped()
        goal_pose=MoveBaseGoal()
        
        pose.header.frame_id='map'

        pose.pose.position.x=x;
        pose.pose.position.y=y;
        pose.pose.position.z=z;

        q=tf.transformations.quaternion_from_euler(0,0,0);
        rospy.loginfo(q)
        pose.pose.orientation.x=q[0];
        pose.pose.orientation.y=q[1];
        pose.pose.orientation.z=q[2];
        pose.pose.orientation.w=q[3];
        self.warking_to_pose(pose)

    def stop(self):
        self.client_moveBase.cancel_goal()

    def wait(self):
        #self.client_moveBase.wait_for_result()
        while(not self.isGoal_flg):
            pass
        self.isGoal_flg=False;

    def restart(self):
        self.warking_to_pose(self.goal_pose)

    def get_status(self):
 
        return self.client_moveBase.get_state()

    def callback_feedback(self,feedback):
        #rospy.loginfo(feedback);
        self.feedback_pose=feedback;
        
        dx=self.goal_pose.target_pose.pose.position.x-self.feedback_pose.base_position.pose.position.x
        dy=self.goal_pose.target_pose.pose.position.y-self.feedback_pose.base_position.pose.position.y
        dz=self.goal_pose.target_pose.pose.position.z-self.feedback_pose.base_position.pose.position.z

        l=math.sqrt(math.pow(dx,2)+math.pow(dy,2));

        if(l<3.0):
            self.isGoal_flg=True;
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

    
    while(wrk.get_status()!=3):
        time.sleep(0.2);
        rospy.loginfo(wrk.get_status());
    rospy.spin()
