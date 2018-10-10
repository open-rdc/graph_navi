#coding:UTF-8
import yaml
import networkx as nx
#グラフ情報を保存しておくファイルの操作
class Graph_file:
    def __init__(self):
        pass
    #ファイルを読み込みグラフを出力する。
    #file_name:保存するファイル名
    def read_file(self,file_name):
        G=nx.Graph()
        f=open(file_name,"r++")
        data=yaml.load(f)
        print data
        print data["nodes"]
        #networkxの標準機能でグラフを生成
        G.add_nodes_from(data["nodes"])
        G.add_edges_from(data["edges"])
        f.close()
        #グラフを出力する。
        return G
    #グラフをファイルに保存する
    #graph:保存するグラフ
    #file_name:保存するファイル名
    def make_file(self,graph,file_name):
        nodelist=[]
        edgelist=[]
        for node in list(graph.nodes(data=True)):
            nodelist.append(list(node))
        for edge in list(graph.edges(data=True)):
            edgelist.append(list(edge))

        write_data={"nodes":nodelist,"edges":edgelist}
        print write_data
        f=open(file_name,"w+")
        f.write(yaml.dump(write_data,default_flow_style=False))
        f.close()

if __name__=="__main__":
    """
    G=nx.Graph()
    G.add_node(1,s=1)
    G.add_node(2,s=3)
    G.add_edge(1,2,l=5)
    """
    g_file=Graph_file()
    #g_file.make_file(G,"test_graph.txt")
    print g_file.read_file("graph.yaml").nodes()
