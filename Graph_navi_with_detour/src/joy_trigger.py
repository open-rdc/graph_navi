#!/usr/bin/env python
import rospy
from std_msgs.msg import *
from sensor_msgs.msg import Joy

def callback(joy_msg):
    if joy_msg.buttons[0]:
        cost=Float64(99.0);
        pub.publish(cost);
rospy.init_node("joy_trigger");
sub=rospy.Subscriber("joy",Joy,callback);
pub=rospy.Publisher("cost",Float64,queue_size=1);
print "waikup"
rospy.spin();
