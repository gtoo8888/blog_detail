# BlogDetail
博客的具体内容

# 命名规则

1. 文件夹名大驼峰
2. 文件名大驼峰
   1. 对于三个或以上字母的,或者是一个句子的,可以考虑使用-连接单词
3. 尽量遵循专有名词的大小写规范
4. 有时候某个文件和是项目开发时候的学习资料,会放置在相似的位置,在开发以后移到正确的位置

| 原名     | 缩写 |
| -------- | ---- |
| Install  | Inst |
| Tutorial | Tut  |

# 文件夹内容

```shell
> tree /f                       # 目录生成指令
├─Grammar                       # 语言语法相关:C++,GoLang,python
├─Course                        # 比较系统性的学科的内容会放在这里:软件工程,k8s,docker之列的
│  ├─Base                           # 基础课程:计算机网络,操作系统
│  ├─ML                             # 机器学习:深度学习相关的:语义分割,机器学习的知识
│  ├─BridsKitchen                   # 鸟哥的私房菜:主要是Linux指令相关的笔记
│  └─_MIT-6.828                     # MIT6.826课程学习,鸽子
├─Tutorial                      # 工具说明:小工具的使用教程
│  └─LinuxDevEnv                    # 针对于Linux下环境的工具很多,单独放在一个文件夹汇总
├─EnvConfige                    # 安装环境教程:docker,ubuntu,minio安装
├─InterviewQ&A                  # 面试相关:每个语言有对应内容,相对大长串的面经,需要记录链接的
├─Others                        # 杂项文件:如何烧饭,怎么做PPT
├─Project                       # 自己想做的项目,以及未来想做的项目
│  ├─GtooPlayer                     # 对于单独的项目,内容比较多的,会单独建文件夹,
│  │                                # 尽量不要放在这里,放到对应的项目README里面
│  └─LinuxNetworkProgram
│      ├─ChenShuoMuduo
│      └─HeimaNetworkProgram
└─Reflection                    # 自己的一些思考
```

