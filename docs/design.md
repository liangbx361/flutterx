# 设计文档

## 概述

在这个设计文档中，我们将讨论Flutter项目的设计和架构。

## 目录

1. [命名规范](#命名规范)
2. [工程结构](#工程结构)
3. [系统架构](#系统架构)
4. [单元测试]
5. [集成测试]

## 1. 命名规范
参考Flutter SDK内部的命名规范，主要的命名规则如下：

* 目录命名有复数形式，应优先使用复数形式，例如：`modules`、`routes`、`services`。

* 文件命名应采用小写字母和下划线的组合，例如：`xxx_xxx.dart`。

* 类命名应采用大驼峰命名法，例如：`XxxXxx`。

## 2. 工程结构
遵循[GetX设计模式](https://github.com/kauemurakami/getx_pattern)

* app
    * data 业务数据层
        * enums 负责定义业务枚举类型
            * xxx_enum.dart
        * models 负责定义业务模型
            * local 负责定义本地模型
                * xxx_lm.dart
            * remote 负责定义远程模型
                * xxx_rm.dart
            * view 负责定义视图模型
                * xxx_vm.dart
        * repositories 封装业务数据的处理逻辑
            * xxx_repository.dart
        * sources 负责定义数据源
            * local 负责定义本地数据源
                * local_source.dart
            * remote 负责定义远程数据源
                * remote_source.dart
                * xxx_api.dart
                * api_path.dart
        * errors 负责定义业务数据层的错误类型
            * xxx_error.dart
    * modules 业务模块层
        * xxx
            * xxx_page.dart
            * xxx_controller.dart
    * global_widgets 负责定义可复用的组件
        * xxx_widget.dart
    * routes 负责定义页面路由及中间件
        * app_routes.dart
        * app_middlewares.dart
    * core 核心基础层（可根据需要扩展，该模块可以跨APP复用）
        * arch 负责定义架构
        * logger 负责定义日志
        * utils 负责定义工具类
    * values 资源层
        * config.dart
        * colors.dart
        * images.dart
        * themes.dart

## 3. 系统架构
在JoyReels项目中，我们采用了MVC（Model-View-Controller）架构模式。

* Model（模型）：负责处理数据的存储和操作，包括数据的获取、更新和删除等操作。在`app/data/models`目录下，我们将数据模型分为本地模型（`local`）、远程模型（`remote`）和视图模型（`view`）。

* View（视图）：负责通过数据渲染页面。在`app/modules`每个模块下都有对应的视图文件`xxx_page.dart`或者`xxx_view.dart`。

* Controller（控制器）：负责处理业务逻辑和协调模型和视图之间的交互。在`app/modules`每个功能模块都有对应的控制器文件（`xxx_controller.dart`）。

这种架构模式可以有效地将应用程序的不同部分进行解耦，提高代码的可维护性和可测试性。