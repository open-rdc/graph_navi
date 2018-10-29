#! /usr/bin/env python
#coding:utf-8
import rospy
import itertools
import tf
import math
from graph_server.srv import *
class Path_maker:
    def __init__(self):
        rospy.loginfo("start")
        rospy.wait_for_service('/minimal_path')
        rospy.wait_for_service('/get_node_info')
        rospy.loginfo("wakup")

    #任意のチェックポイントを順番に通る経路(通過するnode)を計算
    def get_path(self,route=[],stop_size=99999999):
        sum_weight=0;
        path=[]
        min_path=rospy.ServiceProxy('/minimal_path',GraphPath)
        #スタートからゴールまでのノードとその重みを計算
        for (s,g) in zip(route[:-1],route[1:]):
            #sからgまでの重みを計算
            conter=min_path(s,g); 
            sum_weight+=conter.lange
            path.extend(conter.path[:-1])
            if(sum_weight>stop_size):
                print "braek"
                break;
        path.append(route[-1])
        return path,sum_weight

    #ノード情報を取得する(この場合位置情報)
    def get_route(self,path):
        route=[]
        get_info=rospy.ServiceProxy('/get_node_info',NodeInfo)
        for i in path:
            info=get_info(i)
            route.append(info.pose)
        return route
    #任意のチェックポイントを通過する最短経路を求める
    def minimal_path(self,start,goal,waypoint=[]):

        path_list=[]
        min_path_list=[]
        min_weight=9999999;
        #waypointに到達する順番の全パターンを求める。
        wplist=list(itertools.permutations(waypoint))#waypointの順列計算

        #求めたすべての経路を評価する
        for w in wplist:
            route=list(w);#タプルからリストに変換
            #pathにスタートとゴールを追加する。
            route.insert(0,start)
            route.append(goal)
     
            #指定ルート上での経路と重みを計算
            [path_list,weight]=self.get_path(route,min_weight);

            if (min_weight>weight):
                del min_path_list[:];
                min_path_list.extend(path_list);
                min_weight=weight

        route_list=self.get_route(min_path_list)
        self.add_direction(route_list);

        return [min_path_list,route_list];

    def add_direction(self,path):
        for i in range(len(path)-1):
            dx=path[i+1].pose.position.x-path[i].pose.position.x
            dy=path[i+1].pose.position.y-path[i].pose.position.y
            print dx
            print dy
            print ""

            z=math.atan2(dy,dx)

            q=tf.transformations.quaternion_from_euler(0,0,z);
            path[i].pose.orientation.x= q[0];
            path[i].pose.orientation.y= q[1];
            path[i].pose.orientation.z= q[2];
            path[i].pose.orientation.w= q[3];
if __name__=="__main__":
    rospy.init_node("graph_route")
    pathMaker=Path_maker()
    print pathMaker.minimal_path(0,10,[2,3])

         
