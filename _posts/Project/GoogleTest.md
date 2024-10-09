---
title: google test
date: 2023-04-14 19:40:49
tags:
- 项目
---


# 1.安装教程
```shell
git clone git@github.com:google/googletest.git
mkdir build && cd build
make -j all
find . -name "*.a" # 查看静态链接库是否生成
make insatll
ls -l /user/local/ # 查看是否安装过去了
```

# 2. demo测试
```shell
cd googletests/samples
g++ ../src/gtest_main.cc sample1.cc sample1_unittest.cc -o sample1 -lgtest -lgmock -lpthread -std=c++14 # 一定要使用C++11以上，C++14或者C++17才能编译通过
```
样例分析：
gtest_main.cc: 测试主程序的入口
sample1.cc：等待测试的源码
sample1_unittest.cc: 测试用例


# 3.写一个自己的测试用例
1.有一个包含GTEST_API_的主函数，引入testing::InitGoogleTest
2.包含头文件gtest/gtest.h
3.使用TEST宏定义，第一个参数是test suite的名字，第二个参数是test case的名字，写自己的测试函数
4.在测试函数中使用EXPECT_EQ,EXPECT_NE,EXPECT_LT,EXPECT_LE,EXPECT_GT,EXPECT_GE
5.在主函数中调用RUN_ALL_TESTS()，返回值是0表示成功，非0表示失败
6.编译，链接gtest库，运行

# 参考资料
[官方文档](https://google.github.io/googletest/)
[github仓库](https://github.com/google/googletest)
[Google Test(GTEST)使用入门（1）- 下载编译安装执行](https://blog.csdn.net/wdcyf15/article/details/108855960)
[Ubuntu 16.04安装gtest遇坑，成功安装及使用记录](https://blog.csdn.net/qq_34525916/article/details/113752768)
[unit-testing-for-c-code-tools-and-methodology](https://stackoverflow.com/questions/91384/unit-testing-for-c-code-tools-and-methodology)
[浅谈GTest与已有CMake项目对接](https://www.jianshu.com/p/21c205251f68)
[Comparison of C++ unit test frameworks [duplicate]](https://stackoverflow.com/questions/242926/comparison-of-c-unit-test-frameworks)


