#! /usr/bin/env python
#coding:utf-8
import path_maker
import path_manager

class Guid:
    def __init__(self):
        self.PathMaker=path_maker.Path_maker()
        self.PoseManeger=path_manager.Path_Maneger()
        self.PathManeger=path_manager.Path_Maneger()

    def make_route(self,start,goal,checpoint=[]):
        #経路を生成
        print "make_route"
        [path,route]=self.PathMaker.minimal_path(start,goal,checpoint)
        #生成した経路を保存
        self.PoseManeger.set_path(route)
        self.PathManeger.set_path(path)
    def get_pose(self):
       
        node_name= self.PathManeger.next_pose()
        pose=self.PoseManeger.next_pose()
        return [node_name,pose]

    def next_pose(self):
        #次進むべきPoseを出力(進む)
		if(False==self.PoseManeger.renew() or False== self.PathManeger.renew()):
			return False;
		else:
			return True;

if __name__=="__main__":
    guid=Guid()
    print "making_route"
    guid.make_route(1,10,[2,5,3])
    for i in range(4):
        print guid.next_pose()
