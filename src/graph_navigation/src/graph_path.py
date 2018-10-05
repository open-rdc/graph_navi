import matplotlib.pyplot as plt
import math
import itertools
import networkx as nx
"""
Grath=nx.Graph()
Grath.add_node('S')
Grath.add_node(1)
Grath.add_node(2)
Grath.add_node(3)
Grath.add_node(4)
Grath.add_node(5)
Grath.add_node(6)
Grath.add_node('G')

Grath.add_edges_from([(6,'G'),(6,3),('S',1),(1,5),('S',2),(1,2),(2,3),('G',4),(3,4),(3,5),(4,5)],weight=1)

#print Grath.nodes(data=True)
#nx.draw_networkx(Grath)
G1=nx.shortest_path(Grath, source='S', target='G')

#print nx.shortest_path_length(Grath,source='S',target='G')
#print list(itertools.permutations([2,4,7]))

class Glath_build:
    def __init__(self):
        pass
    def set_node(self,name,posi):
        self.glath.add_node(name,posi)
        nx.set_node_attributes(self.glath,name,position=posi)
    def set_edges(self,source,target):
        dx=self.glath.nodes[][]
        self.glath.add_edge(source,target)
"""

class Graph_Path:
    def __init__(self,glath):
        self.G_map=glath
        self.path=[]
        self.nextPoint=0
    def minimum_path(self,source='S', target='G',waypoints=[]):
        numRow=math.factorial(len(waypoints))
        numCol=len(waypoints)+2
        path_list=[[0 for col in range(numCol)] for row in range(numRow)]
        
        path_size_list=[]
        for (point,i) in zip(itertools.permutations(waypoints),range(numRow)):

            path_list[i][0]=source
            for p,k in zip(point,range(1,len(waypoints)+1)):
                path_list[i][k]=p
            path_list[i][numCol-1]=target

            path_size=0
            for (j,k) in zip(path_list[i][0:-1],path_list[i][1:]):
                path_size+= nx.shortest_path_length(self.G_map,source=j,target=k) 

            path_size_list.append(path_size)
        return path_list[path_size_list.index(min(path_size_list))]

    def make_path(self,source='S', target='G',waypoints=[]):
        del self.path[:]
        self.path=[source]
        waypoint_path=self.minimum_path(source,target,waypoints)
        for i,j in zip(waypoint_path[0:-1],waypoint_path[1:]):
            self.path.extend(nx.shortest_path(self.G_map, source=i, target=j)[1:])
	return self.path

    def next_point(self):
        self.next_point+1
        return self.path[self.next_point]

    def last_point(self):
        return self.path[self.next_point]

            

if __name__=='__main__':
    g_map=Graph_Path(Grath);
    plt.figure(figsize=(15,15))
    pos = nx.spring_layout(Grath)
    nx.draw_networkx(Grath,pos)
    plt.axis("off")
    plt.savefig("default.png")
    plt.pause(1)
    #plt.show()

    waypoint=[]
    while(1):
        print "set waypoint"
        point=input()
        if point=='E':
             break

        waypoint.append(point)
    print g_map.make_path('S','G',waypoint)

    #plt.show()
    input() 
