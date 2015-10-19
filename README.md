## 欢迎来到健康招商后台的地盘
### 本仓库是2014-10新版淘点点招商后台pc改版项目前端仓库。
### kissy文档：http://kissy.taobao.net/
---
目录详情：
	
  > home 首页
  > 

#### 项目维护人员
  - 前端: 潇方 龙俊
  - 开发: 
  - 测试: 
  
打包工具：
  
  > xcake:http://def.taobao.net/?doc/#site/xcake-start


#### assets 目录规划
	   |
	   |-build         [编译后生成]
	   |-demo          [前端demo]
	   |  |-common     [公共部分 比如页头页尾]
       |  |  |_header.php [头]
       |  |  |_footer.php [尾]
       |  |  |_ ...
       |  |-index.php  [入口文件 通过url中配置参数来加载指定的模块]
	   |-src
	   |   |-c         [components 组件,所有非页面的内容全部放在这里]
	   |   | |-ui      [项目的UI组件，例如折叠菜单，面板等]
	   |   | |-utils   [工具类 全局require的内容 包裹global.js mixin.less]
       |   | |-widget  [业务组件]
	   |   |
	   |   |-p         [page脚本，每个page业务逻辑打包成一个js入口文件
	   |   | |-home    [聚合页面名称，例如管理页面可能有多个管理页面，订单管理，交易管理；
       |   | |-|         最终的执行入口只有一个index.js 和index.css， 如果下边有多个页面，则累加]
       |   | |-mods    [依赖模块]
       |   | |-less    [less文件 文件名以'_'开头，例如 _fuck.less]
       |   | |-tpl     [模板文件 例如 list-tpl.html]
       |   | |-orderlist.js [入口文件]
       |   | |-index.less[入口文件]
