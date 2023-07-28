# FlutterX

Flutter工程实践

## 项目分层设计
遵循[GetX设计模式](https://github.com/kauemurakami/getx_pattern)

* app
    * data
        * enum
        * service 封装业务逻辑
            * xxx_service.dart
        * repository 封装数据访问逻辑
            * xxx_repository.dart
        * source 数据源
            * local 封装本地数据源
            * remote 封装远程数据源
            * cache 封装缓存数据源
        * model 领域对象
    * modules
    * global_widgets
    * routes
    * core
        * errors
        * values
        * theme
        * utils
        * log

## 组件选型
* GetX
* dio
* shared_preferences