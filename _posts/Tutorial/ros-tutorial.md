---
title: ROS教程
date: 2023-06-07 17:19:28
tags:
- 教程
---

# 自己用的指令
录制包
```bash
source ../devel/setup.bash
roscore
roslauch realsense2_camera rs_camera.launch
rosbag record -O test.bag /camera/imu /camera/color/image_raw /camera/aligned_depth_to_color/image_raw
```

台式机播放包
```bash
source ~/catkin_ws/devel/setup.bash
roscore


cd ~/catkin_ws/src/ORB_SLAM3_dense_loop
rosrun ORB_SLAM3_dense_yolo RGBD-Inertial Vocabulary/ORBvoc.txt Examples/RGB-D-Inertial/d455-211.yaml
rosrun ORB_SLAM3_dense_yolo d455 Vocabulary/ORBvoc.txt Examples/RGB-D-Inertial/d455-211.yaml（RGBD-YOLO）


cd ~/datasets/d455
# rosbag reindex test.bag # 笔记本录制移植到台式可能需要这样，否则直接播放提示op缺失
rosbag play --clock --pause test.bag
```

笔记本播放包
```bash
roscore

cd ~/catkin_ws/src/ORB_SLAM3_dense_loop/
rosrun ORB_SLAM3_dense_yolo RGBD-Inertial Vocabulary/ORBvoc.txt Examples/RGB-D-Inertial/d455-211.yaml 
# YOLO处理时间和闭环检测结果在此处呈现

cd ~/datasets/d455
rosbag play --clock --pause test.bag 
# 等第二个终端输出日志结束，点击地图的Stop停止，终端出现保存点云文件后，在终端中Ctrl+C结束
# 点云文件在代码中已命名关联了，最好不要改，生成文件就叫VSLAMRGBD.pcd，放在~/catkin_ws/src/ORB_SLAM3_dense_loop/下
# 后面点云转八叉树还要用到该点云，所以可以在转化完之后，再把点云重命名为别的

cd ~/catkin_ws/src/ORB_SLAM3_dense_loop/
pcl_viewer VSLAMRGBD.pcd


cd ~/catkin_ws/src/publish_pointcloud
roslaunch publish_pointcloud demo.launch
```

# 常用指令


## roscore
这个命令用于启动ROS的核心功能，包括ROS主节点（master）和参数服务器（parameter server）。在运行其他ROS命令之前，需要先运行roscore。


## rostopic
- 这个命令用于查看和发布ROS系统中的话题信息。可以使用rostopic命令来列出当前可用的话题、查看话题的数据类型、发布消息到话题等。
rostopic list
rostopic list | grep <>
rostopic type <>
rostopic info <>
rostopic hz <>


## rosrun
这个命令用于在ROS软件包中运行指定的节点程序。通过指定软件包名称和节点名称，可以运行相应的ROS节点。

### 调试rosrun
<launch>
    <arg name = "launch_prefix" default="" />
    <param name = "use_sim_time" default="" />
    <node pkg="message_filter_example" type="complex_node" name="message_filter_example" output="screen" launch-prefix="xterm -e gdb -ex run --args"/>
</launch>

<!-- <launch-prefix= "xterm -e gdb --args"> -->


<launch>
  <!-- 设置ORB_SLAM3_dense_yolo节点的参数 -->
  <arg name="vocabulary_file" default="Vocabulary/ORBvoc.txt"/>
  <arg name="config_file" default="Examples/RGB-D-Inertial/d455-211.yaml"/>

  <!-- 启动ORB_SLAM3_dense_yolo节点 -->
  <node pkg="ORB_SLAM3_dense_yolo" type="RGBD-Inertial" name="ORB_SLAM3_dense_yolo_node">
    <param name="vocabulary_file" value="$(arg vocabulary_file)"/>
    <param name="config_file" value="$(arg config_file)"/>
  </node>
</launch>



## rosnode 
- 这个命令用于查看和管理ROS系统中的节点。可以使用rosnode命令来列出当前运行的节点、查看节点的详细信息、关闭节点等。
rosnode list
rosnode machine
## rospack 
- 这个命令用于获取关于ROS软件包的信息。可以使用rospack命令来查找软件包的路径、依赖关系、导出的内容等。
rospack list



## roscd
- 这个命令用于快速切换到ROS软件包的目录。通过指定软件包的名称，可以进入该软件包的目录，方便用户进行包的相关操作。
rospack list
roscd urdf


## roscd
- 这个命令用于记录、播放和操作ROS系统中的数据包（rosbag文件）。可以使用rosbag命令来记录特定话题的数据、回放数据包、提取数据包中的消息等。


## rosbag
```bash
rosbag
rosbag info <> # 包含的话题、消息数量、持续时间等
rosbag record -O <bag name>  # 用于记录ROS系统中的数据
rosbag record -O test.bag /camera/imu /camera/color/image_raw /camera/aligned_depth_to_color/image_raw

rosbag play --clock --pause test.bag
--clock: 使用rosbag文件中的时间戳信息来模拟真实时间
--pause: 这个选项告诉rosbag play在开始播放时暂停，而不是立即开始播放。
rosbag play -a file1.bag file2.bag # 用于同时播放多个rosbag文件
rosbag play -l test.bag # 播放之前记录的rosbag文件


rosbag reindex # 命令重新生成索引文件
rosbag merge file1.bag file2.bag -o merged.bag # 用于合并多个rosbag文件
```


rosbag decompress: 用于解压rosbag文件。如果rosbag文件被压缩，可以使用该命令将其解压缩。示例命令：rosbag decompress test.bag。

rosbag filter: 用于过滤rosbag文件中的消息。可以根据自定义的条件对消息进行过滤，并将过滤后的消息保存到新的rosbag文件中。示例命令：rosbag filter input.bag output.bag "topic == '/topic1'"。






# launch教程


<launch>
    <node .../>
   	<param .../>
    <rosparam .../>
    <include .../>
    <remap .../>
    <arg .../>
    <group>  </group>
</launch>

<node pkg="package_name" type="executable_node" name="node_name" args="$()" respawn="true" output="sceen">

pkg：节点所在功能包的名称package_name；
type：节点类型是可执行文件(节点)的名称executable_node；
name：节点运行时的名称node_name；
args：传递命令行设置的参数；
respawn：是否自动重启，true表示如果节点未启动或异常关闭，则自动重启；false则表示不自动重启，默认值为false；
output：是否将节点信息输出到屏幕，如果不设置该属性，则节点信息会被写入到日志文件，并不会显示到屏幕上。






























































