#! /usr/bin/python
#coding:utf-8
import sys
import guid
import warker
import rospy
import actionlib
from graph_navigation.msg import *

class Graph_navigation:
    def __init__(self):
        #インスタンス生成
        self.Guid=guid.Guid()
        self.Warker=warker.Warker()
        self.goal=0;
        self.waypoint=[]
    def setPath(self,start,goal,waypoint=[]):
        #最短経路を求める
        self.goal=goal;
        self.waypoint=waypoint
        self.Guid.make_route(start,goal,self.waypoint);

    #ゴールに到達した場合：True
    def warking(self):
        while True:
            [node_name,pose]=self.Guid.get_pose();
            rospy.loginfo("node_name:"+str(node_name))
            print pose

            self.Warker.warking_to_pose(pose);
            self.Warker.wait_for_arrival();

            #if node_name == self.goal:
            #    return True

            if self.Guid.next_pose()==False:
				return True;
            #self.Guid.get_pose()

def run(navi):
    start=navi.start;
    goal=navi.goal;
    chekPoint=navi.checkPoint;
    navi=Graph_navigation();
    navi.setPath(start,goal,chekPoint);
    navi.warking();

    result=graph_naviResult()
    result.result=0
    naviServer.set_succeeded(result)
    
if __name__=="__main__":
    args=sys.argv;
    rospy.init_node("graph_navigation");
    print "waikup"
    naviServer=actionlib.SimpleActionServer("graph_navi",graph_naviAction,run,False);
    naviServer.start();
    rospy.spin();
