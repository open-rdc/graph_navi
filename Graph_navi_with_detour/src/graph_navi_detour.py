#!//usr/bin/env python
#coding:utf-8
import rospy
import actionlib
from graph_navigation.msg import*
from graph_server.srv import *
class graph_navi_detour:
    def __init__(self):
        rospy.init_node("graph_navi_detour");
        #graph_server系のサービスが使えるまで待機
        rospy.wait_for_service('/minimal_path');
        rospy.wait_for_service('/get_node_info');
        rospy.wait_for_service('/get_edge_weigth');
        rospy.wait_for_service('/set_edge_weigth');
        #graph_navigationの起動待機
        self.graph_navi=actionlib.SimpleActionClient('graph_navi',graph_naviAction);
        rospy.spin();
    def arrival_node_CB(self):
        #現在地を更新
        #チェックポイントを更新
        #次移動するnodeを更新
        pass;
    def arrival_goal_CB(self);
        pass;
    def get_cost_score(seff):
        #コストの倍率を取得
        #移動中のEdge(道)のコストを取得
        #コストを倍率で掛け算し、Edgeに代入
        #チェックポイントまでの経路を再計算
        #移動経路が変わっていたらGraphナビゲーションを終了、再起動(現在地からスタート)
        #変わって無かったら初期のコストに戻しておく
        pass;
    def run(self);
        goal=graph_navigationGoal();
        self.graph_navi.send_goal(goal,done_cb=self.arrival_goal_CB,feedback_cb=self.arrival_node_CB);
        pass;

if __name__=="__main__":
    g_navi=graph_navi_detour();
    
