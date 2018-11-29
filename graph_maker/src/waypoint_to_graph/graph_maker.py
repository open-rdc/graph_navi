# coding:UTF-8
import math
import rospy
from geometry_msgs.msg import PointStamped
from geometry_msgs.msg import PoseStamped
import networkx as nx
import yaml
#位置情報を元にグラフを作成する
class Graph_Bilde:
    def __init__(self,G):
        #元のグラフを生成
        self.G=G
        pass
    #位置情報が含まれているノードを追加する
    def add_node_pose(self,node_name,pose):
        """
        pose_info={
                   "header":
                       {"seq":pose.header.seq
                       ,"stamp":pose.header.stamp
                       ,"frame_id":pose.header.frame_id
                       }
                   ,"pose":
                       {"position":
                           {"x":pose.pose.position.x
                           ,"y":pose.pose.position.y
                           ,"z":pose.pose.position.z
                           }
                       ,"orientation":
                           {"x":pose.pose.orientation.x
                           ,"y":pose.pose.orientation.y
                           ,"z":pose.pose.orientation.z
                           ,"w":pose.pose.orientation.w
                           }
                       }
                   }
        self.G.add_node(node_name,Pose=pose_info)
        """
        self.G.add_node(node_name,Pose=pose)
        print self.G.nodes[node_name]

    #グラフにノードを追加（位置情報付き）
    def add_node_point(self,node_name,waypoint_):
        self.G.add_node(node_name,Point=waypoint_)
        print self.G.nodes[node_name]

    def isPoint(self,node_name):
        return "Point"in self.G.nodes[node_name].keys()
    #エッジを追加（ノード間の距離も自動計算）
    def add_edge(self,node_a,node_b):
        if self.isPoint(node_a):
            dx=self.G.nodes[node_a]["Point"]["point"]["x"]
            dy=self.G.nodes[node_a]["Point"]["point"]["y"]
            dz=self.G.nodes[node_a]["Point"]["point"]["z"]
        else:
            dx=self.G.nodes[node_a]["Pose"]["pose"]["position"]["x"]
            dy=self.G.nodes[node_a]["Pose"]["pose"]["position"]["y"]
            dz=self.G.nodes[node_a]["Pose"]["pose"]["position"]["z"]

        if self.isPoint(node_b):
            dx-=self.G.nodes[node_b]["Point"]["point"]["x"]
            dy-=self.G.nodes[node_b]["Point"]["point"]["y"]
            dz-=self.G.nodes[node_b]["Point"]["point"]["z"]
        else:
            dx-=self.G.nodes[node_b]["Pose"]["pose"]["position"]["x"]
            dy-=self.G.nodes[node_b]["Pose"]["pose"]["position"]["y"]
            dz-=self.G.nodes[node_b]["Pose"]["pose"]["position"]["z"]
        #距離を計算する
        l=math.sqrt(math.pow(dx,2)+math.pow(dy,2)+math.pow(dz,2))
        print l
        self.G.add_edge(node_a,node_b,weight=l)

if __name__=='__main__':
    G=nx.Graph()

    g=Graph_Bilde(G)
    Point=PointStamped()
    Point.point.x=3
    Point.point.y=1
    Point.point.z=2
    g.add_node_point(1,{"point":{"x":3,"y":2,"z":4}})

    Pose=PoseStamped()
    Pose.pose.position.x=1
    Pose.pose.position.y=2
    Pose.pose.position.z=3
    g.add_node_pose(2,{"pose":{"position":{"x":7,"y":2,"z":4}}})
    g.add_edge(1,2)
    print G 
