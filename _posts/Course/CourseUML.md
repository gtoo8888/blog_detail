---
title: UML教程
date: 2023-12-10 21:28:56
tags:
- 课程
---

# UML图的种类

统一建模语言（UML）是一种用于软件工程和系统设计的标准建模语言
UML提供了一组图形符号和规则，用于描述系统的不同方面。主要的UML图种类包括：

1. **用例图（Use Case Diagrams）：** 用于描述系统与外部实体（称为参与者）之间的功能需求和交互。

2. **类图（Class Diagrams）：** 用于显示系统中的类、类之间的关系以及类的属性和方法。

3. **时序图（Sequence Diagrams）：** 描述系统中的对象之间的交互顺序，尤其是在特定场景下的交互顺序。

4. **协作图（Collaboration Diagrams）：** 类似于时序图，描述对象之间的协作关系，但强调对象之间的合作而不是时序。

5. **状态图（State Diagrams）：** 描述对象在其生命周期中所经历的状态及状态之间的转换。

6. **活动图（Activity Diagrams）：** 描述系统中的活动流程，展示系统中各个活动的顺序和条件。

7. **组件图（Component Diagrams）：** 描述系统中的组件及其相互关系，强调系统的组织结构。

8. **部署图（Deployment Diagrams）：** 描述系统中软件和硬件之间的物理部署关系。

这些UML图形成了一个完整的模型，帮助软件开发团队以一种可视化和标准化的方式理解、设计和交流系统的不同方面。在实际应用中，通常会同时使用多种类型的UML图，以全面而清晰地描述系统。


## 比较重要的

1. 用例图
2. 类图
3. 时序图


# 绘制UML图的工具

有许多工具可用于绘制和编辑UML图，这些工具提供了图形界面，使用户能够轻松地创建、修改和分享UML图。以下是一些常见的UML建模工具：

1. **Enterprise Architect：** 由Sparx Systems提供的工具，支持多种UML图，包括用例图、类图、时序图等。

2. **Visual Paradigm：** 提供了丰富的UML建模功能，包括用例建模、类建模、时序建模等，同时支持团队协作。

3. **IBM Rational Software Architect：** 适用于大型企业项目，提供广泛的建模和分析工具，包括UML和其他建模语言。

4. **Astah UML：** 以易用性和轻量级著称，适用于个人和小型团队，支持多种UML图形。

5. **Lucidchart：** 一个基于云的协作平台，支持绘制UML图和其他流程图，可通过浏览器进行在线编辑。

6. **Draw.io：** 一个免费的在线图形编辑工具，支持UML图和其他类型的图表，可用于快速创建简单的UML图。

7. **Umbrello UML Modeller：** 一个开源的UML建模工具，适用于Linux和Windows平台，提供用例图、类图等功能。

8. **PlantUML：** 不同于传统图形界面的工具，PlantUML是一种使用文本描述语言创建UML图的工具，通过文本文件定义UML图形，然后生成图像。

选择UML建模工具通常取决于项目的规模、团队的需求和个人的喜好。大多数工具提供了多种导出和共享选项，以便在团队成员之间方便地分享和合作。


# 类图

在UML类图中，两个对象之间可以存在不同类型的关系，这些关系用于描述对象之间的连接和交互。以下是一些常见的类图关系：

1. **关联关系（Association）：** 描述两个类之间的连接，表示一个类对象与另一个类对象之间存在某种关联。关联关系可以是双向的，也可以是单向的。

2. **聚合关系（Aggregation）：** 表示一种弱的拥有关系，表示整体与部分之间的关系。聚合关系用空心菱形表示整体，与实线连接的部分。

3. **组合关系（Composition）：** 表示一种强的拥有关系，整体对象负责部分对象的生命周期。组合关系用实心菱形表示整体，与实线连接的部分。

4. **泛化关系（Generalization）：** 表示继承关系，表示一个类是另一个类的子类。泛化关系使用带有三角箭头的实线表示。

5. **依赖关系（Dependency）：** 表示一个类依赖于另一个类，当一个类的变化可能影响到另一个类时，就存在依赖关系。依赖关系用虚线箭头表示。

6. **实现关系（Realization）：** 表示一个类实现了一个接口，用带三角箭头的虚线表示。

7. **关联类关系（Association Class）：** 表示关联关系中的关联类，即一个具有属性和方法的类，用在关联线上。

8. **约束关系（Constraint）：** 表示对类或关系的一些限制条件，通常使用注释或标签进行表示。

这些关系可以组合使用，以更全面地描述系统中对象之间的关系和交互。在类图中，关系的选择取决于系统的设计需求和建模目的。

| 关系类型               | 缩写                        | 描述                                                                                      |
|----------------------|---------------------------|-------------------------------------------------------------------------------------------|
| 关联关系  | Association                     | 描述两个类之间的连接，表示一个类对象与另一个类对象之间存在某种关联。                     |
| 聚合关系  | Aggregation                       | 表示一种弱的拥有关系，表示整体与部分之间的关系。聚合关系用空心菱形表示整体，与实线连接的部分。 |
| 组合关系  | Composition                      | 表示一种强的拥有关系，整体对象负责部分对象的生命周期。组合关系用实心菱形表示整体，与实线连接的部分。 |
| 泛化关系 | Generalization                       | 表示继承关系，表示一个类是另一个类的子类。泛化关系使用带有三角箭头的实线表示。           |
| 依赖关系   | Dependency                       | 表示一个类依赖于另一个类，当一个类的变化可能影响到另一个类时，存在依赖关系。               |
| 实现关系  | Realization                      | 表示一个类实现了一个接口，用带三角箭头的虚线表示。                                      |
| 关联类关系  | Association Class           | 表示关联关系中的关联类，即一个具有属性和方法的类，用在关联线上。                        |
| 约束关系    | Constraint                | 表示对类或关系的一些限制条件，通常使用注释或标签进行表示。                             |



# 参考资料

https://blog.csdn.net/biezhihua/article/details/43793729