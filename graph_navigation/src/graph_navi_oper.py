import rospy
import actionlib
from graph_navigation.msg import*
class GraphNaviOper:
	def __init__(self):
		rospy.init_node("graph_navi_oper");
		self.graph_navi_action=actionlib.SimpleActionClient('graph_navi',graph_naviAction);
		self.graph_navi_action.wait_for_server();

		rospy.Subscriber("startr", String, callback);#スタートTopic
		rospy.Subscriber("startr", String, callback);#リスタートTopic
		rospy.Subscriber("startr", String, callback);#一時停止Topic

		self.navi_goal=graph_naviGoal();
		self.navi_feedback=graph_naviFeedback();

		self.arrival_point=0;
		self.current_point=0;

	def start(self,start,goal,checkPoint=[]):

		self.navi_goal.start=start;
		self.navi_goal.goal=goal;
		self.checkPoint=checkPoint;
		#ナビゲーション開始
		self.graph_navi_action.send_goal(self.navi_goal);
		return
	def restart(self):
		#ナビゲーション再開(startとgoalとチェックポイント)
	def detour(self):
		#Edgeを削除
		#startは現在地
		#通過済みチャックポイントを削除
		#ナビゲーション再開
		self.restart();
	def stop(self):
		#graph_navigationのゴールをキャンセル
		#move_baseのゴールをキャンセル
