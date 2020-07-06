# graph_navi

## パッケージの概要  
* YAMLファイルで記述されたノードとエッジの情報によるダイクストラ法を用いた最短経路計画  
* 経路計画にはnetworkxというライブラリを用いて実装しています。

## 動作環境  
* Ubuntu16.04 Ubuntu18.04
* Python 2.7.17
* ROS melodic kinetic

## 環境構築  
* pip install -U networkx matplotlib

## ビルド  
* cd ~/catkin_ws/src && catkin build graph_navi/graph_navigation graph_navi/graph_maker graph_navi/graph_server  


## 実行方法  
`roslaunch graph_navigation graph_navigation.launch`  
* これを立ち上げると`/graph_navi`という型のアクションサーバーが起動します。その状態で以下ソースコードのようにアクションクライアントを送信してください。   
https://github.com/open-rdc/graph_navi/blob/master/graph_navigation/src/starter.py

* 上記サンプルのgoal.startとgoal.goal,goal.checkpointがそれぞれ経路計画の始点、終点、経由点になっています。引数の数字はノードのidを示しています。  

## ノードとエッジ情報のファイルフォーマット  
* ノードとエッジの情報は、YAMLファイル（ブロックスタイル）で管理されています。  
https://github.com/open-rdc/graph_navi/blob/master/graph_navigation/graph/TsudanumaGraph.yaml

## TODO  
* エディタの開発  
* YAMLファイルの自動生成
