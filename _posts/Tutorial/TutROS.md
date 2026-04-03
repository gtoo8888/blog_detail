---
title: ROS教程
date: 2023-07-18 17:19:28
tags:
- 教程
---

# ROS 教程

## 一、录制与播放 rosbag

### 录制包（笔记本）
```bash
source ../devel/setup.bash
roscore
roslaunch realsense2_camera rs_camera.launch

# 录制指定话题
rosbag record -O test.bag /camera/imu /camera/color/image_raw /camera/aligned_depth_to_color/image_raw
```

### 播放包（台式机）
```bash
source ~/catkin_ws/devel/setup.bash
roscore

# 运行 ORB_SLAM3（普通版）
cd ~/catkin_ws/src/ORB_SLAM3_dense_loop
rosrun ORB_SLAM3_dense_yolo RGBD-Inertial Vocabulary/ORBvoc.txt Examples/RGB-D-Inertial/d455-211.yaml

# 运行 ORB_SLAM3（YOLO 版本）
rosrun ORB_SLAM3_dense_yolo d455 Vocabulary/ORBvoc.txt Examples/RGB-D-Inertial/d455-211.yaml（RGBD-YOLO）

# 播放录制的包
cd ~/datasets/d455
# rosbag reindex test.bag # 笔记本录制移植到台式可能需要这样，否则直接播放提示op缺失
rosbag play --clock --pause test.bag
```

### 笔记本播放
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
pcl_viewer VSLAMRGBD.pcd              # 查看点云

# 后续处理：点云转八叉树
cd ~/catkin_ws/src/publish_pointcloud
roslaunch publish_pointcloud demo.launch
```

> 注意：点云文件名由代码固定命名，不建议修改。

## 二、常用命令

| 命令 | 说明 |
|---|---|
| `roscore` | 启动 ROS 核心（主节点 + 参数服务器），其他命令之前必须先运行 |
| `rosnode list` | 列出当前运行的节点 |
| `rosnode info <节点名>` | 查看节点详细信息 |
| `rosnode machine` | 查看各机器上的节点 |
| `rostopic list` | 列出所有话题 |
| `rostopic list \| grep <关键词>` | 查找包含关键词的话题 |
| `rostopic type <话题名>` | 查看话题的消息类型 |
| `rostopic info <话题名>` | 查看话题的详细信息 |
| `rostopic hz <话题名>` | 查看话题发布频率 |
| `rospack list` | 列出所有包 |
| `rospack find <包名>` | 查找包路径 |
| `roscd <包名>` | 进入包目录 |
| `rosbag info <包名>` | 查看 bag 文件信息（话题、数量、时长等） |
| `rosbag play --clock --pause <包名>` | 以时钟模式播放包，暂停状态开始 |
| `rosbag play -l <包名>` | 循环播放 |
| `rosbag play -a <包1> <包2>` | 同时播放多个包 |
| `rosbag record -O <名称> <话题1> <话题2>` | 录制指定话题到文件 |
| `rosbag reindex` | 重新生成 bag 文件索引（跨设备传输后可能需要） |
| `rosbag decompress` | 解压压缩的 bag 文件 |
| `rosbag filter <输入> <输出> "条件"` | 按条件过滤消息 |

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

## 三、launch 文件语法

```xml
<launch>
    <node pkg="包名" type="可执行文件名" name="节点名"
          args="" respawn="true" output="screen">
        <!-- respawn: 节点异常退出时自动重启 -->
        <!-- output: 输出到屏幕（默认写入日志） -->
    </node>
    <param name="参数名" value="参数值"/>
    <rosparam command="load" file="$(find 包名)/参数文件.yaml"/>
    <include file="$(find 其他包)/launch/其他.launch"/>
    <remap from="原始话题" to="新话题"/>
    <arg name="参数名" default="默认值"/>
    <group>  <!-- 用于给一组节点设置相同的环境 -->  </group>
</launch>
```

### 调试模式启动节点（gdb）
```xml
<launch>
    <arg name="launch_prefix" default=""/>
    <param name = "use_sim_time" default="" />
    <node pkg="message_filter_example" type="complex_node"
          name="message_filter_example"
          output="screen"
          launch-prefix="xterm -e gdb -ex run --args"/>
</launch>
```

### 带参数启动 ORB_SLAM3
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

## 参考资料

- [ROS 官方文档](https://docs.ros.org/)
