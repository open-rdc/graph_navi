#! /usr/bin/python
#coding:utf-8
import sys
import guid
import warker
import rospy
import actionlib
from std_msgs.msg import Int16
from graph_navigation.msg import *
class Graph_navigation:
    def __init__(self):
        #インスタンス生成
        is_status=0;
        self.Guid=guid.Guid()
        self.Warker=warker.Warker()
        self.goal=0;
        self.waypoint=[]
        self.node_name=0
        self.edge=[None,None];

    #startからgoalまでの最短経路を設定
    def setPath(self,start,goal,waypoint=[]):
        #最短経路を求める
        self.goal=goal;
        self.waypoint=waypoint
        self.Guid.make_route(start,goal,self.waypoint);
    #次のノードへ移動する
    def start(self):
        #次移動するべきノードへ移動する
        [self.node_name,pose]=self.Guid.get_pose();#移動箇所を取得
        rospy.loginfo("node_name:"+str(self.node_name))
        self.Warker.warking_to_pose(pose);#poseまで移動開始
        #移動中のEdgeの情報を更新
        self.edge[1]=self.edge[0];
        self.edge[0]=self.node_name;

    #ゴールに到達した場合:0
    #移動中の場合        :1
    #経由点に到達した場合:2
    #nodeに到着した場合  :3
    def warking(self):
        if True==self.Warker.wark():#目的ノードに到着している場合
            if self.node_name in self.waypoint:
                #self.Guid.next_pose();
                self.waypoint.remove(self.node_name);
                temp=2;
            else:
                #次の目的地を指定
                #self.Guid.next_pose();
                temp=3;
            #目的地(ゴール)へ到着した時
            if self.Guid.next_pose()==False:
                temp=0;
        else:
            temp=1;
        print self.edge;
        return temp;

    def stop(self):
        #move_baseを終了させる
        self.Warker.stop();
        #移動する予定だったNodeを取得
        next_node=self.Guid.get_pose();
        #残ってるチェックポイントを取得
        #取得したEdgeの情報を戻り値として返す。
        return next_node[0];
flag=0
def callback(msg):
    global flag;
    flag=1
    print "getflag!"
def run(navi):
    global flag;
    cmd_sub=rospy.Subscriber("graph_navigation/cmd_stop",Int16,callback)
    #移動先、チェックポイントの設定
    start=navi.start;
    goal=navi.goal;
    chekPoint=navi.checkPoint;
    navi=Graph_navigation();
    result=graph_naviResult();
    feedback=graph_naviFeedback();
    navi.setPath(start,goal,list(chekPoint));
    navi.start();
    r=rospy.Rate(10)
    #ロボットの移動
    while True:
        #移動し続けるかの判断
        if flag==0: #何らかの判断で停止させる。 
            #通常移動(目的地まで移動)
            temp=navi.warking();
            if temp==0:#ゴールに到着
                print "end"
                navi.stop()
                result.result=0;
                break;
            if not temp==1:
                if temp==2:#チェックポイントに到着
                    feedback.isCheckPoint=1;
                    navi.start();
                    pass;
                elif temp==3:#ノードに到達
                    feedback.isCheckPoint=0;
                    navi.start();
                    pass;
                feedback.curent_node=navi.edge[1]
                feedback.next_node=navi.edge[0]
                feedback.Unreachable=navi.waypoint
                naviServer.publish_feedback(feedback)
                result.Unreachable=navi.waypoint


        else:
            #停止
            navi.stop();
            result.result=1
            break;
        r.sleep()
    print("Finish graph_navi")
    flag=0;
    naviServer.set_succeeded(result)
    
if __name__=="__main__":
    args=sys.argv;
    rospy.init_node("graph_navigation");
    print "waikup"

    #コマンド受信用subscliber
    #停止した場合Resultを通じ現在向かってるノード、残りのチェックポイントとゴールを送信
    #cmd_sub=rospy.Subscriber("cmd_stop",int,callback)

    naviServer=actionlib.SimpleActionServer("graph_navi",graph_naviAction,run,False);
    naviServer.start();
    rospy.spin();
