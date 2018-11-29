#!/usr/bin/env python
# coding:UTF-8
from graph_maker import Graph_Bilde
from file_maker import File_maker
from graph_file import Graph_file
import networkx as nx
import yaml
import rospy
import rosparam
class a:
    def __init__(self):
        pass
    def generate_graph_file(self,waypoint_file_name,edge_file_name,graph_file_name):
        #ファイルを用意
        f_waypoint=open(waypoint_file_name,"r+");#waypointが収納されているファイル
        f_edge=open(edge_file_name,"r+")#edge情報が収納されているファイル
        f_maker=File_maker()
        GraphFile=Graph_file()
        #waypointを読み込む
        waypoints=yaml.load(f_waypoint);
        #書き込み用のグラフを用意する。
        graph=nx.Graph();
        GraphBilder=Graph_Bilde(graph);

        #読み込んだwaypointをグラフのノードに追加する
        for i,point in enumerate(waypoints["waypoints"]):#waypoint一覧を取り出す。
            #ノード名：waypointの要素番号
            GraphBilder.add_node_point(i,point)

        #finishsposeを追加する。
        GraphBilder.add_node_pose("finish_pose",waypoints["finish_pose"])

        edge_list=yaml.load(f_edge)
        for i in range(len(edge_list)):
            GraphBilder.add_edge(edge_list[i][0],edge_list[i][1]);
            
        GraphFile.make_file(graph,graph_file_name)
        f_waypoint.close()

if __name__=="__main__":
    rospy.init_node("waypoint_to_graph_node");

    waypoint_file=rosparam.get_param("/graph_maker/waypoints_file")
    edge_file=rosparam.get_param("/graph_maker/edge_file")
    graph_file=rosparam.get_param("/graph_maker/graph_file")

    test=a();
    test.generate_graph_file(waypoint_file,edge_file,graph_file)
