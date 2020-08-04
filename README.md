# 后台管理系统

    ├─.idea
    ├─src --------主目录
    │  ├─main
    │  │  ├─java
    │  │  │  ├─com
    │  │  │  │  └─blog    
    │  │  │  │      └─manager
    │  │  │  │          ├─common   ---- 存放工具类
    │  │  │  │          │  └─utils
    │  │  │  │          ├─config   ---- 配置
    │  │  │  │          ├─controller  --- controller控制器
    │  │  │  │          │  └─system
    │  │  │  │          ├─dao        ---- dao层
    │  │  │  │          ├─dto    ----个人理解算是包装实体类的辅助类吧
    │  │  │  │          ├─filter  ----filter
    │  │  │  │          ├─pojo    ---- entity
    │  │  │  │          ├─response  ---- 这个目录结构应该怼到utils里
    │  │  │  │          ├─service  ---- service
    │  │  │  │          │  └─impl
    │  │  │  │          └─shiro   ---- realm 存放处
    │  │  │  └─tk  --- 这个是tk mybatis集成的要求，具体的可以看看tk的文档
    │  │  │      └─mapper
    │  │  └─resources
    │  │      ├─config    ----config
    │  │      ├─mapper    ----mybatis的mapper.xmls存放位置，在配置文件中指定该目录
    │  │      ├─sql       ------sql
    │  │      ├─static    -----js+css+images
    │  │      │  ├─css
    │  │      │  ├─images
    │  │      │  ├─js
    │  │      └─templates  ----- htmls


## 后端：
SpringBoot  2.1.0  
mybatis-plus 3.0.5  
Shiro  1.3.1  
## 前端：
Layui  2.4.5  
JQuery  3.3.1
（虽然不如react、vue等人气多，我觉得还行，上手快）
## 渲染模板
Thymeleaf 

## 部署
 blog2.sql脚本
 application.yml 数据库连接信息改成你自己的
 application.java 启动
 账号密码都是 admin
 ### 首页
 ![在这里插入图片描述](http://a1.qpic.cn/psc?/V10tkViL1pv1uh/w47sCHZ1vIeYe.9hWkknXQPnkOGAAdYWrf.dL5K34e7f.QEpuJZ7*momxhmAiZoh7xf*2iATxBcqXAHJjhYFiw!!/c&ek=1&kp=1&pt=0&bo=WgfxAwAAAAADR80!&tl=1&vuin=875881505&tm=1593079200&sce=60-2-2&rf=viewer_4&t=5)
 ### 项目首页
 ![在这里插入图片描述](http://chuantu.xyz/t6/739/1594115684x-633054266.png)
   
## 整合druid
  ### img1
 ![在这里插入图片描述](http://chuantu.xyz/t6/739/1594115140x-633054266.png)
 ### img2
 ![在这里插入图片描述](http://chuantu.xyz/t6/739/1594115268x-591238492.png)
 
## 整合p6spy，控制台打印sql，请自行研究spy.properties
 ![在这里插入图片描述](http://chuantu.xyz/t6/739/1594115442x-591238492.png)

## 重写前台的js，统一书写风格，后期考虑继续封装，比如封装统一请求，统一异常，统一layui的open，layui的submit
![在这里插入图片描述](http://chuantu.xyz/t6/739/1594116175x-591238492.png)






"# ybt-front-app" 
"# ybt-front-app" 
