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
        rospy.wait_for_service('/get_edge_weigth');
        rospy.wait_for_service('/set_edge_weigth');
        #サービスの用意
        self.srv_minimal_path = rospy.ServiceProxy('/minimal_path'   ,GraphPath);
        self.srv_get_weigth   = rospy.ServiceProxy('/get_edge_weigth',GetWeight);
        self.srv_set_weigth   = rospy.ServiceProxy('/set_edge_weigth',SetWeight);
        #graph_navigationの準備
        self.graph_navi          = actionlib.SimpleActionClient('graph_navi',graph_naviAction);
        self.graph_navi_goal     = graph_navigationGoal();
        self.graph_navi_Feedback = graph_navigationFeedback();

        rospy.spin();
    def arrival_node_CB(self,fb):
        #現在地を更新
        #チェックポイントを更新
        #次移動するnodeを更新
        self.graph_navi_Feedback=fb;
        
    def arrival_goal_CB(self);
        pass;
    def get_cost_score(seff,msg):
        #コストの倍率を取得
        #移動中のEdge(道)のコストを取得
        culent_weigth = self.srv_get_weigth(start,goal);
        culent_path   = self.srv_minimal_path(start,goal);
        #コストを倍率で掛け算し、Edgeに代入
        weigth=culent_weigth.weigth*msg;
        self.srv_set_weigth(start,goal,weigth);
        #チェックポイントまでの経路を再計算
        path=self.srv_minimal_path(start,goal);
        #移動経路が変わっていたらGraphナビゲーションを終了、再起動(現在地からスタート)
        if path.path == culent_path:
            pass;
        #変わって無かったら初期のコストに戻しておく
        else:
            self.srv_set_weigth(start,goal,culent_weigth.weigth);

    def run(self);
        goal=graph_navigationGoal();
        self.graph_navi.send_goal(goal,done_cb=self.arrival_goal_CB,feedback_cb=self.arrival_node_CB);
        pass;

if __name__=="__main__":
    g_navi=graph_navi_detour();
    
