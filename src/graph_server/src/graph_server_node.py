#!/usr/bin/env python
import sys
import rospy
import rosparam
from graph_server.srv import* 
import networkx as nx
from graph_file import Graph_file
from geometry_msgs.msg import PoseStamped
import tf
class graph:

    def __init__(self,file_name):

        gFile=Graph_file();
        self.G=gFile.read_file(file_name);
        rospy.init_node("graph_server")
        self.srv_minimal_path=rospy.Service("minimal_path",GraphPath,self.minimal_path);
        self.srv_get_node_info=rospy.Service("get_node_info",NodeInfo,self.get_node_data);
        rospy.spin();
        return

    def minimal_path(self,node):
        #print node.start
        #print node.goal
        route=nx.dijkstra_path(self.G,node.start,node.goal)
        lange=nx.dijkstra_path_length(self.G,node.start,node.goal)
        #print route
        return {'path':route,'lange':lange }
    def point_to_pose(self,x,y,z):
        pose=PoseStamped()
        
        pose.pose.position.x=x
        pose.pose.position.y=y
        pose.pose.position.z=z
        
        q=tf.transformations.quaternion_from_euler(0,0,0)

        pose.pose.orientation.x=q[0];
        pose.pose.orientation.y=q[1];
        pose.pose.orientation.z=q[2];
        pose.pose.orientation.w=q[3];

        return pose
    def get_node_data(self,node_name):
        node=self.G.nodes[node_name.node_id]

        if 'Point'in node:
            pose=self.point_to_pose(node['Point']['point']['x'],node['Point']['point']['y'],node['Point']['point']['z'])
        else:
            pose=self.point_to_pose(node['Pose']['pose']['position']['x'],node['Pose']['pose']['position']['y'],node['Pose']['pose']['position']['z'])
        
        return {'pose':pose}
if __name__=="__main__":

    rospy.init_node("graph_server")
    graph_file_path=rosparam.get_param("graph_file");
    grp=graph(graph_file_path);

