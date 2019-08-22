#!/usr/bin/env python
import rospy
import actionlib

from graph_navigation.msg import*

rospy.init_node("graph_navi_starter");
c=actionlib.SimpleActionClient('graph_navi',graph_naviAction);
c.wait_for_server()
goal=graph_naviGoal()
goal.start=0
goal.goal=4
goal.checkPoint=[3]
c.send_goal(goal)
c.wait_for_result()

class Graph_navigation:
    def __init__(self):
        rospy.init_node("graph_navi_starter");
        self.goal=graph_naviGoal();
        self.feedback=graph_naviFeedback();
        self.graph_navi_client=actionlib.SimpleActionClient('graph_navi',graph_naviAction);
        self.graph_navi_client.wait_for_server()
        rospy.spin();
    def feedback_CB(self,feedback):
        self.feedback=feedback;

    def start(self):
        pass;
    def pause(self):
        pass;
    def restart(self):
        pass;
    def cancel(self);
        pass;
