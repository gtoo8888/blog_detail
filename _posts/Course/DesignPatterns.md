---
title: 设计模式学习
date: 2022-05-15 15:08:04
tags:
- 课程
---

# 面向对象的设计原则，五个
SOLID指代了**面向对象编程**和**面向对象设计**的五个基本原则
| 名称 | 缩写 | 全称 | 解释 |
| ------ | ------ | ------ |------ |
|单一职责原则       |SRP        |Single Responsibility Principle        |每个类的职责单一|
|**开闭原则**          |OCP       |Open Closed Principle               |类的改动，增加代码是好的，修改源代码是不好的|
|里氏替换原则       |LSP        |Liskov Substitution Principle       |多态|
|接口隔离原则	    |ISP        |Interface Segregation Principle    |接口隔离|
|**依赖倒置原则**	    |DIP        |Dependence Inversion Principle   |依赖抽象接口|
| ------ | ------ | ------ |------ |
|迪米特法则         |LoD        |Law of Demeter                         |一个对象应当对其他对象少了解|
|组合/聚合复用原则   |CRP   |Composite/Aggregate Reuse Principle            |继承不好，组合好的|

总体原则：高聚合，低耦合


# 6.迪米特法则
解释：
去公司找人修电脑，不应该去找某个具体的小李、小张来修，应该抽象出一个接口类，IT部门，找IT部门修，用抽象接口再去对接实际的类，不然找小张解决不了问题，找小李解决不了问题。
结论：迪米特法则强调了类之间的松耦合关系，类之间的耦合越松，越有利于复用。



# 简单工厂模式
## 概述：
本来每个类都需要new出来，现在是通过一个工厂来创建
## 优点：
1.客户端和具体实现类解耦
2.对于某些对象创建过程比较复杂情况，我们不用考虑这些了
## 缺点：
1.简单工厂模式，增加新的功能是通过修改源代码实现，不符合开闭原则
2.这个类职责过重，这个类发生问题，会影响很多实用这个工厂的模块
## 使用场景：
1.工厂类负责创建的对象比较少，由于创建的对象较少，不会造成工厂方法中个的业务逻辑太过复杂。
2.客户端只知道传入工厂类的参数，对于如何创建对象并不关心。
**解释**：用在不需要关心创建过程，读取什么文件，什么什么的，就想要用这个类
比如创建过程很复杂，但是我只是想用这个类，那我就用这个简单工厂创建一下就行，具体的创建过程都放在工厂里面





# 工厂模式
## 概述：
对于每一个类，都对应一个具体创建的工厂类，然后再定义一个抽象工厂作为接口
简单工厂模式 + “开闭原则” = 工厂方法模式
## 优点：
1.不需要记住具体类名，甚至连具体参数都不用记忆（因为用的是抽象的工厂接口）
2.实现了对象创建和使用的分离。
3.系统的可扩展性也就变得非常好，无需修改接口和原类。（符合开闭原则）
## 缺点：
1.增加系统中类的个数，复杂度和理解度增加。
2.增加了系统的抽象性和理解难度。
## 适用场景
1.客户端不知道它所需要的对象的类。
2.抽象工厂类通过其子类来指定创建哪个对象。



工厂在这里面起的作用，就是隐藏了创建过程的复杂度，以配合InterfaceA对那一百个子类的复杂度进行隐藏，这样B只要知道上转型之后的InterfaceA即可，简单清晰。

# 参考文献
https://blog.csdn.net/weixin_42636062/category_11313224.html?spm=1001.2014.3001.5482












































