---
title: 算法
date: 2022-04-19 15:03:57
tags:
- 面试
---


[![不同算法的时间复杂度](https://s1.ax1x.com/2022/04/19/LBSN8S.png)](https://imgtu.com/i/LBSN8S)



前缀和

一维前缀和

二维前缀和


第一题就是基本的读入字符串排序，忘记细节了。

第二题是读入一01串，对应的下标为士兵的能力，0代表攻击士兵，1代表防守士兵，找到一个分割点，使得左侧攻击士兵和右侧防御士兵差的绝对值最小。这题直接用一个求和数组记录遍历就能过。

第三题是给定一个数组，删掉下标不为质数的值，然后合并起来循环操作，求最后一个数。这题是能找到规律，在某个区间的答案会是一个定值。直接暴力解了。

第四题是给多个环形链表的部分（可以重叠），把他们串起来然后切开形成最小字典序。这题主要是记录一下链表顺序，正逆比较一下就可以

第五题买股票进阶版，给定本金，每天都可以买入卖出1笔，而且可以手里留存多笔股票，求最大利润。这题不太会做，暴力DFS做的只过了50，蹲个大佬

做了4个半，最近一个月才开始补算法，难点的题就做不出来了，以及我是用python写的，可能时间复杂度要求和C++比会有些差别

作者：Powter
链接：https://leetcode-cn.com/circle/discuss/aWwMc8/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

# 参考资料
- **前缀和**  https://blog.csdn.net/m0_46201544/article/details/122371482
- **前缀异或** https://blog.csdn.net/weixin_50248461/article/details/117045421
- **Codeforces游玩攻略** https://www.luogu.com.cn/blog/ezoixx130/codeforces-tutorial
- **Codeforces快速精通** https://www.luogu.com.cn/blog/ezoixx130/codeforces-advanced-tutorial
- **ACM-高精度模板(综合篇)** https://blog.csdn.net/u013615904/article/details/43373601

- **C++ lambda表达式与函数对象** https://www.jianshu.com/p/d686ad9de817

- https://codeforces.com/blog/entry/66715
- https://codeforces.com/blog/entry/66909