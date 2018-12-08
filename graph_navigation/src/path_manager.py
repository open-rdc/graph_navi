#! /usr/bin/env python
#cording:utf-8
class Path_Maneger:
    def __init__(self):
        self.Path=[];
        self.culent=0;

    def set_path(self,path):
        del self.Path[:];
        self.culent=0
        self.Path.extend(path);


    def next_pose(self):
        return self.Path[self.culent]

    def renew(self):
        if((self.culent)>len(self.Path)):
            return False
        self.culent+=1;
        return True

if __name__=="__main__":
    pM=Path_Maneger();
    pM.set_path([1,2,3,4,5,6,7]);
    for i in range(10):
        print pM.next_pose()
        print pM.renew()
