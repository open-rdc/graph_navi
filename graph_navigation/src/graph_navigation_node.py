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
        rospy.init_node("graph_navigation");
        print "waikup"
        self.naviServer=actionlib.SimpleActionServer("graph_navi",graph_naviAction,self.run,False);

        #インスタンス生成
        self.Guid=guid.Guid()
        self.Warker=warker.Warker()

        self.goal=0;
        self.waypoint=[];
        self.arrivedPoint=0;
        self.nextPoint=0;
        self.naviServer.start();
        rospy.spin();

    def setPath(self,start,goal,waypoint=[]):
        #最短経路を求める
        self.nextPoint=start;
        self.goal=goal;
        self.waypoint=waypoint
        self.Guid.make_route(start,goal,self.waypoint);

    #ゴールに到達した場合：True
    def warking(self):

        [node_name,pose]=self.Guid.get_pose();#移動すべきnodeを指定
        rospy.loginfo("node_name:"+str(node_name))

        self.Warker.warking_to_pose(pose);
        self.Warker.wait_for_arrival();

        self.arrivedPoint=node_name;

        #終了判定
        if self.Guid.next_pose()==False:#ゴールに到達した場合
            return True;
        else:
            [node_name,pose]=self.Guid.get_pose();
            self.nextPoint=node_name;#次移動すべきnode
            rospy.loginfo("Arrived="+str(self.arrivedPoint)+"\t"+"Next="+str(self.nextPoint))
            return False;
        #self.Guid.get_pose()

    def run(self,navi):
        start=navi.start;
        goal=navi.goal;
        chekPoint=navi.checkPoint;
        self.setPath(start,goal,chekPoint);
        Feedback = graph_naviFeedback();
        while not self.warking():
            Feedback.arrivedPoint=self.arrivedPoint;
            Feedback.nextPoint=self.nextPoint;
            self.naviServer.publish_feedback(Feedback);
        
        result=graph_naviResult()
        result.result=0
        self.naviServer.set_succeeded(result)
    
if __name__=="__main__":
    args=sys.argv;
    rospy.init_node("graph_navigation");

    Graph_navigation();
    rospy.spin();
