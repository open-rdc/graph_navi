#!//usr/bin/env python
#coding:utf-8
import rospy
import actionlib
from std_msgs.msg import *
from graph_server.srv import *
from graph_navigation.msg import *

class graph_navi_detour:
    def __init__(self):
        self.is_arrival_start=False;
        self.is_stop=False;
        rospy.init_node("graph_navi_detour");
        rospy.Subscriber("graph_navi_detour/edge_rate",Float64,self.get_cost_score)
        self.graph_navi_stoper=rospy.Publisher("/graph_navigation/cmd_stop",Int16);
        #graph_server系のサービスが使えるまで待機
        rospy.loginfo("wait graph_server")
        rospy.wait_for_service('/minimal_path');
        rospy.wait_for_service('/get_edge_weight');
        rospy.wait_for_service('/set_edge_weight');
        #サービスの用意
        self.srv_minimal_path = rospy.ServiceProxy('/minimal_path'   ,GraphPath);
        self.srv_get_weight   = rospy.ServiceProxy('/get_edge_weight',GetWeight);
        self.srv_set_weight   = rospy.ServiceProxy('/set_edge_weight',SetWeight);
        #graph_navigationの準備
        rospy.loginfo("wainr graph_navigation")
        self.graph_navi          = actionlib.SimpleActionClient('graph_navi',graph_naviAction);
        self.graph_navi.wait_for_server();
        self.graph_navi_goal     = graph_naviGoal();
        self.graph_navi_Feedback = graph_naviFeedback();
 
        rospy.loginfo("waikuped")
        self.start();

        rospy.spin();
    def arrival_node_CB(self,fb):
        #現在地を更新
        #チェックポイントを更新
        #次移動するnodeを更新
        self.is_arrival_start=True;
        self.graph_navi_Feedback=fb;
        
    def arrival_goal_CB(self,msg,result):
        self.is_arrival_start=False;
        self.is_stop=True;

    def get_cost_score(self,msg):
        #スタート位置に付いていない場合は処理を飛ばす
        if self.is_arrival_start==False:
            rospy.loginfo("not arrive start")
            return;
        if len(self.graph_navi_Feedback.Unreachable)==0:
            goal=self.graph_navi_goal.goal
        else:
            goal=self.graph_navi_Feedback.Unreachable[0];
        #次のチェックポイントまでのコストを取得
        next_node        = self.graph_navi_Feedback.next_node;
        curent_node      = self.graph_navi_Feedback.curent_node;
        print str(curent_node)+"_"+str(next_node);
        curent_weight    = self.srv_get_weight(curent_node,next_node);
        curent_path      = self.srv_minimal_path(curent_node,goal);
        #コストを倍率で掛け算し、Edgeに代入
        weight           = (curent_weight.weight)*(msg.data);
        self.srv_set_weight(curent_node,next_node,weight);
        #チェックポイントまでの経路を再計算
        path             = self.srv_minimal_path(curent_node,goal);
        rospy.loginfo("weigth="+str(weight));
        rospy.loginfo("path  ="+str(path.path))
        #移動経路が変わっていたらGraphナビゲーションを終了、再起動(現在地からスタート)
        if not(path.path == curent_path.path):
            rospy.loginfo("Changeed Path");
            pass;
        #変わって無かったら初期のコストに戻しておく
        else:
            rospy.loginfo("Unchangeed Path");
            self.srv_set_weight(curent_node,next_node,curent_weight.weight);
    def stop(self):
        self.graph_navi_stoper.publish(1);
        #停止確認
        while self.is_stop==False;

        rospy.loginfo("stop");
        pass;
        
    def start(self,start=1,goal=7,cheak_point=[4]):
        self.graph_navi_goal.start=start
        self.graph_navi_goal.goal=goal
        self.graph_navi_goal.checkPoint=cheak_point
        self.graph_navi.send_goal(self.graph_navi_goal,done_cb=self.arrival_goal_CB,feedback_cb=self.arrival_node_CB);

if __name__=="__main__":
    g_navi=graph_navi_detour();
    
