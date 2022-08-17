---
title: python 语法
date: 2022-02-24 20:47:46
tags:
- 语法
---

# 基础

## inf
Python中可以用如下方式表示正负无穷
```
float("inf")  # 正无穷
float("-inf")  # 负无穷
```
 1. INF做加法、乘法等算数运算仍然会的到inf：
 2. 除了 INF 外的其他数除以 INF ，会得到0：
 3. 任何其他的数值除以 INF 都会得到 INF， 因为INF表示正无穷
 4. 如果 INF 涉及到 < 和 > 不等式的问题，所有数都比 -inf 大，所有数都比 +inf 小就可以了。

# Numpy

## np.mean()
np.mean()函数功能：求取均值
经常操作的参数为axis，以m * n矩阵举例：
axis 不设置值，对 m*n 个数求均值，返回一个实数
axis = 0：压缩行，对各列求均值，返回 1* n 矩阵
axis =1 ：压缩列，对各行求均值，返回 m *1 矩阵

```
np.mean(num1,0)
num1 = np.array([[1,2,3],[2,3,4],[3,4,5],[4,5,6]])
num2 = np.mat(num1)

ans = np.mean(num1,0)
3.5
ans = np.mean(num1,0) # 压缩行，对各列求均值
matrix([[ 2.5,  3.5,  4.5]])
ans = np.mean(num1,1) # 压缩列，对各行求均值
matrix([[ 2.],
        [ 3.],
        [ 4.],
        [ 5.]])
```

## np.fliplr()
将数组在左右方向上翻转
```
arr = np.array([[[0,1],[2,3]],[[4,5],[6,7]]], dtype=float)
print(arr)
print(np.fliplr(arr))

[[[0,1], [2, 3]]
 [[4,5], [6, 7]]]

[[[2, 3], [0, 1]]
 [[6, 7], [4, 5]] ]
```
    px, py = np.transpose(np.flipud(np.fliplr(path)))

## np.flipud()
翻转列表，将矩阵进行上下翻转
```
arr=np.diag([1,2,3,4]) #diag用于声明对角矩阵
print(arr)
print(np.flipud(arr))
[[1 0 0 0]
 [0 2 0 0]
 [0 0 3 0]
 [0 0 0 4]]

[[0, 0, 0, 4],
 [0, 0, 3, 0],
 [0, 2, 0, 0],
 [1, 0, 0, 0]]
```


## np.transpose()
transpose在不指定参数是默认是矩阵转置
```
arr = np.arange(4).reshape((2,2))
[[0, 1],
[2, 3]]

[[0, 2],
[1, 3]]
```




# 求维数，求长宽

data = np.array([
		[1,2,3],
		[4,5,6],
		[7,8,9],
		[0,0,0]
	])


print(data)
print(data.ndim)
print(data.shape) 

2
(4, 3)

# Math

## math.ceil()
ceil() 向上取整
```
ans = math.ceil(-45.17) : -45.0
ans = math.ceil(100.12) :  101.0
```











