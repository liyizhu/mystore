项目介绍
本项目为个人学习所写的在线商城前台系统
已经实现的功能模块：
    登陆
    注册
    从数据库查询商品并显示在页面
使用的主要技术：
    前端：html+css+javascript+jquery
    后台：jsp+servlet+jdbc
    数据库连接池：druid连接池
    应用框架：dbutils+beanutils
    
使用说明
1、将整个项目clone到本地，使用idea或者eclipse打开，在IDE中配置tomcat，然后部署项目
2、在mysql数据库中，创建mystore数据库，在数据库中创建表（直接复制最后的sql语句即可）
3、在打开浏览器，访问 http://localhost:8080/mystore
    
    CREATE TABLE `user` (
      `uid` varchar(50) NOT NULL,
      `username` varchar(20) DEFAULT NULL,
      `password` varchar(30) DEFAULT NULL,
      `phone` varchar(20) DEFAULT NULL,
      PRIMARY KEY (`uid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
    CREATE TABLE `orders` (
      `order_id` varchar(50) NOT NULL,
      `user_id` varchar(50) DEFAULT NULL,
      `goods_id` int(32) DEFAULT NULL,
      `time` date DEFAULT NULL,
      PRIMARY KEY (`order_id`),
      KEY `order_user` (`user_id`),
      KEY `order_good` (`goods_id`),
      CONSTRAINT `order_good` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
      CONSTRAINT `order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
    CREATE TABLE `goods` (
      `id` int(32) NOT NULL AUTO_INCREMENT,
      `name` varchar(255) DEFAULT NULL,
      `price` decimal(10,2) DEFAULT NULL,
      `image` varchar(50) DEFAULT NULL,
      `descr` varchar(255) DEFAULT NULL,
      `is_hot` int(1) unsigned zerofill DEFAULT '0',
      `cid` int(50) DEFAULT NULL,
      PRIMARY KEY (`id`),
      KEY `cid` (`cid`),
      CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
    ) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
    
