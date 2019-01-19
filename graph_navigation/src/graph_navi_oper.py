#!/usr/bin/env python
#! -*- coding: utf-8 -*-
import rospy
import actionlib
from std_msgs.msg import String 
from graph_navigation.msg import*

class GraphNaviOper:

	def __init__(self):
		rospy.init_node("graph_navi_oper");
		self.graph_navi_action=actionlib.SimpleActionClient('graph_navi',graph_naviAction);
		self.graph_navi_action.wait_for_server();

		#操作指示
		rospy.Subscriber("startr", start, self.start_callback);#スタートTopic
		rospy.Subscriber("restartr", String, self.restart_callback);#リスタートTopic
		rospy.Subscriber("stop", String, self.stop_callback);#一時停止Topic
		rospy.Subscriber("detour",String, self.detour_callback);#迂回Topic

		#action定義
		self.navi_goal=graph_naviGoal();
		self.navi_feedback=graph_naviFeedback();

		#
		self.pub_=rospy.Publisher("stop",String,queue_size=1);
		'''
		self.arrival_point=0;
		self.current_point=0:
		'''
		rospy.loginfo("waikup!!");
		rospy.spin();
	def start_callback(self,msg):
		self.start(msg.start,msg.goal,msg.check_point);
	def feedback_callback(self,feedback):
		self.feedback=feedback;

	def restart_callback(self,msg):
		self.start(self.feedback.nextPoint,self.navi_goal.goal,self.navi_goal.checkPoint);
	def detour_callback(self,msg):
		pass;
	def stop_callback(self,msg):
		self.stop();

	def start(self,start,goal,checkPoint=[]):

		self.navi_goal.start=start;
		self.navi_goal.goal=goal;
		self.checkPoint=checkPoint;
		#ナビゲーション開始
		self.graph_navi_action.send_goal(self.navi_goal,feedback_cb=self.feedback_callback);
		return
	def restart(self):
		#ナビゲーション再開(スタートは現在値)
		self.start(self.feedback.arrivedPoint,self.navi_goal.goal,self.navi_goal.checkPoint);
	def detour(self):
		#Edgeを削除
		#ナビゲーション再開
		self.restart()
	def stop(self):
		#graph_navigationのゴールをキャンセル
		self.graph_navi_action.cancel_goal();
		#move_baseのゴールをキャンセル
		self.pub_.publish("test");

GraphNaviOper();
