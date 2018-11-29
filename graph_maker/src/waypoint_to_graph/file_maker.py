# coding:utf-8
import yaml
from geometry_msgs.msg import PointStamped
from geometry_msgs.msg import PoseStamped

class File_maker:
    def __init__(self):
        self.waypoints=[]#waypointを収納

    #waypointを追加する
    def add_waypoint_point(self,node):
        self.add_waypoint_xyz(node["Point"]["point"]["x"],node["Point"]["point"]["y"],node["Point"]["point"]["z"])
    def add_waypoint_xyz(self,x,y,z):
        self.waypoints.append({"point":{"x":x,"y":y,"z":z}})
    #finish_poseを追加（ゴールのみ）
    def set_finish_pose(self,finish_pose):
        self.finishpose=finish_pose
    #ファイルを生成する。
    def generat_file(self,file_name="test.yaml"):
        f=open(file_name,"w+")
        data={"waypoints":self.waypoints}
        print data["waypoints"]
        f.write(yaml.dump(data,default_flow_style=False))
        
        data={"finish_pose":self.finishpose}
        f.write(yaml.dump(data,default_flow_style=False))
  
        f.close()
    #ファイルを読み込む
    def load_file(self,file_name="test.yaml"):
        f=open(file_name,"r+")
        data=yaml.load(f);
        print data
        f.close()
        return data
if __name__=="__main__":
    f_make=File_maker()
    Point=PointStamped()
    Point.point.x=3
    Point.point.y=1
    Point.point.z=2
    Pose=PoseStamped()
    Pose.pose.position.x=3
    Pose.pose.position.y=3
    Pose.pose.position.z=3
    f_make.add_waypoint_xyz(1,3,5)
    f_make.set_finish_pose(Pose)
    f_make.generat_file("test.yaml")
    f_make.load_file("test.yaml")
