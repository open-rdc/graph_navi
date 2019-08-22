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
        is_status=0;
        self.Guid=guid.Guid()
        self.Warker=warker.Warker()
        self.goal=0;
        self.waypoint=[]

    #startからgoalまでの最短経路を設定
    def setPath(self,start,goal,waypoint=[]):
        #最短経路を求める
        self.goal=goal;
        self.waypoint=waypoint
        self.Guid.make_route(start,goal,self.waypoint);

    #ゴールに到達した場合:0
    #移動中の場合        :1
    #経由点に到達した場合:2
    #nodeに到着した場合  :3
    def warking(self):
        #次移動するべきノードへ移動する
        [node_name,pose]=self.Guid.get_pose();#移動箇所を取得
        rospy.loginfo("node_name:"+str(node_name))
        if self.Warker.get_status()==1:
            self.Warker.warking_to_pose(pose);#poseまで移動開始
        temp=1;#戻り値
        if True==self.Warker.wark():#目的ノードに到着している場合
            #最終目的地(goal)に到着
            if node_name == self.goal:
                temp=0;
            elif node_name in self.waypoint:
                temp=2;
            else:
                #次の目的地を指定
                self.Guid.next_pose();
                #self.Guid.get_pose();
                temp=3;
        return temp;

    def stop(self):
        #move_baseを終了させる
        self.Warker.stop();
        #現在移動中のEdgeの情報を取得
        curent_edge=[];
        #取得したEdgeの情報を戻り値として返す。
        return curent_edge;
def run(navi):
    start=navi.start;
    goal=navi.goal;
    chekPoint=navi.checkPoint;
    navi=Graph_navigation();
    result=graph_naviResult();
    navi.setPath(start,goal,chekPoint);
    #ロボットの移動
    while True:
        if True: #何らかの判断で停止させる。 
            #通常移動(目的地まで移動)
            temp=navi.warking();
            if temp==0:#ゴールに到着
                break;
            elif temp==2:#チェックポイントに到着
                pass;
            elif temp==3:#ノードに到達
                pass;
        else:
            #停止
            navi.stop();

    naviServer.set_succeeded(result)
    
if __name__=="__main__":
    args=sys.argv;
    rospy.init_node("graph_navigation");
    print "waikup"
    naviServer=actionlib.SimpleActionServer("graph_navi",graph_naviAction,run,False);
    naviServer.start();
    rospy.spin();
