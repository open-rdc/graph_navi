#!/usr/bin/env python
import rospy
from Graph_navi_with_detour.msg import graph_navi_start

rospy.init_node("start_test");
start_cmd=graph_navi_start();
start_cmd.start=1
start_cmd.goal=10
start_cmd.check_point=[3,4]
pub=rospy.Publisher("graph_navi_detour/start",graph_navi_start);
pub.publish(start_cmd);




