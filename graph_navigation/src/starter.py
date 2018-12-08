#!/usr/bin/env python
import rospy
import actionlib

from graph_navigation.msg import*

rospy.init_node("graph_navi_starter");
c=actionlib.SimpleActionClient('graph_navi',graph_naviAction);
c.wait_for_server()
goal=graph_naviGoal()
goal.start=1
goal.goal=8
goal.checkPoint=[5,6,9]
c.send_goal(goal)
c.wait_for_result()
print "finiffe"
