/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : blog1

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 02/06/2022 20:57:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '作者',
  `category_id` int NULL DEFAULT NULL COMMENT '文章分类',
  `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章缩略图',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章类型 1原创 2转载 3翻译',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原文链接',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 0否 1是',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除  0否 1是',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值 1公开 2私密 3评论可见',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES (54, 1, 187, 'https://static.talkxj.com/articles/3dffb2fcbd541886616ab54c92570de3.jpg', '测试文章', '恭喜你成功运行博客，开启你的文章之旅吧。', 1, '', 0, 1, 1, '2022-01-24 23:33:56', '2022-06-02 20:50:48');
INSERT INTO `tb_article` VALUES (55, 1, 190, 'https://static.talkxj.com/articles/3dffb2fcbd541886616ab54c92570de3.jpg', 'vue开发技巧', '# [vue.config.js](https://cli.vuejs.org/zh/config/)\n\n## 设置`@`符号\n\n```javascript\n\'use strict\'\n\nconst path = require(\'path\')\nfunction resolve(dir) {\n    return path.join(__dirname, dir)\n}\n\nmodule.exports = {\n    //设置@的作用\n    configureWebpack: {\n        resolve: {\n            alias: {\n                \'@\': resolve(\'src\')//在项目中使用@，会指定先src的目录下面\n            }\n        }\n    },\n}\n\n```\n\n\n\n## 设置代理\n\n> **将任何未知的请求代理到指定服务器**\n\n```javascript\nmodule.exports = {\n    devServer: {\n        // 将所有未知的请求代理到下面指定的服务器上  \n        proxy: \'http://localhost:4000\'\n    }\n}\n```\n\n> **将不同路径代理到不同服务器中**\n\n```javascript\nmodule.exports = {\n    devServer: {\n        proxy: {\n            // 将api开头的路径的请求代理到url中  \n            \'/api\': {\n                target: \'<url>\',\n                ws: true,\n                changeOrigin: true\n            },\n            // 将foo开头的路径的请求代理到other_url中  \n            \'/foo\': {\n                target: \'<other_url>\'\n            }\n        }\n    }\n}\n```\n\n\n\n## 关闭代码检查\n\n```javascript\nmodule.exports = {\n    lintOnSave: false,\n}\n```\n\n\n\n\n\n## vue配置文件模板\n\n```javascript\n\'use strict\'\n\nconst path = require(\'path\')\nfunction resolve(dir) {\n    return path.join(__dirname, dir)\n}\n\nmodule.exports = {\n    //关闭代码检查\n    lintOnSave: false,\n    \n    //设置代理\n    devServer: {\n        proxy: {\n            //设置为0.0.0.0之后，同一局域网内可以直接访问项目\n            host: \'0.0.0.0\',\n            //端口号\n            port: 80,\n            //是否自动打开浏览器\n            open: true,\n            //将路径请求为api开头的请求代理到target指定的服务器中\n            \'/api\':{\n                target:\'http://localhost:8080\'\n            }\n        }\n    },\n    //设置@的作用\n    configureWebpack: {\n        resolve: {\n            alias: {\n                \'@\': resolve(\'src\')//在项目中使用@，会指定先src的目录下面\n            }\n        }\n    },\n}\n```\n\n\n\n\n\n\n\n# [vuex](https://vuex.vuejs.org/zh/)\n\n## vuex原理图\n\nvuex的原理图，在组件调用store的`dispatch`方法后，执行了`actions`中的方法（action中可以调用Ajax请求），在actions中`commit`调用`mutations`后，在`mutation和actions`中都可以修改`store`中的方法\n\n![image-20220517145549307](E:\\note\\开发技巧\\vue开发技巧.assets\\image-20220517145549307.png)\n\n当在`actions`中不需要进行什么操作（直接将接收的值传入mutations中的时候）可以在组件中不需要调用`actions`，直接在组件中直接`commit调用mutations`，可以直接越过`actions`\n\n![image-20220517145909111](E:\\note\\开发技巧\\vue开发技巧.assets\\image-20220517145909111.png)\n\n## vuex的基本使用\n\n\n\n### 创建store\n\n- 在src下面创建一个文件夹`store`，创建一个文件`index.js`，写入以下内容\n\n  ```javascript\n  //引入vue\n  import Vue from \'vue\'\n  //引入vuex\n  import Vuex from \'vuex\'\n  \n  //在vue中使用vuex\n  Vue.use(Vuex)\n  \n  export default new Vuex.Store({\n      //用于响应组件中的动作\n      actions: {},\n      //用于操作数据（state）\n      mutations: {},\n      //用于存储数据\n      state: {},\n      //用于将state中的数据进行加工，比如state中sum+1\n      getters: {},\n      //用于存放vuex的各个模块，进行模块化管理时使用\n      modules: {}\n  })\n  ```\n\n- 在src下面的`main.js`中引入上面创建的`store`文件\n\n  ```javascript\n  //在main.js文件中引入store\n  import store from \'./store\'\n  new Vue({\n      ........\n      //在vue实例中引入store\n    	store,\n  }).$mount(\'#app\')\n  ```\n\n\n\n### vuex的基本使用\n\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）\n\n  ```javascript\n  import Vue from \'vue\'\n  import Vuex from \'vuex\'\n  \n  Vue.use(Vuex)\n  \n  export default new Vuex.Store({\n      actions: {\n          jia(context, value) {\n              context.commit(\'JIA\', value)\n          }\n      },\n      mutations: {\n          JIA(state, value) {\n              state.sum += value\n          }\n      },\n      state: {\n          sum: 0,\n      },\n      getters: {\n          bigSum(state){\n              return state.sum + 10\n          }\n      },\n      modules: {}\n  })\n  ```\n\n- 在组件中操作store。**使用`this.$store.dispatch(actions中的方法或mutations中的方法，传入的值)`**\n\n  ```vue\n  <template>\n      <div>\n          <div @click=\"storeJia\">操作store</div>\n          <!-- 获取state中的数据 -->\n          <div style=\"font-size: 20px;\">{{$store.state.sum}}</div>\n          <!-- 获取getters中的数据 -->\n          <div style=\"font-size: 20px;\">{{$store.getters.bigSum}}</div>\n      </div>\n  </template>\n  \n  <script>\n  export default {\n      methods: {\n          storeJia() {\n              this.$store.dispatch(\'jia\', 2)\n          }\n      },\n  }\n  </script>\n  \n  ```\n\n- 在组件中访问`store / getters`\n\n  - 在`template`中使用插值语法`{{}}`访问：\n    - 访问store：`{{$store.state.state中的变量}}`\n    - 访问getters：`{{$store.getters.getters中的变量}}`\n\n\n\n### vuex的进阶使用—mapState\n\n在vue组件中使用store中的数据时，总是要使用`$store.state.state中的变量`访问变量，所以vuex提供了`mapState`结合vue提供的`computen计算属性`一起使用能够快捷的访问state中的属性\n\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用state中的数据\n\n  ```javascript\n  import Vue from \'vue\'\n  import Vuex from \'vuex\'\n  \n  Vue.use(Vuex)\n  \n  export default new Vuex.Store({\n      actions: {},\n      mutations: {},\n      state: {\n          sum: 0,\n          username: \'张三\'\n      },\n      getters: {},\n      modules: {}\n  })\n  ```\n\n- 在组件中使用`mapState`：在计算属性`computed`中使用\n\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\n  - 使用方式一：`...mapState({sum:\'state中的变量\',username:\'state中的变量\'})`\n  - 使用方式而：`...mapState([state中的变量1 , state中的变量2 , ......])`\n\n  ```vue\n  <template>\n      <div>\n          <div style=\"font-size: 20px;\">{{ username1 }}</div>\n          <div style=\"font-size: 20px;\">{{ sum1 }}</div>\n          <div style=\"font-size: 20px;\">{{ username }}</div>\n          <div style=\"font-size: 20px;\">{{ sum }}</div>\n      </div>\n  </template>\n  \n  <script>\n  // 引入vuex中的mapState\n  import {mapState} from \'vuex\'\n  \n  export default {\n      computed: {\n          //使用对象接收store中的数据，可以重新赋变量名，可以和store中的数据一致\n          ...mapState({sum1: \'sum\', username1: \'username\'}),\n          //使用数组接收store中的数据，变量名为store中的变量名\n          ...mapState([\'sum\', \'username\']),\n      },\n  }\n  </script>\n  ```\n\n  \n\n### vuex的进阶使用—mapGetters\n\n在vue组件中使用getters中的数据时，总是要使用`$store.getters.getters中的变量`访问变量，所以vuex提供了`mapGerrers`结合vue提供的`computen计算属性`一起使用能够快捷的访问getters中的属性\n\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用getters中的数据\n\n  ```javascript\n  import Vue from \'vue\'\n  import Vuex from \'vuex\'\n  \n  Vue.use(Vuex)\n  \n  export default new Vuex.Store({\n      actions: {},\n      mutations: {},\n      state: {\n          sum: 0,\n          username: \'张三\'\n      },\n      getters: {\n          bigSum(state) {\n              return state.sum + 10\n          },\n          newUsername(state){\n              return state.username+\"是好人\"\n          }\n      },\n      modules: {}\n  })\n  ```\n\n- 在组件中使用`mapGetters`：在计算属性`computed`中使用\n\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\n  - 使用方式一：`...mapGetters({sum:\'getters中的变量\',username:\'getters中的变量\'})`\n  - 使用方式而：`...mapGetters([getters中的变量1 , getters中的变量2 , ......])`\n\n  ```vue\n  <template>\n      <div>\n          <div style=\"font-size: 20px;\">{{ bigSum1 }}</div>\n          <div style=\"font-size: 20px;\">{{ newUsername1 }}</div>\n          <div style=\"font-size: 20px;\">{{ bigSum }}</div>\n          <div style=\"font-size: 20px;\">{{ newUsername }}</div>\n      </div>\n  </template>\n  \n  <script>\n  //从vuex中引入mapGetters\n  import {mapGetters} from \'vuex\'\n  \n  export default {\n      computed: {\n          ...mapGetters({bigSum1: \'bigSum\', newUsername1: \'newUsername\'}),\n          ...mapGetters([\'bigSum\', \'newUsername\']),\n      },\n  }\n  </script>\n  ```\n\n\n\n\n\n### vuex的进阶使用—mapActions\n\n在vue组件中使用actions中的方法时，总是要使用`this.$store.dispatch(\'actions中的方法\', 需要传入的值)`访问actions中的方法，所以vuex提供了`mapActions`结合vue提供的`methods`一起使用能够快捷的访问actions中的方法\n\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用actions中的方法\n\n  ```javascript\n  import Vue from \'vue\'\n  import Vuex from \'vuex\'\n  \n  Vue.use(Vuex)\n  \n  export default new Vuex.Store({\n      actions: {\n          jia(context, value) {\n              context.commit(\'JIA\', value)\n          },\n          jian(context, value) {\n              context.commit(\'JIAN\', value)\n          }\n      },\n      mutations: {\n          JIA(state, value) {\n              state.sum += value\n          },\n          JIAN(state, value) {\n              state.sum -= value\n          }\n      },\n      state: {\n          sum: 0,\n      },\n      getters: {},\n      modules: {}\n  })\n  ```\n\n- 在组件中使用`mapActions`：在`methods`中使用\n\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\n  - 使用方式一：`...mapActions({jia1:\'actios中的方法\',jian1:\'actions中的方法\'})`\n  - 使用方式而：`...mapActions([actions中的方法1 , actions中的方法2 , ......])`\n\n  ```vue\n  <template>\n      <div>\n          <div style=\"font-size: 20px\" @click=\"jia(1)\">jia</div>\n          <div style=\"font-size: 20px\" @click=\"jian(1)\">jian</div>\n          <div style=\"font-size: 20px\" @click=\"jia1(1)\">jia1</div>\n          <div style=\"font-size: 20px\" @click=\"jian1(1)\">jian1</div>\n          <div style=\"font-size: 20px;\">{{ sum }}</div>\n      </div>\n  </template>\n  \n  <script>\n  import {mapState, mapActions} from \'vuex\'\n  \n  export default {\n      computed: {\n          ...mapState([\'sum\']),\n      },\n      methods: {\n          ...mapActions({jia1: \'jia\', jian1: \'jian\'}),\n          ...mapActions([\'jia\', \'jian\']),\n      },\n  }\n  </script>\n  ```\n\n  \n\n### vuex的进阶使用—mapMutations\n在vue组件中使用actions中的方法时，总是要使用`this.$store.dispatch(\'mutations中的方法\', 需要传入的值)`访问mutations中的方法，所以vuex提供了`mapMutations`结合vue提供的`methods`一起使用能够快捷的访问mutations中的方法\n\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用mutations中的方法\n\n  ```javascript\n  import Vue from \'vue\'\n  import Vuex from \'vuex\'\n  \n  Vue.use(Vuex)\n  \n  export default new Vuex.Store({\n      actions: {},\n      mutations: {\n          JIA(state, value) {\n              state.sum += value\n          },\n          JIAN(state, value) {\n              state.sum -= value\n          }\n      },\n      state: {\n          sum: 0,\n      },\n      getters: {},\n      modules: {}\n  })\n  ```\n  \n- 在组件中使用`mapMutations`：在`methods`中使用\n\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\n  - 使用方式一：`...mapMutations({JIA1:\'mutations中的方法\',JIAN1:\'mutations中的方法\'})`\n  - 使用方式而：`...mapMutations([mutations中的方法1 , mutations中的方法2 , ......])`\n\n  ```vue\n  <template>\n      <div>\n          <div style=\"font-size: 20px\" @click=\"JIA1(1)\">JIA1</div>\n          <div style=\"font-size: 20px\" @click=\"JIAN1(1)\">JIAN1</div>\n          <div style=\"font-size: 20px\" @click=\"JIA(1)\">JIA</div>\n          <div style=\"font-size: 20px\" @click=\"JIAN(1)\">JIAN</div>\n          <div style=\"font-size: 20px;\">{{ sum }}</div>\n      </div>\n  </template>\n  \n  <script>\n  import {mapState ,mapMutations} from \'vuex\'\n  \n  export default {\n      computed: {\n          ...mapState([\'sum\']),\n      },\n      methods: {\n          ...mapMutations({JIA1: \'JIA\', JIAN1: \'JIAN\'}),\n          ...mapMutations([\'JIA\', \'JIAN\']),\n      },\n  }\n  </script>\n  \n  ```\n  \n  \n\n## vuex模块化+命名空间\n\n模块化可以将多个store整合到一个store中，需要在每个store中需要将`namespaced: true`\n\n### 创建store\n\n- 创建子模块 person，里面用于放入一些用户的基本信息\n\n  ```javascript\n  export default {\n      namespaced: true,\n      //用于响应组件中的动作\n      actions: {\n          append(context, value) {\n              context.commit(\"APPEND\", value)\n          }\n      },\n      //用于操作数据（state）\n      mutations: {\n          APPEND(state, value) {\n              state.username += value\n          }\n      },\n      //用于存储数据\n      state: {\n          username: \"张三\"\n      },\n      //用于将state中的数据进行加工，比如state中sum+1\n      getters: {\n          newUsername(state){\n              return state.username+\"是个好人\"\n          }\n      },\n      //用于存放vuex的各个模块，进行模块化管理时使用\n      modules: {}\n  }\n  ```\n\n- 创建sum，里面用于放一些运算操作\n\n  ```javascript\n  export default {\n      namespaced: true,\n      //用于响应组件中的动作\n      actions: {\n          sum(context, value) {\n              context.commit(\'SUM\', value)\n          }\n      },\n      //用于操作数据（state）\n      mutations: {\n          SUM(state, value) {\n              state.sumValue += value\n          }\n      },\n      //用于存储数据\n      state: {\n          sumValue: 20\n      },\n      //用于将state中的数据进行加工，比如state中sum+1\n      getters: {\n          bigSumValue(state) {\n              return state.sumValue + 20\n          }\n      },\n      //用于存放vuex的各个模块，进行模块化管理时使用\n      modules: {}\n  }\n  ```\n\n- 创建index，用于整合所有模块\n\n  ```javascript\n  import Vue from \'vue\'\n  import Vuex from \'vuex\'\n  \n  //引入一个一个的store\n  import sum from \'./sum\'\n  import person from \'./person\'\n  \n  Vue.use(Vuex)\n  \n  export default new Vuex.Store({\n      modules: {\n          sum: sum, \n          person: person\n      }\n  })\n  ```\n\n\n\n### 在vue中使用模块化中的store数据\n\n```vue\n<template>\n    <div>\n        <div style=\"font-size: 20px\" @click=\"append(\'测试\')\">append</div>\n        <div style=\"font-size: 20px\" @click=\"APPEND(\'测试2\')\">APPEND</div>\n        <div style=\"font-size: 20px\" @click=\"sum(20)\">sum</div>\n        <div style=\"font-size: 20px\" @click=\"SUM(10)\">SUM</div>\n        <div style=\"font-size: 20px;\">{{ username }}</div>\n        <div style=\"font-size: 20px;\">{{ newUsername }}</div>\n        <div style=\"font-size: 20px;\">{{ sumValue }}</div>\n        <div style=\"font-size: 20px;\">{{ bigSumValue }}</div>\n    </div>\n</template>\n\n<script>\nimport {mapState, mapGetters, mapActions, mapMutations} from \'vuex\'\n\nexport default {\n    computed: {\n        //使用vuex提供的mapXxx方法\n        ...mapState(\'person\', [\'username\']),\n        ...mapGetters(\'person\', [\'newUsername\']),\n\n        //从$store方法中获取\n        bigSumValue() {\n            return this.$store.getters[\'sum/bigSumValue\']\n        },\n        sumValue() {\n            return this.$store.state.sum.sumValue\n        }\n    },\n    methods: {\n        //使用mapXxx\n        ...mapActions(\'person\', [\'append\']),\n        ...mapMutations(\'person\', [\'APPEND\']),\n\n        //使用$store获取\n        sum() {\n            this.$store.dispatch(\'sum/sum\', 20)\n        },\n        SUM() {\n            this.$store.commit(\'sum/SUM\', 10)\n        }\n    },\n}\n</script>\n```\n\n\n\n\n\n## [vuex持久化](https://blog.csdn.net/weixin_52283244/article/details/119058888)\n\n[博客2：](https://juejin.cn/post/6918684399659646989)https://juejin.cn/post/6918684399659646989\n\n# [vue-router](https://router.vuejs.org/zh/)\n\n## vue-router参数详解\n\n\n\n\n\n## router-link标签参数详解\n\n\n\n## 一级路由\n\n```javascript\nimport Vue from \'vue\'\nimport VueRouter from \'vue-router\'\n\n//引入组件\nimport Home from \'../components/Home\'\n\nVue.use(VueRouter)\n\n/*\nname：可以用于\n\n*/\n\n//创建路由\nconst routes = [\n    //创建路由方式一：使用import函数，直接找到组件，不用在开头引入组件，推荐使用\n    {path: \'/\', name: \'Index\', component: () => import(\'@/views/index\')},\n    //创建路由方式二：需要在开头先使用import引入组件，再到下面定义路由\n    {path:\'/home\', name: \'home\', component:Home},\n\n]\n\nconst router = new VueRouter({\n    mode: \'history\',\n    base: process.env.BASE_URL,\n    routes\n})\n\nexport default router\n\n```\n\n\n\n## 多级路由\n\n```javascript\nimport Vue from \'vue\'\nimport VueRouter from \'vue-router\'\n\nVue.use(VueRouter)\n\nconst routes = [\n    //多级路由方式创建一：只需要添加children的值，值为创建一个新的路由，children的值是一个数组\n    //二级路由访问路径为：一级路由地址/二级路由地址\n    {\n        path: \'/image4\',\n        name: \'Image4\',\n        component: () => import(\'@/views/图片展示/图片4\'),\n        children: [\n            //一个一个嵌套即可\n            {\n                path: \'/image1\', \n                name: \'Image1\', \n                component: () => import(\'@/views/图片展示/图片1\')\n            }\n        ]\n    },\n\n]\n\nconst router = new VueRouter({\n    mode: \'history\',\n    base: process.env.BASE_URL,\n    routes\n})\n\nexport default router\n\n```\n\n\n\n## 路由query参数—router-link\n\n```vue\n<template>\n    <div id=\"app\">\n        <router-view/>\n        <!-- 跳转路由并携带query参数，to的字符串写法 -->\n        <router-link :to=\"`/home?id=${1}&title=${\'测试\'}`\">测试</router-link>\n        <!-- 跳转路由并携带query参数，to的对象写法 -->\n        <router-link :to=\"{path:\'/home\',query:{id:1,title:\'测试\'}}\">路由测试</router-link>\n    </div>\n</template>\n```\n\n\n\n## 命名路由\n\n利用路由的`name`的值访问路由\n\n- 定义一个路由\n\n  ```javascript\n  import Vue from \'vue\'\n  import VueRouter from \'vue-router\'\n  \n  Vue.use(VueRouter)\n  \n  const routes = [\n      {path: \'/image4\', name: \'Image4\', component: () => import(\'@/views/index\')},\n  ]\n  \n  const router = new VueRouter({\n      mode: \'history\',\n      base: process.env.BASE_URL,\n      routes\n  })\n  \n  export default router\n  ```\n\n- 利用路由的`path和name`属性访问组件\n\n  ```vue\n  <template>\n      <div>\n          <!-- 使用name属性访问 -->\n          <router-link :to=\"{name:\'Image4\'}\">测试</router-link><br/>\n          <!-- 使用path属性访问 -->\n          <router-link :to=\"{path:\'image4\'}\">测试</router-link><br/>\n          <!-- 直接写路径，可以默认为path的值 -->\n          <router-link to=\"/image4\">测试</router-link><br/>\n      </div>\n  </template>\n  ```\n\n\n\n\n\n\n# [css解决文本溢出](https://www.php.cn/css-tutorial-409501.html)\n\n```css\n*{\n    overflow: hidden;\n				text-overflow: ellipsis;\n				display: -webkit-box;\n    			//设置几行开始使用省略号\n				-webkit-line-clamp: 3;\n				-webkit-box-orient: vertical;\n}\n```\n\n\n\n\n\n\n\n# 格式化配置文件\n\n> **命名为`.editorconfig`文件**\n\n```\n# 告诉EditorConfig插件，这是根文件，不用继续往上查找\nroot = true\n\n# 匹配全部文件\n[*]\n# 结尾换行符，可选\"lf\"、\"cr\"、\"crlf\"\nend_of_line = lf\n# 在文件结尾插入新行\ninsert_final_newline = true\n# 删除一行中的前后空格\ntrim_trailing_whitespace = true\n# 匹配js和py结尾的文件\n[*.{js,py,vue, html, css}]\n# 设置字符集\ncharset = utf-8\n\n# 匹配py结尾的文件\n[*.{js, py, vue, html}]\n# 缩进风格，可选\"space\"、\"tab\"\nindent_style = space\n# 缩进的空格数\nindent_size = 4\n\n# 以下匹配，类同\n[Makefile]\nindent_style = tab\n# tab的宽度\ntab_width = 4\n\n# 以下匹配，类同\n[lib/**.js]\nindent_style = space\nindent_size = 2\n\n[{package.json, .travis.yml}]\nindent_style = space\nindent_size = 2\n\n```\n\n\n\n\n\n\n\n# CSS重置样式表和基础样式\n\n## reset.css\n\n```css\n/* http://meyerweb.com/eric/tools/css/reset/ \n   v2.0 | 20110126\n   License: none (public domain)\n*/\n\nhtml, body, div, span, applet, object, iframe,\nh1, h2, h3, h4, h5, h6, p, blockquote, pre,\na, abbr, acronym, address, big, cite, code,\ndel, dfn, em, img, ins, kbd, q, s, samp,\nsmall, strike, strong, sub, sup, tt, var,\nb, u, i, center,\ndl, dt, dd, ol, ul, li,\nfieldset, form, label, legend,\ntable, caption, tbody, tfoot, thead, tr, th, td,\narticle, aside, canvas, details, embed, \nfigure, figcaption, footer, header, hgroup, \nmenu, nav, output, ruby, section, summary,\ntime, mark, audio, video {\n	margin: 0;\n	padding: 0;\n	border: 0;\n	font-size: 100%;\n	font: inherit;\n	vertical-align: baseline;\n}\n/* HTML5 display-role reset for older browsers */\narticle, aside, details, figcaption, figure, \nfooter, header, hgroup, menu, nav, section {\n	display: block;\n}\nbody {\n	line-height: 1;\n}\nol, ul {\n	list-style: none;\n}\nblockquote, q {\n	quotes: none;\n}\nblockquote:before, blockquote:after,\nq:before, q:after {\n	content: \'\';\n	content: none;\n}\ntable {\n	border-collapse: collapse;\n	border-spacing: 0;\n}\n```\n\n\n\n\n\n## normalize.css\n\n```css\n/*! normalize.css v8.0.1 | MIT License | github.com/necolas/normalize.css */\n\n/* Document\n   ========================================================================== */\n\n/**\n * 1. Correct the line height in all browsers.\n * 2. Prevent adjustments of font size after orientation changes in iOS.\n */\n\nhtml {\n  line-height: 1.15; /* 1 */\n  -webkit-text-size-adjust: 100%; /* 2 */\n}\n\n/* Sections\n   ========================================================================== */\n\n/**\n * Remove the margin in all browsers.\n */\n\nbody {\n  margin: 0;\n}\n\n/**\n * Render the `main` element consistently in IE.\n */\n\nmain {\n  display: block;\n}\n\n/**\n * Correct the font size and margin on `h1` elements within `section` and\n * `article` contexts in Chrome, Firefox, and Safari.\n */\n\nh1 {\n  font-size: 2em;\n  margin: 0.67em 0;\n}\n\n/* Grouping content\n   ========================================================================== */\n\n/**\n * 1. Add the correct box sizing in Firefox.\n * 2. Show the overflow in Edge and IE.\n */\n\nhr {\n  box-sizing: content-box; /* 1 */\n  height: 0; /* 1 */\n  overflow: visible; /* 2 */\n}\n\n/**\n * 1. Correct the inheritance and scaling of font size in all browsers.\n * 2. Correct the odd `em` font sizing in all browsers.\n */\n\npre {\n  font-family: monospace, monospace; /* 1 */\n  font-size: 1em; /* 2 */\n}\n\n/* Text-level semantics\n   ========================================================================== */\n\n/**\n * Remove the gray background on active links in IE 10.\n */\n\na {\n  background-color: transparent;\n}\n\n/**\n * 1. Remove the bottom border in Chrome 57-\n * 2. Add the correct text decoration in Chrome, Edge, IE, Opera, and Safari.\n */\n\nabbr[title] {\n  border-bottom: none; /* 1 */\n  text-decoration: underline; /* 2 */\n  text-decoration: underline dotted; /* 2 */\n}\n\n/**\n * Add the correct font weight in Chrome, Edge, and Safari.\n */\n\nb,\nstrong {\n  font-weight: bolder;\n}\n\n/**\n * 1. Correct the inheritance and scaling of font size in all browsers.\n * 2. Correct the odd `em` font sizing in all browsers.\n */\n\ncode,\nkbd,\nsamp {\n  font-family: monospace, monospace; /* 1 */\n  font-size: 1em; /* 2 */\n}\n\n/**\n * Add the correct font size in all browsers.\n */\n\nsmall {\n  font-size: 80%;\n}\n\n/**\n * Prevent `sub` and `sup` elements from affecting the line height in\n * all browsers.\n */\n\nsub,\nsup {\n  font-size: 75%;\n  line-height: 0;\n  position: relative;\n  vertical-align: baseline;\n}\n\nsub {\n  bottom: -0.25em;\n}\n\nsup {\n  top: -0.5em;\n}\n\n/* Embedded content\n   ========================================================================== */\n\n/**\n * Remove the border on images inside links in IE 10.\n */\n\nimg {\n  border-style: none;\n}\n\n/* Forms\n   ========================================================================== */\n\n/**\n * 1. Change the font styles in all browsers.\n * 2. Remove the margin in Firefox and Safari.\n */\n\nbutton,\ninput,\noptgroup,\nselect,\ntextarea {\n  font-family: inherit; /* 1 */\n  font-size: 100%; /* 1 */\n  line-height: 1.15; /* 1 */\n  margin: 0; /* 2 */\n}\n\n/**\n * Show the overflow in IE.\n * 1. Show the overflow in Edge.\n */\n\nbutton,\ninput { /* 1 */\n  overflow: visible;\n}\n\n/**\n * Remove the inheritance of text transform in Edge, Firefox, and IE.\n * 1. Remove the inheritance of text transform in Firefox.\n */\n\nbutton,\nselect { /* 1 */\n  text-transform: none;\n}\n\n/**\n * Correct the inability to style clickable types in iOS and Safari.\n */\n\nbutton,\n[type=\"button\"],\n[type=\"reset\"],\n[type=\"submit\"] {\n  -webkit-appearance: button;\n}\n\n/**\n * Remove the inner border and padding in Firefox.\n */\n\nbutton::-moz-focus-inner,\n[type=\"button\"]::-moz-focus-inner,\n[type=\"reset\"]::-moz-focus-inner,\n[type=\"submit\"]::-moz-focus-inner {\n  border-style: none;\n  padding: 0;\n}\n\n/**\n * Restore the focus styles unset by the previous rule.\n */\n\nbutton:-moz-focusring,\n[type=\"button\"]:-moz-focusring,\n[type=\"reset\"]:-moz-focusring,\n[type=\"submit\"]:-moz-focusring {\n  outline: 1px dotted ButtonText;\n}\n\n/**\n * Correct the padding in Firefox.\n */\n\nfieldset {\n  padding: 0.35em 0.75em 0.625em;\n}\n\n/**\n * 1. Correct the text wrapping in Edge and IE.\n * 2. Correct the color inheritance from `fieldset` elements in IE.\n * 3. Remove the padding so developers are not caught out when they zero out\n *    `fieldset` elements in all browsers.\n */\n\nlegend {\n  box-sizing: border-box; /* 1 */\n  color: inherit; /* 2 */\n  display: table; /* 1 */\n  max-width: 100%; /* 1 */\n  padding: 0; /* 3 */\n  white-space: normal; /* 1 */\n}\n\n/**\n * Add the correct vertical alignment in Chrome, Firefox, and Opera.\n */\n\nprogress {\n  vertical-align: baseline;\n}\n\n/**\n * Remove the default vertical scrollbar in IE 10+.\n */\n\ntextarea {\n  overflow: auto;\n}\n\n/**\n * 1. Add the correct box sizing in IE 10.\n * 2. Remove the padding in IE 10.\n */\n\n[type=\"checkbox\"],\n[type=\"radio\"] {\n  box-sizing: border-box; /* 1 */\n  padding: 0; /* 2 */\n}\n\n/**\n * Correct the cursor style of increment and decrement buttons in Chrome.\n */\n\n[type=\"number\"]::-webkit-inner-spin-button,\n[type=\"number\"]::-webkit-outer-spin-button {\n  height: auto;\n}\n\n/**\n * 1. Correct the odd appearance in Chrome and Safari.\n * 2. Correct the outline style in Safari.\n */\n\n[type=\"search\"] {\n  -webkit-appearance: textfield; /* 1 */\n  outline-offset: -2px; /* 2 */\n}\n\n/**\n * Remove the inner padding in Chrome and Safari on macOS.\n */\n\n[type=\"search\"]::-webkit-search-decoration {\n  -webkit-appearance: none;\n}\n\n/**\n * 1. Correct the inability to style clickable types in iOS and Safari.\n * 2. Change font properties to `inherit` in Safari.\n */\n\n::-webkit-file-upload-button {\n  -webkit-appearance: button; /* 1 */\n  font: inherit; /* 2 */\n}\n\n/* Interactive\n   ========================================================================== */\n\n/*\n * Add the correct display in Edge, IE 10+, and Firefox.\n */\n\ndetails {\n  display: block;\n}\n\n/*\n * Add the correct display in all browsers.\n */\n\nsummary {\n  display: list-item;\n}\n\n/* Misc\n   ========================================================================== */\n\n/**\n * Add the correct display in IE 10+.\n */\n\ntemplate {\n  display: none;\n}\n\n/**\n * Add the correct display in IE 10.\n */\n\n[hidden] {\n  display: none;\n}\n```\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n', 1, '', 0, 1, 1, '2022-05-29 15:03:33', '2022-06-02 20:50:33');
INSERT INTO `tb_article` VALUES (56, 1, 191, 'http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/articles/9d07275d73d810d3458d0c12e0482eaa.jpg', '2022-05-30', '![1.jpg](http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/articles/c7313dc52ddce8ed0b270e10216e7b68.jpg)', 2, '', 0, 1, 1, '2022-05-30 20:36:16', '2022-06-02 20:50:28');

-- ----------------------------
-- Table structure for tb_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_tag`;
CREATE TABLE `tb_article_tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL COMMENT '文章id',
  `tag_id` int NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_tag_1`(`article_id`) USING BTREE,
  INDEX `fk_article_tag_2`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 862 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_article_tag
-- ----------------------------
INSERT INTO `tb_article_tag` VALUES (861, 56, 29);
INSERT INTO `tb_article_tag` VALUES (862, 55, 30);
INSERT INTO `tb_article_tag` VALUES (863, 54, 29);

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES (187, '测试分类', '2022-01-24 23:33:56', NULL);
INSERT INTO `tb_category` VALUES (188, 'vue', '2022-05-29 15:03:33', NULL);
INSERT INTO `tb_category` VALUES (189, 'Java', '2022-05-29 21:35:14', NULL);
INSERT INTO `tb_category` VALUES (190, '前端', '2022-05-29 21:35:19', NULL);
INSERT INTO `tb_category` VALUES (191, '后端', '2022-05-29 21:35:25', NULL);

-- ----------------------------
-- Table structure for tb_chat_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_chat_record`;
CREATE TABLE `tb_chat_record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '聊天内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip地址',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip来源',
  `type` tinyint NOT NULL COMMENT '类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2992 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_chat_record
-- ----------------------------
INSERT INTO `tb_chat_record` VALUES (2990, NULL, '未知ip', 'https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg', 'dsadd', '未知ip', '', 3, '2022-05-29 16:54:16', NULL);
INSERT INTO `tb_chat_record` VALUES (2991, NULL, '未知ip', 'https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg', 'dsad', '未知ip', '', 3, '2022-05-29 16:54:28', NULL);
INSERT INTO `tb_chat_record` VALUES (2992, NULL, '未知ip', 'https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg', 'dsad', '未知ip', '', 3, '2022-05-30 19:14:57', NULL);

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '评论用户Id',
  `topic_id` int NULL DEFAULT NULL COMMENT '评论主题id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `reply_user_id` int NULL DEFAULT NULL COMMENT '回复用户id',
  `parent_id` int NULL DEFAULT NULL COMMENT '父评论id',
  `type` tinyint NOT NULL COMMENT '评论类型 1.文章 2.友链 3.说说',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除  0否 1是',
  `is_review` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否审核',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_comment_user`(`user_id`) USING BTREE,
  INDEX `fk_comment_parent`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 731 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_friend_link`;
CREATE TABLE `tb_friend_link`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `link_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接名',
  `link_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接头像',
  `link_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接地址',
  `link_intro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接介绍',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_friend_link_user`(`link_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_friend_link
-- ----------------------------
INSERT INTO `tb_friend_link` VALUES (26, '小飞的个人博客', 'https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg', 'http://localhost:8081/', '小飞', '2022-01-18 00:26:46', '2022-05-30 19:46:24');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单icon',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `order_num` tinyint(1) NOT NULL COMMENT '排序',
  `parent_id` int NULL DEFAULT NULL COMMENT '父id',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏  0否1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES (1, '首页', '/', '/home/Home.vue', 'el-icon-myshouye', '2021-01-26 17:06:51', '2021-01-26 17:06:53', 1, NULL, 0);
INSERT INTO `tb_menu` VALUES (2, '文章管理', '/article-submenu', 'Layout', 'el-icon-mywenzhang-copy', '2021-01-25 20:43:07', '2021-01-25 20:43:09', 2, NULL, 0);
INSERT INTO `tb_menu` VALUES (3, '消息管理', '/message-submenu', 'Layout', 'el-icon-myxiaoxi', '2021-01-25 20:44:17', '2021-01-25 20:44:20', 3, NULL, 0);
INSERT INTO `tb_menu` VALUES (4, '系统管理', '/system-submenu', 'Layout', 'el-icon-myshezhi', '2021-01-25 20:45:57', '2021-01-25 20:45:59', 5, NULL, 0);
INSERT INTO `tb_menu` VALUES (5, '个人中心', '/setting', '/setting/Setting.vue', 'el-icon-myuser', '2021-01-26 17:22:38', '2021-01-26 17:22:41', 7, NULL, 0);
INSERT INTO `tb_menu` VALUES (6, '发布文章', '/articles', '/article/Article.vue', 'el-icon-myfabiaowenzhang', '2021-01-26 14:30:48', '2021-01-26 14:30:51', 1, 2, 0);
INSERT INTO `tb_menu` VALUES (7, '修改文章', '/articles/*', '/article/Article.vue', 'el-icon-myfabiaowenzhang', '2021-01-26 14:31:32', '2021-01-26 14:31:34', 2, 2, 1);
INSERT INTO `tb_menu` VALUES (8, '文章列表', '/article-list', '/article/ArticleList.vue', 'el-icon-mywenzhangliebiao', '2021-01-26 14:32:13', '2021-01-26 14:32:16', 3, 2, 0);
INSERT INTO `tb_menu` VALUES (9, '分类管理', '/categories', '/category/Category.vue', 'el-icon-myfenlei', '2021-01-26 14:33:42', '2021-01-26 14:33:43', 4, 2, 0);
INSERT INTO `tb_menu` VALUES (10, '标签管理', '/tags', '/tag/Tag.vue', 'el-icon-myicontag', '2021-01-26 14:34:33', '2021-01-26 14:34:36', 5, 2, 0);
INSERT INTO `tb_menu` VALUES (11, '评论管理', '/comments', '/comment/Comment.vue', 'el-icon-mypinglunzu', '2021-01-26 14:35:31', '2021-01-26 14:35:34', 1, 3, 0);
INSERT INTO `tb_menu` VALUES (12, '留言管理', '/messages', '/message/Message.vue', 'el-icon-myliuyan', '2021-01-26 14:36:09', '2021-01-26 14:36:13', 2, 3, 0);
INSERT INTO `tb_menu` VALUES (13, '用户列表', '/users', '/user/User.vue', 'el-icon-myyonghuliebiao', '2021-01-26 14:38:09', '2021-01-26 14:38:12', 1, 202, 0);
INSERT INTO `tb_menu` VALUES (14, '角色管理', '/roles', '/role/Role.vue', 'el-icon-myjiaoseliebiao', '2021-01-26 14:39:01', '2021-01-26 14:39:03', 2, 213, 0);
INSERT INTO `tb_menu` VALUES (15, '接口管理', '/resources', '/resource/Resource.vue', 'el-icon-myjiekouguanli', '2021-01-26 14:40:14', '2021-08-07 20:00:28', 2, 213, 0);
INSERT INTO `tb_menu` VALUES (16, '菜单管理', '/menus', '/menu/Menu.vue', 'el-icon-mycaidan', '2021-01-26 14:40:54', '2021-08-07 10:18:49', 2, 213, 0);
INSERT INTO `tb_menu` VALUES (17, '友链管理', '/links', '/friendLink/FriendLink.vue', 'el-icon-mydashujukeshihuaico-', '2021-01-26 14:41:35', '2021-01-26 14:41:37', 3, 4, 0);
INSERT INTO `tb_menu` VALUES (18, '关于我', '/about', '/about/About.vue', 'el-icon-myguanyuwo', '2021-01-26 14:42:05', '2021-01-26 14:42:10', 4, 4, 0);
INSERT INTO `tb_menu` VALUES (19, '日志管理', '/log-submenu', 'Layout', 'el-icon-myguanyuwo', '2021-01-31 21:33:56', '2021-01-31 21:33:59', 6, NULL, 0);
INSERT INTO `tb_menu` VALUES (20, '操作日志', '/operation/log', '/log/Operation.vue', 'el-icon-myguanyuwo', '2021-01-31 15:53:21', '2021-01-31 15:53:25', 1, 19, 0);
INSERT INTO `tb_menu` VALUES (201, '在线用户', '/online/users', '/user/Online.vue', 'el-icon-myyonghuliebiao', '2021-02-05 14:59:51', '2021-02-05 14:59:53', 7, 202, 0);
INSERT INTO `tb_menu` VALUES (202, '用户管理', '/users-submenu', 'Layout', 'el-icon-myyonghuliebiao', '2021-02-06 23:44:59', '2021-02-06 23:45:03', 4, NULL, 0);
INSERT INTO `tb_menu` VALUES (205, '相册管理', '/album-submenu', 'Layout', 'el-icon-myimage-fill', '2021-08-03 15:10:54', '2021-08-07 20:02:06', 5, NULL, 0);
INSERT INTO `tb_menu` VALUES (206, '相册列表', '/albums', '/album/Album.vue', 'el-icon-myzhaopian', '2021-08-03 20:29:19', '2021-08-04 11:45:47', 1, 205, 0);
INSERT INTO `tb_menu` VALUES (208, '照片管理', '/albums/:albumId', '/album/Photo.vue', 'el-icon-myzhaopian', '2021-08-03 21:37:47', '2021-08-05 10:24:08', 1, 205, 1);
INSERT INTO `tb_menu` VALUES (209, '页面管理', '/pages', '/page/Page.vue', 'el-icon-myyemianpeizhi', '2021-08-04 11:36:27', '2021-08-07 20:01:26', 2, 4, 0);
INSERT INTO `tb_menu` VALUES (210, '照片回收站', '/photos/delete', '/album/Delete.vue', 'el-icon-myhuishouzhan', '2021-08-05 13:55:19', NULL, 3, 205, 1);
INSERT INTO `tb_menu` VALUES (213, '权限管理', '/permission-submenu', 'Layout', 'el-icon-mydaohanglantubiao_quanxianguanli', '2021-08-07 19:56:55', '2021-08-07 19:59:40', 4, NULL, 0);
INSERT INTO `tb_menu` VALUES (214, '网站管理', '/website', '/website/Website.vue', 'el-icon-myxitong', '2021-08-07 20:06:41', NULL, 1, 4, 0);
INSERT INTO `tb_menu` VALUES (215, '说说管理', '/talk-submenu', 'Layout', 'el-icon-mypinglun', '2022-01-23 20:17:59', '2022-01-23 20:38:06', 5, NULL, 0);
INSERT INTO `tb_menu` VALUES (216, '发布说说', '/talks', '/talk/Talk.vue', 'el-icon-myfabusekuai', '2022-01-23 20:18:43', '2022-01-23 20:38:19', 1, 215, 0);
INSERT INTO `tb_menu` VALUES (217, '说说列表', '/talk-list', '/talk/TalkList.vue', 'el-icon-myiconfontdongtaidianji', '2022-01-23 23:28:24', '2022-01-24 00:02:48', 2, 215, 0);
INSERT INTO `tb_menu` VALUES (218, '修改说说', '/talks/:talkId', '/talk/Talk.vue', 'el-icon-myshouye', '2022-01-24 00:10:44', NULL, 3, 215, 1);

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `message_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户地址',
  `time` tinyint(1) NULL DEFAULT NULL COMMENT '弹幕速度',
  `is_review` tinyint NOT NULL DEFAULT 1 COMMENT '是否审核',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3941 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_message
-- ----------------------------
INSERT INTO `tb_message` VALUES (3938, '管理员', 'https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg', '测试留言', '127.0.0.1', '', 9, 1, '2022-01-24 23:34:41', NULL);
INSERT INTO `tb_message` VALUES (3939, '游客', 'https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg', 'dasd', '127.0.0.1', '', 7, 1, '2022-05-29 16:54:10', NULL);
INSERT INTO `tb_message` VALUES (3940, '游客', 'https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg', '57567576', '127.0.0.1', '', 7, 1, '2022-05-29 22:12:19', NULL);

-- ----------------------------
-- Table structure for tb_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_log`;
CREATE TABLE `tb_operation_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `opt_module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作模块',
  `opt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型',
  `opt_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作url',
  `opt_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作方法',
  `opt_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
  `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
  `response_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返回数据',
  `user_id` int NOT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_operation_log
-- ----------------------------
INSERT INTO `tb_operation_log` VALUES (1083, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"恭喜你成功运行博客，开启你的文章之旅吧。\",\"articleCover\":\"https://static.talkxj.com/articles/3dffb2fcbd541886616ab54c92570de3.jpg\",\"articleTitle\":\"测试文章\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[\"测试标签\"],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-01-24 23:33:57', NULL);
INSERT INTO `tb_operation_log` VALUES (1084, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"# [vue.config.js](https://cli.vuejs.org/zh/config/)\\n\\n## 设置`@`符号\\n\\n```javascript\\n\'use strict\'\\n\\nconst path = require(\'path\')\\nfunction resolve(dir) {\\n    return path.join(__dirname, dir)\\n}\\n\\nmodule.exports = {\\n    //设置@的作用\\n    configureWebpack: {\\n        resolve: {\\n            alias: {\\n                \'@\': resolve(\'src\')//在项目中使用@，会指定先src的目录下面\\n            }\\n        }\\n    },\\n}\\n\\n```\\n\\n\\n\\n## 设置代理\\n\\n> **将任何未知的请求代理到指定服务器**\\n\\n```javascript\\nmodule.exports = {\\n    devServer: {\\n        // 将所有未知的请求代理到下面指定的服务器上  \\n        proxy: \'http://localhost:4000\'\\n    }\\n}\\n```\\n\\n> **将不同路径代理到不同服务器中**\\n\\n```javascript\\nmodule.exports = {\\n    devServer: {\\n        proxy: {\\n            // 将api开头的路径的请求代理到url中  \\n            \'/api\': {\\n                target: \'<url>\',\\n                ws: true,\\n                changeOrigin: true\\n            },\\n            // 将foo开头的路径的请求代理到other_url中  \\n            \'/foo\': {\\n                target: \'<other_url>\'\\n            }\\n        }\\n    }\\n}\\n```\\n\\n\\n\\n## 关闭代码检查\\n\\n```javascript\\nmodule.exports = {\\n    lintOnSave: false,\\n}\\n```\\n\\n\\n\\n\\n\\n## vue配置文件模板\\n\\n```javascript\\n\'use strict\'\\n\\nconst path = require(\'path\')\\nfunction resolve(dir) {\\n    return path.join(__dirname, dir)\\n}\\n\\nmodule.exports = {\\n    //关闭代码检查\\n    lintOnSave: false,\\n    \\n    //设置代理\\n    devServer: {\\n        proxy: {\\n            //设置为0.0.0.0之后，同一局域网内可以直接访问项目\\n            host: \'0.0.0.0\',\\n            //端口号\\n            port: 80,\\n            //是否自动打开浏览器\\n            open: true,\\n            //将路径请求为api开头的请求代理到target指定的服务器中\\n            \'/api\':{\\n                target:\'http://localhost:8080\'\\n            }\\n        }\\n    },\\n    //设置@的作用\\n    configureWebpack: {\\n        resolve: {\\n            alias: {\\n                \'@\': resolve(\'src\')//在项目中使用@，会指定先src的目录下面\\n            }\\n        }\\n    },\\n}\\n```\\n\\n\\n\\n\\n\\n\\n\\n# [vuex](https://vuex.vuejs.org/zh/)\\n\\n## vuex原理图\\n\\nvuex的原理图，在组件调用store的`dispatch`方法后，执行了`actions`中的方法（action中可以调用Ajax请求），在actions中`commit`调用`mutations`后，在`mutation和actions`中都可以修改`store`中的方法\\n\\n![image-20220517145549307](E:\\\\note\\\\开发技巧\\\\vue开发技巧.assets\\\\image-20220517145549307.png)\\n\\n当在`actions`中不需要进行什么操作（直接将接收的值传入mutations中的时候）可以在组件中不需要调用`actions`，直接在组件中直接`commit调用mutations`，可以直接越过`actions`\\n\\n![image-20220517145909111](E:\\\\note\\\\开发技巧\\\\vue开发技巧.assets\\\\image-20220517145909111.png)\\n\\n## vuex的基本使用\\n\\n\\n\\n### 创建store\\n\\n- 在src下面创建一个文件夹`store`，创建一个文件`index.js`，写入以下内容\\n\\n  ```javascript\\n  //引入vue\\n  import Vue from \'vue\'\\n  //引入vuex\\n  import Vuex from \'vuex\'\\n  \\n  //在vue中使用vuex\\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      //用于响应组件中的动作\\n      actions: {},\\n      //用于操作数据（state）\\n      mutations: {},\\n      //用于存储数据\\n      state: {},\\n      //用于将state中的数据进行加工，比如state中sum+1\\n      getters: {},\\n      //用于存放vuex的各个模块，进行模块化管理时使用\\n      modules: {}\\n  })\\n  ```\\n\\n- 在src下面的`main.js`中引入上面创建的`store`文件\\n\\n  ```javascript\\n  //在main.js文件中引入store\\n  import store from \'./store\'\\n  new Vue({\\n      ........\\n      //在vue实例中引入store\\n    \\tstore,\\n  }).$mount(\'#app\')\\n  ```\\n\\n\\n\\n### vuex的基本使用\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {\\n          jia(context, value) {\\n              context.commit(\'JIA\', value)\\n          }\\n      },\\n      mutations: {\\n          JIA(state, value) {\\n              state.sum += value\\n          }\\n      },\\n      state: {\\n          sum: 0,\\n      },\\n      getters: {\\n          bigSum(state){\\n              return state.sum + 10\\n          }\\n      },\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中操作store。**使用`this.$store.dispatch(actions中的方法或mutations中的方法，传入的值)`**\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div @click=\\\"storeJia\\\">操作store</div>\\n          <!-- 获取state中的数据 -->\\n          <div style=\\\"font-size: 20px;\\\">{{$store.state.sum}}</div>\\n          <!-- 获取getters中的数据 -->\\n          <div style=\\\"font-size: 20px;\\\">{{$store.getters.bigSum}}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  export default {\\n      methods: {\\n          storeJia() {\\n              this.$store.dispatch(\'jia\', 2)\\n          }\\n      },\\n  }\\n  </script>\\n  \\n  ```\\n\\n- 在组件中访问`store / getters`\\n\\n  - 在`template`中使用插值语法`{{}}`访问：\\n    - 访问store：`{{$store.state.state中的变量}}`\\n    - 访问getters：`{{$store.getters.getters中的变量}}`\\n\\n\\n\\n### vuex的进阶使用—mapState\\n\\n在vue组件中使用store中的数据时，总是要使用`$store.state.state中的变量`访问变量，所以vuex提供了`mapState`结合vue提供的`computen计算属性`一起使用能够快捷的访问state中的属性\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用state中的数据\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {},\\n      mutations: {},\\n      state: {\\n          sum: 0,\\n          username: \'张三\'\\n      },\\n      getters: {},\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中使用`mapState`：在计算属性`computed`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapState({sum:\'state中的变量\',username:\'state中的变量\'})`\\n  - 使用方式而：`...mapState([state中的变量1 , state中的变量2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px;\\\">{{ username1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ username }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  // 引入vuex中的mapState\\n  import {mapState} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          //使用对象接收store中的数据，可以重新赋变量名，可以和store中的数据一致\\n          ...mapState({sum1: \'sum\', username1: \'username\'}),\\n          //使用数组接收store中的数据，变量名为store中的变量名\\n          ...mapState([\'sum\', \'username\']),\\n      },\\n  }\\n  </script>\\n  ```\\n\\n  \\n\\n### vuex的进阶使用—mapGetters\\n\\n在vue组件中使用getters中的数据时，总是要使用`$store.getters.getters中的变量`访问变量，所以vuex提供了`mapGerrers`结合vue提供的`computen计算属性`一起使用能够快捷的访问getters中的属性\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用getters中的数据\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {},\\n      mutations: {},\\n      state: {\\n          sum: 0,\\n          username: \'张三\'\\n      },\\n      getters: {\\n          bigSum(state) {\\n              return state.sum + 10\\n          },\\n          newUsername(state){\\n              return state.username+\\\"是好人\\\"\\n          }\\n      },\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中使用`mapGetters`：在计算属性`computed`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapGetters({sum:\'getters中的变量\',username:\'getters中的变量\'})`\\n  - 使用方式而：`...mapGetters([getters中的变量1 , getters中的变量2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px;\\\">{{ bigSum1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ newUsername1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ bigSum }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ newUsername }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  //从vuex中引入mapGetters\\n  import {mapGetters} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          ...mapGetters({bigSum1: \'bigSum\', newUsername1: \'newUsername\'}),\\n          ...mapGetters([\'bigSum\', \'newUsername\']),\\n      },\\n  }\\n  </script>\\n  ```\\n\\n\\n\\n\\n\\n### vuex的进阶使用—mapActions\\n\\n在vue组件中使用actions中的方法时，总是要使用`this.$store.dispatch(\'actions中的方法\', 需要传入的值)`访问actions中的方法，所以vuex提供了`mapActions`结合vue提供的`methods`一起使用能够快捷的访问actions中的方法\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用actions中的方法\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {\\n          jia(context, value) {\\n              context.commit(\'JIA\', value)\\n          },\\n          jian(context, value) {\\n              context.commit(\'JIAN\', value)\\n          }\\n      },\\n      mutations: {\\n          JIA(state, value) {\\n              state.sum += value\\n          },\\n          JIAN(state, value) {\\n              state.sum -= value\\n          }\\n      },\\n      state: {\\n          sum: 0,\\n      },\\n      getters: {},\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中使用`mapActions`：在`methods`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapActions({jia1:\'actios中的方法\',jian1:\'actions中的方法\'})`\\n  - 使用方式而：`...mapActions([actions中的方法1 , actions中的方法2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jia(1)\\\">jia</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jian(1)\\\">jian</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jia1(1)\\\">jia1</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jian1(1)\\\">jian1</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  import {mapState, mapActions} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          ...mapState([\'sum\']),\\n      },\\n      methods: {\\n          ...mapActions({jia1: \'jia\', jian1: \'jian\'}),\\n          ...mapActions([\'jia\', \'jian\']),\\n      },\\n  }\\n  </script>\\n  ```\\n\\n  \\n\\n### vuex的进阶使用—mapMutations\\n在vue组件中使用actions中的方法时，总是要使用`this.$store.dispatch(\'mutations中的方法\', 需要传入的值)`访问mutations中的方法，所以vuex提供了`mapMutations`结合vue提供的`methods`一起使用能够快捷的访问mutations中的方法\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用mutations中的方法\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {},\\n      mutations: {\\n          JIA(state, value) {\\n              state.sum += value\\n          },\\n          JIAN(state, value) {\\n              state.sum -= value\\n          }\\n      },\\n      state: {\\n          sum: 0,\\n      },\\n      getters: {},\\n      modules: {}\\n  })\\n  ```\\n  \\n- 在组件中使用`mapMutations`：在`methods`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapMutations({JIA1:\'mutations中的方法\',JIAN1:\'mutations中的方法\'})`\\n  - 使用方式而：`...mapMutations([mutations中的方法1 , mutations中的方法2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIA1(1)\\\">JIA1</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIAN1(1)\\\">JIAN1</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIA(1)\\\">JIA</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIAN(1)\\\">JIAN</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  import {mapState ,mapMutations} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          ...mapState([\'sum\']),\\n      },\\n      methods: {\\n          ...mapMutations({JIA1: \'JIA\', JIAN1: \'JIAN\'}),\\n          ...mapMutations([\'JIA\', \'JIAN\']),\\n      },\\n  }\\n  </script>\\n  \\n  ```\\n  \\n  \\n\\n## vuex模块化+命名空间\\n\\n模块化可以将多个store整合到一个store中，需要在每个store中需要将`namespaced: true`\\n\\n### 创建store\\n\\n- 创建子模块 person，里面用于放入一些用户的基本信息\\n\\n  ```javascript\\n  export default {\\n      namespaced: true,\\n      //用于响应组件中的动作\\n      actions: {\\n          append(context, value) {\\n              context.commit(\\\"APPEND\\\", value)\\n          }\\n      },\\n      //用于操作数据（state）\\n      mutations: {\\n          APPEND(state, value) {\\n              state.username += value\\n          }\\n      },\\n      //用于存储数据\\n      state: {\\n          username: \\\"张三\\\"\\n      },\\n      //用于将state中的数据进行加工，比如state中sum+1\\n      getters: {\\n          newUsername(state){\\n              return state.username+\\\"是个好人\\\"\\n          }\\n      },\\n      //用于存放vuex的各个模块，进行模块化管理时使用\\n      modules: {}\\n  }\\n  ```\\n\\n- 创建sum，里面用于放一些运算操作\\n\\n  ```javascript\\n  export default {\\n      namespaced: true,\\n      //用于响应组件中的动作\\n      actions: {\\n          sum(context, value) {\\n              context.commit(\'SUM\', value)\\n          }\\n      },\\n      //用于操作数据（state）\\n      mutations: {\\n          SUM(state, value) {\\n              state.sumValue += value\\n          }\\n      },\\n      //用于存储数据\\n      state: {\\n          sumValue: 20\\n      },\\n      //用于将state中的数据进行加工，比如state中sum+1\\n      getters: {\\n          bigSumValue(state) {\\n              return state.sumValue + 20\\n          }\\n      },\\n      //用于存放vuex的各个模块，进行模块化管理时使用\\n      modules: {}\\n  }\\n  ```\\n\\n- 创建index，用于整合所有模块\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  //引入一个一个的store\\n  import sum from \'./sum\'\\n  import person from \'./person\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      modules: {\\n          sum: sum, \\n          person: person\\n      }\\n  })\\n  ```\\n\\n\\n\\n### 在vue中使用模块化中的store数据\\n\\n```vue\\n<template>\\n    <div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"append(\'测试\')\\\">append</div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"APPEND(\'测试2\')\\\">APPEND</div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"sum(20)\\\">sum</div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"SUM(10)\\\">SUM</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ username }}</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ newUsername }}</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ sumValue }}</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ bigSumValue }}</div>\\n    </div>\\n</template>\\n\\n<script>\\nimport {mapState, mapGetters, mapActions, mapMutations} from \'vuex\'\\n\\nexport default {\\n    computed: {\\n        //使用vuex提供的mapXxx方法\\n        ...mapState(\'person\', [\'username\']),\\n        ...mapGetters(\'person\', [\'newUsername\']),\\n\\n        //从$store方法中获取\\n        bigSumValue() {\\n            return this.$store.getters[\'sum/bigSumValue\']\\n        },\\n        sumValue() {\\n            return this.$store.state.sum.sumValue\\n        }\\n    },\\n    methods: {\\n        //使用mapXxx\\n        ...mapActions(\'person\', [\'append\']),\\n        ...mapMutations(\'person\', [\'APPEND\']),\\n\\n        //使用$store获取\\n        sum() {\\n            this.$store.dispatch(\'sum/sum\', 20)\\n        },\\n        SUM() {\\n            this.$store.commit(\'sum/SUM\', 10)\\n        }\\n    },\\n}\\n</script>\\n```\\n\\n\\n\\n\\n\\n## [vuex持久化](https://blog.csdn.net/weixin_52283244/article/details/119058888)\\n\\n[博客2：](https://juejin.cn/post/6918684399659646989)https://juejin.cn/post/6918684399659646989\\n\\n# [vue-router](https://router.vuejs.org/zh/)\\n\\n## vue-router参数详解\\n\\n\\n\\n\\n\\n## router-link标签参数详解\\n\\n\\n\\n## 一级路由\\n\\n```javascript\\nimport Vue from \'vue\'\\nimport VueRouter from \'vue-router\'\\n\\n//引入组件\\nimport Home from \'../components/Home\'\\n\\nVue.use(VueRouter)\\n\\n/*\\nname：可以用于\\n\\n*/\\n\\n//创建路由\\nconst routes = [\\n    //创建路由方式一：使用import函数，直接找到组件，不用在开头引入组件，推荐使用\\n    {path: \'/\', name: \'Index\', component: () => import(\'@/views/index\')},\\n    //创建路由方式二：需要在开头先使用import引入组件，再到下面定义路由\\n    {path:\'/home\', name: \'home\', component:Home},\\n\\n]\\n\\nconst router = new VueRouter({\\n    mode: \'history\',\\n    base: process.env.BASE_URL,\\n    routes\\n})\\n\\nexport default router\\n\\n```\\n\\n\\n\\n## 多级路由\\n\\n```javascript\\nimport Vue from \'vue\'\\nimport VueRouter from \'vue-router\'\\n\\nVue.use(VueRouter)\\n\\nconst routes = [\\n    //多级路由方式创建一：只需要添加children的值，值为创建一个新的路由，children的值是一个数组\\n    //二级路由访问路径为：一级路由地址/二级路由地址\\n    {\\n        path: \'/image4\',\\n        name: \'Image4\',\\n        component: () => import(\'@/views/图片展示/图片4\'),\\n        children: [\\n            //一个一个嵌套即可\\n            {\\n                path: \'/image1\', \\n                name: \'Image1\', \\n                component: () => import(\'@/views/图片展示/图片1\')\\n            }\\n        ]\\n    },\\n\\n]\\n\\nconst router = new VueRouter({\\n    mode: \'history\',\\n    base: process.env.BASE_URL,\\n    routes\\n})\\n\\nexport default router\\n\\n```\\n\\n\\n\\n## 路由query参数—router-link\\n\\n```vue\\n<template>\\n    <div id=\\\"app\\\">\\n        <router-view/>\\n        <!-- 跳转路由并携带query参数，to的字符串写法 -->\\n        <router-link :to=\\\"`/home?id=${1}&title=${\'测试\'}`\\\">测试</router-link>\\n        <!-- 跳转路由并携带query参数，to的对象写法 -->\\n        <router-link :to=\\\"{path:\'/home\',query:{id:1,title:\'测试\'}}\\\">路由测试</router-link>\\n    </div>\\n</template>\\n```\\n\\n\\n\\n## 命名路由\\n\\n利用路由的`name`的值访问路由\\n\\n- 定义一个路由\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import VueRouter from \'vue-router\'\\n  \\n  Vue.use(VueRouter)\\n  \\n  const routes = [\\n      {path: \'/image4\', name: \'Image4\', component: () => import(\'@/views/index\')},\\n  ]\\n  \\n  const router = new VueRouter({\\n      mode: \'history\',\\n      base: process.env.BASE_URL,\\n      routes\\n  })\\n  \\n  export default router\\n  ```\\n\\n- 利用路由的`path和name`属性访问组件\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <!-- 使用name属性访问 -->\\n          <router-link :to=\\\"{name:\'Image4\'}\\\">测试</router-link><br/>\\n          <!-- 使用path属性访问 -->\\n          <router-link :to=\\\"{path:\'image4\'}\\\">测试</router-link><br/>\\n          <!-- 直接写路径，可以默认为path的值 -->\\n          <router-link to=\\\"/image4\\\">测试</router-link><br/>\\n      </div>\\n  </template>\\n  ```\\n\\n\\n\\n\\n\\n\\n# [css解决文本溢出](https://www.php.cn/css-tutorial-409501.html)\\n\\n```css\\n*{\\n    overflow: hidden;\\n\\t\\t\\t\\ttext-overflow: ellipsis;\\n\\t\\t\\t\\tdisplay: -webkit-box;\\n    \\t\\t\\t//设置几行开始使用省略号\\n\\t\\t\\t\\t-webkit-line-clamp: 3;\\n\\t\\t\\t\\t-webkit-box-orient: vertical;\\n}\\n```\\n\\n\\n\\n\\n\\n\\n\\n# 格式化配置文件\\n\\n> **命名为`.editorconfig`文件**\\n\\n```\\n# 告诉EditorConfig插件，这是根文件，不用继续往上查找\\nroot = true\\n\\n# 匹配全部文件\\n[*]\\n# 结尾换行符，可选\\\"lf\\\"、\\\"cr\\\"、\\\"crlf\\\"\\nend_of_line = lf\\n# 在文件结尾插入新行\\ninsert_final_newline = true\\n# 删除一行中的前后空格\\ntrim_trailing_whitespace = true\\n# 匹配js和py结尾的文件\\n[*.{js,py,vue, html, css}]\\n# 设置字符集\\ncharset = utf-8\\n\\n# 匹配py结尾的文件\\n[*.{js, py, vue, html}]\\n# 缩进风格，可选\\\"space\\\"、\\\"tab\\\"\\nindent_style = space\\n# 缩进的空格数\\nindent_size = 4\\n\\n# 以下匹配，类同\\n[Makefile]\\nindent_style = tab\\n# tab的宽度\\ntab_width = 4\\n\\n# 以下匹配，类同\\n[lib/**.js]\\nindent_style = space\\nindent_size = 2\\n\\n[{package.json, .travis.yml}]\\nindent_style = space\\nindent_size = 2\\n\\n```\\n\\n\\n\\n\\n\\n\\n\\n# CSS重置样式表和基础样式\\n\\n## reset.css\\n\\n```css\\n/* http://meyerweb.com/eric/tools/css/reset/ \\n   v2.0 | 20110126\\n   License: none (public domain)\\n*/\\n\\nhtml, body, div, span, applet, object, iframe,\\nh1, h2, h3, h4, h5, h6, p, blockquote, pre,\\na, abbr, acronym, address, big, cite, code,\\ndel, dfn, em, img, ins, kbd, q, s, samp,\\nsmall, strike, strong, sub, sup, tt, var,\\nb, u, i, center,\\ndl, dt, dd, ol, ul, li,\\nfieldset, form, label, legend,\\ntable, caption, tbody, tfoot, thead, tr, th, td,\\narticle, aside, canvas, details, embed, \\nfigure, figcaption, footer, header, hgroup, \\nmenu, nav, output, ruby, section, summary,\\ntime, mark, audio, video {\\n\\tmargin: 0;\\n\\tpadding: 0;\\n\\tborder: 0;\\n\\tfont-size: 100%;\\n\\tfont: inherit;\\n\\tvertical-align: baseline;\\n}\\n/* HTML5 display-role reset for older browsers */\\narticle, aside, details, figcaption, figure, \\nfooter, header, hgroup, menu, nav, section {\\n\\tdisplay: block;\\n}\\nbody {\\n\\tline-height: 1;\\n}\\nol, ul {\\n\\tlist-style: none;\\n}\\nblockquote, q {\\n\\tquotes: none;\\n}\\nblockquote:before, blockquote:after,\\nq:before, q:after {\\n\\tcontent: \'\';\\n\\tcontent: none;\\n}\\ntable {\\n\\tborder-collapse: collapse;\\n\\tborder-spacing: 0;\\n}\\n```\\n\\n\\n\\n\\n\\n## normalize.css\\n\\n```css\\n/*! normalize.css v8.0.1 | MIT License | github.com/necolas/normalize.css */\\n\\n/* Document\\n   ========================================================================== */\\n\\n/**\\n * 1. Correct the line height in all browsers.\\n * 2. Prevent adjustments of font size after orientation changes in iOS.\\n */\\n\\nhtml {\\n  line-height: 1.15; /* 1 */\\n  -webkit-text-size-adjust: 100%; /* 2 */\\n}\\n\\n/* Sections\\n   ========================================================================== */\\n\\n/**\\n * Remove the margin in all browsers.\\n */\\n\\nbody {\\n  margin: 0;\\n}\\n\\n/**\\n * Render the `main` element consistently in IE.\\n */\\n\\nmain {\\n  display: block;\\n}\\n\\n/**\\n * Correct the font size and margin on `h1` elements within `section` and\\n * `article` contexts in Chrome, Firefox, and Safari.\\n */\\n\\nh1 {\\n  font-size: 2em;\\n  margin: 0.67em 0;\\n}\\n\\n/* Grouping content\\n   ========================================================================== */\\n\\n/**\\n * 1. Add the correct box sizing in Firefox.\\n * 2. Show the overflow in Edge and IE.\\n */\\n\\nhr {\\n  box-sizing: content-box; /* 1 */\\n  height: 0; /* 1 */\\n  overflow: visible; /* 2 */\\n}\\n\\n/**\\n * 1. Correct the inheritance and scaling of font size in all browsers.\\n * 2. Correct the odd `em` font sizing in all browsers.\\n */\\n\\npre {\\n  font-family: monospace, monospace; /* 1 */\\n  font-size: 1em; /* 2 */\\n}\\n\\n/* Text-level semantics\\n   ========================================================================== */\\n\\n/**\\n * Remove the gray background on active links in IE 10.\\n */\\n\\na {\\n  background-color: transparent;\\n}\\n\\n/**\\n * 1. Remove the bottom border in Chrome 57-\\n * 2. Add the correct text decoration in Chrome, Edge, IE, Opera, and Safari.\\n */\\n\\nabbr[title] {\\n  border-bottom: none; /* 1 */\\n  text-decoration: underline; /* 2 */\\n  text-decoration: underline dotted; /* 2 */\\n}\\n\\n/**\\n * Add the correct font weight in Chrome, Edge, and Safari.\\n */\\n\\nb,\\nstrong {\\n  font-weight: bolder;\\n}\\n\\n/**\\n * 1. Correct the inheritance and scaling of font size in all browsers.\\n * 2. Correct the odd `em` font sizing in all browsers.\\n */\\n\\ncode,\\nkbd,\\nsamp {\\n  font-family: monospace, monospace; /* 1 */\\n  font-size: 1em; /* 2 */\\n}\\n\\n/**\\n * Add the correct font size in all browsers.\\n */\\n\\nsmall {\\n  font-size: 80%;\\n}\\n\\n/**\\n * Prevent `sub` and `sup` elements from affecting the line height in\\n * all browsers.\\n */\\n\\nsub,\\nsup {\\n  font-size: 75%;\\n  line-height: 0;\\n  position: relative;\\n  vertical-align: baseline;\\n}\\n\\nsub {\\n  bottom: -0.25em;\\n}\\n\\nsup {\\n  top: -0.5em;\\n}\\n\\n/* Embedded content\\n   ========================================================================== */\\n\\n/**\\n * Remove the border on images inside links in IE 10.\\n */\\n\\nimg {\\n  border-style: none;\\n}\\n\\n/* Forms\\n   ========================================================================== */\\n\\n/**\\n * 1. Change the font styles in all browsers.\\n * 2. Remove the margin in Firefox and Safari.\\n */\\n\\nbutton,\\ninput,\\noptgroup,\\nselect,\\ntextarea {\\n  font-family: inherit; /* 1 */\\n  font-size: 100%; /* 1 */\\n  line-height: 1.15; /* 1 */\\n  margin: 0; /* 2 */\\n}\\n\\n/**\\n * Show the overflow in IE.\\n * 1. Show the overflow in Edge.\\n */\\n\\nbutton,\\ninput { /* 1 */\\n  overflow: visible;\\n}\\n\\n/**\\n * Remove the inheritance of text transform in Edge, Firefox, and IE.\\n * 1. Remove the inheritance of text transform in Firefox.\\n */\\n\\nbutton,\\nselect { /* 1 */\\n  text-transform: none;\\n}\\n\\n/**\\n * Correct the inability to style clickable types in iOS and Safari.\\n */\\n\\nbutton,\\n[type=\\\"button\\\"],\\n[type=\\\"reset\\\"],\\n[type=\\\"submit\\\"] {\\n  -webkit-appearance: button;\\n}\\n\\n/**\\n * Remove the inner border and padding in Firefox.\\n */\\n\\nbutton::-moz-focus-inner,\\n[type=\\\"button\\\"]::-moz-focus-inner,\\n[type=\\\"reset\\\"]::-moz-focus-inner,\\n[type=\\\"submit\\\"]::-moz-focus-inner {\\n  border-style: none;\\n  padding: 0;\\n}\\n\\n/**\\n * Restore the focus styles unset by the previous rule.\\n */\\n\\nbutton:-moz-focusring,\\n[type=\\\"button\\\"]:-moz-focusring,\\n[type=\\\"reset\\\"]:-moz-focusring,\\n[type=\\\"submit\\\"]:-moz-focusring {\\n  outline: 1px dotted ButtonText;\\n}\\n\\n/**\\n * Correct the padding in Firefox.\\n */\\n\\nfieldset {\\n  padding: 0.35em 0.75em 0.625em;\\n}\\n\\n/**\\n * 1. Correct the text wrapping in Edge and IE.\\n * 2. Correct the color inheritance from `fieldset` elements in IE.\\n * 3. Remove the padding so developers are not caught out when they zero out\\n *    `fieldset` elements in all browsers.\\n */\\n\\nlegend {\\n  box-sizing: border-box; /* 1 */\\n  color: inherit; /* 2 */\\n  display: table; /* 1 */\\n  max-width: 100%; /* 1 */\\n  padding: 0; /* 3 */\\n  white-space: normal; /* 1 */\\n}\\n\\n/**\\n * Add the correct vertical alignment in Chrome, Firefox, and Opera.\\n */\\n\\nprogress {\\n  vertical-align: baseline;\\n}\\n\\n/**\\n * Remove the default vertical scrollbar in IE 10+.\\n */\\n\\ntextarea {\\n  overflow: auto;\\n}\\n\\n/**\\n * 1. Add the correct box sizing in IE 10.\\n * 2. Remove the padding in IE 10.\\n */\\n\\n[type=\\\"checkbox\\\"],\\n[type=\\\"radio\\\"] {\\n  box-sizing: border-box; /* 1 */\\n  padding: 0; /* 2 */\\n}\\n\\n/**\\n * Correct the cursor style of increment and decrement buttons in Chrome.\\n */\\n\\n[type=\\\"number\\\"]::-webkit-inner-spin-button,\\n[type=\\\"number\\\"]::-webkit-outer-spin-button {\\n  height: auto;\\n}\\n\\n/**\\n * 1. Correct the odd appearance in Chrome and Safari.\\n * 2. Correct the outline style in Safari.\\n */\\n\\n[type=\\\"search\\\"] {\\n  -webkit-appearance: textfield; /* 1 */\\n  outline-offset: -2px; /* 2 */\\n}\\n\\n/**\\n * Remove the inner padding in Chrome and Safari on macOS.\\n */\\n\\n[type=\\\"search\\\"]::-webkit-search-decoration {\\n  -webkit-appearance: none;\\n}\\n\\n/**\\n * 1. Correct the inability to style clickable types in iOS and Safari.\\n * 2. Change font properties to `inherit` in Safari.\\n */\\n\\n::-webkit-file-upload-button {\\n  -webkit-appearance: button; /* 1 */\\n  font: inherit; /* 2 */\\n}\\n\\n/* Interactive\\n   ========================================================================== */\\n\\n/*\\n * Add the correct display in Edge, IE 10+, and Firefox.\\n */\\n\\ndetails {\\n  display: block;\\n}\\n\\n/*\\n * Add the correct display in all browsers.\\n */\\n\\nsummary {\\n  display: list-item;\\n}\\n\\n/* Misc\\n   ========================================================================== */\\n\\n/**\\n * Add the correct display in IE 10+.\\n */\\n\\ntemplate {\\n  display: none;\\n}\\n\\n/**\\n * Add the correct display in IE 10.\\n */\\n\\n[hidden] {\\n  display: none;\\n}\\n```\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"http://你的文件上传子域名/articles/c7313dc52ddce8ed0b270e10216e7b68.jpg\",\"articleTitle\":\"vue开发技巧\",\"categoryName\":\"vue\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-29 15:03:34', NULL);
INSERT INTO `tb_operation_log` VALUES (1085, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":904,\"pageCover\":\"http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/config/a4fb6d1e58293bcbf80b91180e16fd1c.jpg\",\"pageLabel\":\"talk\",\"pageName\":\"说说\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-29 20:47:23', NULL);
INSERT INTO `tb_operation_log` VALUES (1086, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":904,\"pageCover\":\"http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/config/38e11f49ed056af97413dc222d0c9408.jpg\",\"pageLabel\":\"talk\",\"pageName\":\"说说\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-29 20:59:48', NULL);
INSERT INTO `tb_operation_log` VALUES (1087, '分类模块', '新增或修改', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.saveOrUpdateCategory', '添加或修改分类', '[{\"categoryName\":\"Java\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-29 21:35:14', NULL);
INSERT INTO `tb_operation_log` VALUES (1088, '分类模块', '新增或修改', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.saveOrUpdateCategory', '添加或修改分类', '[{\"categoryName\":\"前端\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-29 21:35:19', NULL);
INSERT INTO `tb_operation_log` VALUES (1089, '分类模块', '新增或修改', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.saveOrUpdateCategory', '添加或修改分类', '[{\"categoryName\":\"后端\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-29 21:35:25', NULL);
INSERT INTO `tb_operation_log` VALUES (1090, '评论模块', '删除', '/admin/comments', 'com.minzheng.blog.controller.CommentController.deleteComments', '删除评论', '[[730,729,728,727,726,725]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-29 21:36:03', NULL);
INSERT INTO `tb_operation_log` VALUES (1091, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"# [vue.config.js](https://cli.vuejs.org/zh/config/)\\n\\n## 设置`@`符号\\n\\n```javascript\\n\'use strict\'\\n\\nconst path = require(\'path\')\\nfunction resolve(dir) {\\n    return path.join(__dirname, dir)\\n}\\n\\nmodule.exports = {\\n    //设置@的作用\\n    configureWebpack: {\\n        resolve: {\\n            alias: {\\n                \'@\': resolve(\'src\')//在项目中使用@，会指定先src的目录下面\\n            }\\n        }\\n    },\\n}\\n\\n```\\n\\n\\n\\n## 设置代理\\n\\n> **将任何未知的请求代理到指定服务器**\\n\\n```javascript\\nmodule.exports = {\\n    devServer: {\\n        // 将所有未知的请求代理到下面指定的服务器上  \\n        proxy: \'http://localhost:4000\'\\n    }\\n}\\n```\\n\\n> **将不同路径代理到不同服务器中**\\n\\n```javascript\\nmodule.exports = {\\n    devServer: {\\n        proxy: {\\n            // 将api开头的路径的请求代理到url中  \\n            \'/api\': {\\n                target: \'<url>\',\\n                ws: true,\\n                changeOrigin: true\\n            },\\n            // 将foo开头的路径的请求代理到other_url中  \\n            \'/foo\': {\\n                target: \'<other_url>\'\\n            }\\n        }\\n    }\\n}\\n```\\n\\n\\n\\n## 关闭代码检查\\n\\n```javascript\\nmodule.exports = {\\n    lintOnSave: false,\\n}\\n```\\n\\n\\n\\n\\n\\n## vue配置文件模板\\n\\n```javascript\\n\'use strict\'\\n\\nconst path = require(\'path\')\\nfunction resolve(dir) {\\n    return path.join(__dirname, dir)\\n}\\n\\nmodule.exports = {\\n    //关闭代码检查\\n    lintOnSave: false,\\n    \\n    //设置代理\\n    devServer: {\\n        proxy: {\\n            //设置为0.0.0.0之后，同一局域网内可以直接访问项目\\n            host: \'0.0.0.0\',\\n            //端口号\\n            port: 80,\\n            //是否自动打开浏览器\\n            open: true,\\n            //将路径请求为api开头的请求代理到target指定的服务器中\\n            \'/api\':{\\n                target:\'http://localhost:8080\'\\n            }\\n        }\\n    },\\n    //设置@的作用\\n    configureWebpack: {\\n        resolve: {\\n            alias: {\\n                \'@\': resolve(\'src\')//在项目中使用@，会指定先src的目录下面\\n            }\\n        }\\n    },\\n}\\n```\\n\\n\\n\\n\\n\\n\\n\\n# [vuex](https://vuex.vuejs.org/zh/)\\n\\n## vuex原理图\\n\\nvuex的原理图，在组件调用store的`dispatch`方法后，执行了`actions`中的方法（action中可以调用Ajax请求），在actions中`commit`调用`mutations`后，在`mutation和actions`中都可以修改`store`中的方法\\n\\n![image-20220517145549307](E:\\\\note\\\\开发技巧\\\\vue开发技巧.assets\\\\image-20220517145549307.png)\\n\\n当在`actions`中不需要进行什么操作（直接将接收的值传入mutations中的时候）可以在组件中不需要调用`actions`，直接在组件中直接`commit调用mutations`，可以直接越过`actions`\\n\\n![image-20220517145909111](E:\\\\note\\\\开发技巧\\\\vue开发技巧.assets\\\\image-20220517145909111.png)\\n\\n## vuex的基本使用\\n\\n\\n\\n### 创建store\\n\\n- 在src下面创建一个文件夹`store`，创建一个文件`index.js`，写入以下内容\\n\\n  ```javascript\\n  //引入vue\\n  import Vue from \'vue\'\\n  //引入vuex\\n  import Vuex from \'vuex\'\\n  \\n  //在vue中使用vuex\\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      //用于响应组件中的动作\\n      actions: {},\\n      //用于操作数据（state）\\n      mutations: {},\\n      //用于存储数据\\n      state: {},\\n      //用于将state中的数据进行加工，比如state中sum+1\\n      getters: {},\\n      //用于存放vuex的各个模块，进行模块化管理时使用\\n      modules: {}\\n  })\\n  ```\\n\\n- 在src下面的`main.js`中引入上面创建的`store`文件\\n\\n  ```javascript\\n  //在main.js文件中引入store\\n  import store from \'./store\'\\n  new Vue({\\n      ........\\n      //在vue实例中引入store\\n    \\tstore,\\n  }).$mount(\'#app\')\\n  ```\\n\\n\\n\\n### vuex的基本使用\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {\\n          jia(context, value) {\\n              context.commit(\'JIA\', value)\\n          }\\n      },\\n      mutations: {\\n          JIA(state, value) {\\n              state.sum += value\\n          }\\n      },\\n      state: {\\n          sum: 0,\\n      },\\n      getters: {\\n          bigSum(state){\\n              return state.sum + 10\\n          }\\n      },\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中操作store。**使用`this.$store.dispatch(actions中的方法或mutations中的方法，传入的值)`**\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div @click=\\\"storeJia\\\">操作store</div>\\n          <!-- 获取state中的数据 -->\\n          <div style=\\\"font-size: 20px;\\\">{{$store.state.sum}}</div>\\n          <!-- 获取getters中的数据 -->\\n          <div style=\\\"font-size: 20px;\\\">{{$store.getters.bigSum}}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  export default {\\n      methods: {\\n          storeJia() {\\n              this.$store.dispatch(\'jia\', 2)\\n          }\\n      },\\n  }\\n  </script>\\n  \\n  ```\\n\\n- 在组件中访问`store / getters`\\n\\n  - 在`template`中使用插值语法`{{}}`访问：\\n    - 访问store：`{{$store.state.state中的变量}}`\\n    - 访问getters：`{{$store.getters.getters中的变量}}`\\n\\n\\n\\n### vuex的进阶使用—mapState\\n\\n在vue组件中使用store中的数据时，总是要使用`$store.state.state中的变量`访问变量，所以vuex提供了`mapState`结合vue提供的`computen计算属性`一起使用能够快捷的访问state中的属性\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用state中的数据\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {},\\n      mutations: {},\\n      state: {\\n          sum: 0,\\n          username: \'张三\'\\n      },\\n      getters: {},\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中使用`mapState`：在计算属性`computed`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapState({sum:\'state中的变量\',username:\'state中的变量\'})`\\n  - 使用方式而：`...mapState([state中的变量1 , state中的变量2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px;\\\">{{ username1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ username }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  // 引入vuex中的mapState\\n  import {mapState} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          //使用对象接收store中的数据，可以重新赋变量名，可以和store中的数据一致\\n          ...mapState({sum1: \'sum\', username1: \'username\'}),\\n          //使用数组接收store中的数据，变量名为store中的变量名\\n          ...mapState([\'sum\', \'username\']),\\n      },\\n  }\\n  </script>\\n  ```\\n\\n  \\n\\n### vuex的进阶使用—mapGetters\\n\\n在vue组件中使用getters中的数据时，总是要使用`$store.getters.getters中的变量`访问变量，所以vuex提供了`mapGerrers`结合vue提供的`computen计算属性`一起使用能够快捷的访问getters中的属性\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用getters中的数据\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {},\\n      mutations: {},\\n      state: {\\n          sum: 0,\\n          username: \'张三\'\\n      },\\n      getters: {\\n          bigSum(state) {\\n              return state.sum + 10\\n          },\\n          newUsername(state){\\n              return state.username+\\\"是好人\\\"\\n          }\\n      },\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中使用`mapGetters`：在计算属性`computed`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapGetters({sum:\'getters中的变量\',username:\'getters中的变量\'})`\\n  - 使用方式而：`...mapGetters([getters中的变量1 , getters中的变量2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px;\\\">{{ bigSum1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ newUsername1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ bigSum }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ newUsername }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  //从vuex中引入mapGetters\\n  import {mapGetters} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          ...mapGetters({bigSum1: \'bigSum\', newUsername1: \'newUsername\'}),\\n          ...mapGetters([\'bigSum\', \'newUsername\']),\\n      },\\n  }\\n  </script>\\n  ```\\n\\n\\n\\n\\n\\n### vuex的进阶使用—mapActions\\n\\n在vue组件中使用actions中的方法时，总是要使用`this.$store.dispatch(\'actions中的方法\', 需要传入的值)`访问actions中的方法，所以vuex提供了`mapActions`结合vue提供的`methods`一起使用能够快捷的访问actions中的方法\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用actions中的方法\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {\\n          jia(context, value) {\\n              context.commit(\'JIA\', value)\\n          },\\n          jian(context, value) {\\n              context.commit(\'JIAN\', value)\\n          }\\n      },\\n      mutations: {\\n          JIA(state, value) {\\n              state.sum += value\\n          },\\n          JIAN(state, value) {\\n              state.sum -= value\\n          }\\n      },\\n      state: {\\n          sum: 0,\\n      },\\n      getters: {},\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中使用`mapActions`：在`methods`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapActions({jia1:\'actios中的方法\',jian1:\'actions中的方法\'})`\\n  - 使用方式而：`...mapActions([actions中的方法1 , actions中的方法2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jia(1)\\\">jia</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jian(1)\\\">jian</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jia1(1)\\\">jia1</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jian1(1)\\\">jian1</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  import {mapState, mapActions} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          ...mapState([\'sum\']),\\n      },\\n      methods: {\\n          ...mapActions({jia1: \'jia\', jian1: \'jian\'}),\\n          ...mapActions([\'jia\', \'jian\']),\\n      },\\n  }\\n  </script>\\n  ```\\n\\n  \\n\\n### vuex的进阶使用—mapMutations\\n在vue组件中使用actions中的方法时，总是要使用`this.$store.dispatch(\'mutations中的方法\', 需要传入的值)`访问mutations中的方法，所以vuex提供了`mapMutations`结合vue提供的`methods`一起使用能够快捷的访问mutations中的方法\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用mutations中的方法\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {},\\n      mutations: {\\n          JIA(state, value) {\\n              state.sum += value\\n          },\\n          JIAN(state, value) {\\n              state.sum -= value\\n          }\\n      },\\n      state: {\\n          sum: 0,\\n      },\\n      getters: {},\\n      modules: {}\\n  })\\n  ```\\n  \\n- 在组件中使用`mapMutations`：在`methods`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapMutations({JIA1:\'mutations中的方法\',JIAN1:\'mutations中的方法\'})`\\n  - 使用方式而：`...mapMutations([mutations中的方法1 , mutations中的方法2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIA1(1)\\\">JIA1</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIAN1(1)\\\">JIAN1</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIA(1)\\\">JIA</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIAN(1)\\\">JIAN</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  import {mapState ,mapMutations} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          ...mapState([\'sum\']),\\n      },\\n      methods: {\\n          ...mapMutations({JIA1: \'JIA\', JIAN1: \'JIAN\'}),\\n          ...mapMutations([\'JIA\', \'JIAN\']),\\n      },\\n  }\\n  </script>\\n  \\n  ```\\n  \\n  \\n\\n## vuex模块化+命名空间\\n\\n模块化可以将多个store整合到一个store中，需要在每个store中需要将`namespaced: true`\\n\\n### 创建store\\n\\n- 创建子模块 person，里面用于放入一些用户的基本信息\\n\\n  ```javascript\\n  export default {\\n      namespaced: true,\\n      //用于响应组件中的动作\\n      actions: {\\n          append(context, value) {\\n              context.commit(\\\"APPEND\\\", value)\\n          }\\n      },\\n      //用于操作数据（state）\\n      mutations: {\\n          APPEND(state, value) {\\n              state.username += value\\n          }\\n      },\\n      //用于存储数据\\n      state: {\\n          username: \\\"张三\\\"\\n      },\\n      //用于将state中的数据进行加工，比如state中sum+1\\n      getters: {\\n          newUsername(state){\\n              return state.username+\\\"是个好人\\\"\\n          }\\n      },\\n      //用于存放vuex的各个模块，进行模块化管理时使用\\n      modules: {}\\n  }\\n  ```\\n\\n- 创建sum，里面用于放一些运算操作\\n\\n  ```javascript\\n  export default {\\n      namespaced: true,\\n      //用于响应组件中的动作\\n      actions: {\\n          sum(context, value) {\\n              context.commit(\'SUM\', value)\\n          }\\n      },\\n      //用于操作数据（state）\\n      mutations: {\\n          SUM(state, value) {\\n              state.sumValue += value\\n          }\\n      },\\n      //用于存储数据\\n      state: {\\n          sumValue: 20\\n      },\\n      //用于将state中的数据进行加工，比如state中sum+1\\n      getters: {\\n          bigSumValue(state) {\\n              return state.sumValue + 20\\n          }\\n      },\\n      //用于存放vuex的各个模块，进行模块化管理时使用\\n      modules: {}\\n  }\\n  ```\\n\\n- 创建index，用于整合所有模块\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  //引入一个一个的store\\n  import sum from \'./sum\'\\n  import person from \'./person\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      modules: {\\n          sum: sum, \\n          person: person\\n      }\\n  })\\n  ```\\n\\n\\n\\n### 在vue中使用模块化中的store数据\\n\\n```vue\\n<template>\\n    <div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"append(\'测试\')\\\">append</div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"APPEND(\'测试2\')\\\">APPEND</div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"sum(20)\\\">sum</div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"SUM(10)\\\">SUM</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ username }}</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ newUsername }}</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ sumValue }}</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ bigSumValue }}</div>\\n    </div>\\n</template>\\n\\n<script>\\nimport {mapState, mapGetters, mapActions, mapMutations} from \'vuex\'\\n\\nexport default {\\n    computed: {\\n        //使用vuex提供的mapXxx方法\\n        ...mapState(\'person\', [\'username\']),\\n        ...mapGetters(\'person\', [\'newUsername\']),\\n\\n        //从$store方法中获取\\n        bigSumValue() {\\n            return this.$store.getters[\'sum/bigSumValue\']\\n        },\\n        sumValue() {\\n            return this.$store.state.sum.sumValue\\n        }\\n    },\\n    methods: {\\n        //使用mapXxx\\n        ...mapActions(\'person\', [\'append\']),\\n        ...mapMutations(\'person\', [\'APPEND\']),\\n\\n        //使用$store获取\\n        sum() {\\n            this.$store.dispatch(\'sum/sum\', 20)\\n        },\\n        SUM() {\\n            this.$store.commit(\'sum/SUM\', 10)\\n        }\\n    },\\n}\\n</script>\\n```\\n\\n\\n\\n\\n\\n## [vuex持久化](https://blog.csdn.net/weixin_52283244/article/details/119058888)\\n\\n[博客2：](https://juejin.cn/post/6918684399659646989)https://juejin.cn/post/6918684399659646989\\n\\n# [vue-router](https://router.vuejs.org/zh/)\\n\\n## vue-router参数详解\\n\\n\\n\\n\\n\\n## router-link标签参数详解\\n\\n\\n\\n## 一级路由\\n\\n```javascript\\nimport Vue from \'vue\'\\nimport VueRouter from \'vue-router\'\\n\\n//引入组件\\nimport Home from \'../components/Home\'\\n\\nVue.use(VueRouter)\\n\\n/*\\nname：可以用于\\n\\n*/\\n\\n//创建路由\\nconst routes = [\\n    //创建路由方式一：使用import函数，直接找到组件，不用在开头引入组件，推荐使用\\n    {path: \'/\', name: \'Index\', component: () => import(\'@/views/index\')},\\n    //创建路由方式二：需要在开头先使用import引入组件，再到下面定义路由\\n    {path:\'/home\', name: \'home\', component:Home},\\n\\n]\\n\\nconst router = new VueRouter({\\n    mode: \'history\',\\n    base: process.env.BASE_URL,\\n    routes\\n})\\n\\nexport default router\\n\\n```\\n\\n\\n\\n## 多级路由\\n\\n```javascript\\nimport Vue from \'vue\'\\nimport VueRouter from \'vue-router\'\\n\\nVue.use(VueRouter)\\n\\nconst routes = [\\n    //多级路由方式创建一：只需要添加children的值，值为创建一个新的路由，children的值是一个数组\\n    //二级路由访问路径为：一级路由地址/二级路由地址\\n    {\\n        path: \'/image4\',\\n        name: \'Image4\',\\n        component: () => import(\'@/views/图片展示/图片4\'),\\n        children: [\\n            //一个一个嵌套即可\\n            {\\n                path: \'/image1\', \\n                name: \'Image1\', \\n                component: () => import(\'@/views/图片展示/图片1\')\\n            }\\n        ]\\n    },\\n\\n]\\n\\nconst router = new VueRouter({\\n    mode: \'history\',\\n    base: process.env.BASE_URL,\\n    routes\\n})\\n\\nexport default router\\n\\n```\\n\\n\\n\\n## 路由query参数—router-link\\n\\n```vue\\n<template>\\n    <div id=\\\"app\\\">\\n        <router-view/>\\n        <!-- 跳转路由并携带query参数，to的字符串写法 -->\\n        <router-link :to=\\\"`/home?id=${1}&title=${\'测试\'}`\\\">测试</router-link>\\n        <!-- 跳转路由并携带query参数，to的对象写法 -->\\n        <router-link :to=\\\"{path:\'/home\',query:{id:1,title:\'测试\'}}\\\">路由测试</router-link>\\n    </div>\\n</template>\\n```\\n\\n\\n\\n## 命名路由\\n\\n利用路由的`name`的值访问路由\\n\\n- 定义一个路由\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import VueRouter from \'vue-router\'\\n  \\n  Vue.use(VueRouter)\\n  \\n  const routes = [\\n      {path: \'/image4\', name: \'Image4\', component: () => import(\'@/views/index\')},\\n  ]\\n  \\n  const router = new VueRouter({\\n      mode: \'history\',\\n      base: process.env.BASE_URL,\\n      routes\\n  })\\n  \\n  export default router\\n  ```\\n\\n- 利用路由的`path和name`属性访问组件\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <!-- 使用name属性访问 -->\\n          <router-link :to=\\\"{name:\'Image4\'}\\\">测试</router-link><br/>\\n          <!-- 使用path属性访问 -->\\n          <router-link :to=\\\"{path:\'image4\'}\\\">测试</router-link><br/>\\n          <!-- 直接写路径，可以默认为path的值 -->\\n          <router-link to=\\\"/image4\\\">测试</router-link><br/>\\n      </div>\\n  </template>\\n  ```\\n\\n\\n\\n\\n\\n\\n# [css解决文本溢出](https://www.php.cn/css-tutorial-409501.html)\\n\\n```css\\n*{\\n    overflow: hidden;\\n\\t\\t\\t\\ttext-overflow: ellipsis;\\n\\t\\t\\t\\tdisplay: -webkit-box;\\n    \\t\\t\\t//设置几行开始使用省略号\\n\\t\\t\\t\\t-webkit-line-clamp: 3;\\n\\t\\t\\t\\t-webkit-box-orient: vertical;\\n}\\n```\\n\\n\\n\\n\\n\\n\\n\\n# 格式化配置文件\\n\\n> **命名为`.editorconfig`文件**\\n\\n```\\n# 告诉EditorConfig插件，这是根文件，不用继续往上查找\\nroot = true\\n\\n# 匹配全部文件\\n[*]\\n# 结尾换行符，可选\\\"lf\\\"、\\\"cr\\\"、\\\"crlf\\\"\\nend_of_line = lf\\n# 在文件结尾插入新行\\ninsert_final_newline = true\\n# 删除一行中的前后空格\\ntrim_trailing_whitespace = true\\n# 匹配js和py结尾的文件\\n[*.{js,py,vue, html, css}]\\n# 设置字符集\\ncharset = utf-8\\n\\n# 匹配py结尾的文件\\n[*.{js, py, vue, html}]\\n# 缩进风格，可选\\\"space\\\"、\\\"tab\\\"\\nindent_style = space\\n# 缩进的空格数\\nindent_size = 4\\n\\n# 以下匹配，类同\\n[Makefile]\\nindent_style = tab\\n# tab的宽度\\ntab_width = 4\\n\\n# 以下匹配，类同\\n[lib/**.js]\\nindent_style = space\\nindent_size = 2\\n\\n[{package.json, .travis.yml}]\\nindent_style = space\\nindent_size = 2\\n\\n```\\n\\n\\n\\n\\n\\n\\n\\n# CSS重置样式表和基础样式\\n\\n## reset.css\\n\\n```css\\n/* http://meyerweb.com/eric/tools/css/reset/ \\n   v2.0 | 20110126\\n   License: none (public domain)\\n*/\\n\\nhtml, body, div, span, applet, object, iframe,\\nh1, h2, h3, h4, h5, h6, p, blockquote, pre,\\na, abbr, acronym, address, big, cite, code,\\ndel, dfn, em, img, ins, kbd, q, s, samp,\\nsmall, strike, strong, sub, sup, tt, var,\\nb, u, i, center,\\ndl, dt, dd, ol, ul, li,\\nfieldset, form, label, legend,\\ntable, caption, tbody, tfoot, thead, tr, th, td,\\narticle, aside, canvas, details, embed, \\nfigure, figcaption, footer, header, hgroup, \\nmenu, nav, output, ruby, section, summary,\\ntime, mark, audio, video {\\n\\tmargin: 0;\\n\\tpadding: 0;\\n\\tborder: 0;\\n\\tfont-size: 100%;\\n\\tfont: inherit;\\n\\tvertical-align: baseline;\\n}\\n/* HTML5 display-role reset for older browsers */\\narticle, aside, details, figcaption, figure, \\nfooter, header, hgroup, menu, nav, section {\\n\\tdisplay: block;\\n}\\nbody {\\n\\tline-height: 1;\\n}\\nol, ul {\\n\\tlist-style: none;\\n}\\nblockquote, q {\\n\\tquotes: none;\\n}\\nblockquote:before, blockquote:after,\\nq:before, q:after {\\n\\tcontent: \'\';\\n\\tcontent: none;\\n}\\ntable {\\n\\tborder-collapse: collapse;\\n\\tborder-spacing: 0;\\n}\\n```\\n\\n\\n\\n\\n\\n## normalize.css\\n\\n```css\\n/*! normalize.css v8.0.1 | MIT License | github.com/necolas/normalize.css */\\n\\n/* Document\\n   ========================================================================== */\\n\\n/**\\n * 1. Correct the line height in all browsers.\\n * 2. Prevent adjustments of font size after orientation changes in iOS.\\n */\\n\\nhtml {\\n  line-height: 1.15; /* 1 */\\n  -webkit-text-size-adjust: 100%; /* 2 */\\n}\\n\\n/* Sections\\n   ========================================================================== */\\n\\n/**\\n * Remove the margin in all browsers.\\n */\\n\\nbody {\\n  margin: 0;\\n}\\n\\n/**\\n * Render the `main` element consistently in IE.\\n */\\n\\nmain {\\n  display: block;\\n}\\n\\n/**\\n * Correct the font size and margin on `h1` elements within `section` and\\n * `article` contexts in Chrome, Firefox, and Safari.\\n */\\n\\nh1 {\\n  font-size: 2em;\\n  margin: 0.67em 0;\\n}\\n\\n/* Grouping content\\n   ========================================================================== */\\n\\n/**\\n * 1. Add the correct box sizing in Firefox.\\n * 2. Show the overflow in Edge and IE.\\n */\\n\\nhr {\\n  box-sizing: content-box; /* 1 */\\n  height: 0; /* 1 */\\n  overflow: visible; /* 2 */\\n}\\n\\n/**\\n * 1. Correct the inheritance and scaling of font size in all browsers.\\n * 2. Correct the odd `em` font sizing in all browsers.\\n */\\n\\npre {\\n  font-family: monospace, monospace; /* 1 */\\n  font-size: 1em; /* 2 */\\n}\\n\\n/* Text-level semantics\\n   ========================================================================== */\\n\\n/**\\n * Remove the gray background on active links in IE 10.\\n */\\n\\na {\\n  background-color: transparent;\\n}\\n\\n/**\\n * 1. Remove the bottom border in Chrome 57-\\n * 2. Add the correct text decoration in Chrome, Edge, IE, Opera, and Safari.\\n */\\n\\nabbr[title] {\\n  border-bottom: none; /* 1 */\\n  text-decoration: underline; /* 2 */\\n  text-decoration: underline dotted; /* 2 */\\n}\\n\\n/**\\n * Add the correct font weight in Chrome, Edge, and Safari.\\n */\\n\\nb,\\nstrong {\\n  font-weight: bolder;\\n}\\n\\n/**\\n * 1. Correct the inheritance and scaling of font size in all browsers.\\n * 2. Correct the odd `em` font sizing in all browsers.\\n */\\n\\ncode,\\nkbd,\\nsamp {\\n  font-family: monospace, monospace; /* 1 */\\n  font-size: 1em; /* 2 */\\n}\\n\\n/**\\n * Add the correct font size in all browsers.\\n */\\n\\nsmall {\\n  font-size: 80%;\\n}\\n\\n/**\\n * Prevent `sub` and `sup` elements from affecting the line height in\\n * all browsers.\\n */\\n\\nsub,\\nsup {\\n  font-size: 75%;\\n  line-height: 0;\\n  position: relative;\\n  vertical-align: baseline;\\n}\\n\\nsub {\\n  bottom: -0.25em;\\n}\\n\\nsup {\\n  top: -0.5em;\\n}\\n\\n/* Embedded content\\n   ========================================================================== */\\n\\n/**\\n * Remove the border on images inside links in IE 10.\\n */\\n\\nimg {\\n  border-style: none;\\n}\\n\\n/* Forms\\n   ========================================================================== */\\n\\n/**\\n * 1. Change the font styles in all browsers.\\n * 2. Remove the margin in Firefox and Safari.\\n */\\n\\nbutton,\\ninput,\\noptgroup,\\nselect,\\ntextarea {\\n  font-family: inherit; /* 1 */\\n  font-size: 100%; /* 1 */\\n  line-height: 1.15; /* 1 */\\n  margin: 0; /* 2 */\\n}\\n\\n/**\\n * Show the overflow in IE.\\n * 1. Show the overflow in Edge.\\n */\\n\\nbutton,\\ninput { /* 1 */\\n  overflow: visible;\\n}\\n\\n/**\\n * Remove the inheritance of text transform in Edge, Firefox, and IE.\\n * 1. Remove the inheritance of text transform in Firefox.\\n */\\n\\nbutton,\\nselect { /* 1 */\\n  text-transform: none;\\n}\\n\\n/**\\n * Correct the inability to style clickable types in iOS and Safari.\\n */\\n\\nbutton,\\n[type=\\\"button\\\"],\\n[type=\\\"reset\\\"],\\n[type=\\\"submit\\\"] {\\n  -webkit-appearance: button;\\n}\\n\\n/**\\n * Remove the inner border and padding in Firefox.\\n */\\n\\nbutton::-moz-focus-inner,\\n[type=\\\"button\\\"]::-moz-focus-inner,\\n[type=\\\"reset\\\"]::-moz-focus-inner,\\n[type=\\\"submit\\\"]::-moz-focus-inner {\\n  border-style: none;\\n  padding: 0;\\n}\\n\\n/**\\n * Restore the focus styles unset by the previous rule.\\n */\\n\\nbutton:-moz-focusring,\\n[type=\\\"button\\\"]:-moz-focusring,\\n[type=\\\"reset\\\"]:-moz-focusring,\\n[type=\\\"submit\\\"]:-moz-focusring {\\n  outline: 1px dotted ButtonText;\\n}\\n\\n/**\\n * Correct the padding in Firefox.\\n */\\n\\nfieldset {\\n  padding: 0.35em 0.75em 0.625em;\\n}\\n\\n/**\\n * 1. Correct the text wrapping in Edge and IE.\\n * 2. Correct the color inheritance from `fieldset` elements in IE.\\n * 3. Remove the padding so developers are not caught out when they zero out\\n *    `fieldset` elements in all browsers.\\n */\\n\\nlegend {\\n  box-sizing: border-box; /* 1 */\\n  color: inherit; /* 2 */\\n  display: table; /* 1 */\\n  max-width: 100%; /* 1 */\\n  padding: 0; /* 3 */\\n  white-space: normal; /* 1 */\\n}\\n\\n/**\\n * Add the correct vertical alignment in Chrome, Firefox, and Opera.\\n */\\n\\nprogress {\\n  vertical-align: baseline;\\n}\\n\\n/**\\n * Remove the default vertical scrollbar in IE 10+.\\n */\\n\\ntextarea {\\n  overflow: auto;\\n}\\n\\n/**\\n * 1. Add the correct box sizing in IE 10.\\n * 2. Remove the padding in IE 10.\\n */\\n\\n[type=\\\"checkbox\\\"],\\n[type=\\\"radio\\\"] {\\n  box-sizing: border-box; /* 1 */\\n  padding: 0; /* 2 */\\n}\\n\\n/**\\n * Correct the cursor style of increment and decrement buttons in Chrome.\\n */\\n\\n[type=\\\"number\\\"]::-webkit-inner-spin-button,\\n[type=\\\"number\\\"]::-webkit-outer-spin-button {\\n  height: auto;\\n}\\n\\n/**\\n * 1. Correct the odd appearance in Chrome and Safari.\\n * 2. Correct the outline style in Safari.\\n */\\n\\n[type=\\\"search\\\"] {\\n  -webkit-appearance: textfield; /* 1 */\\n  outline-offset: -2px; /* 2 */\\n}\\n\\n/**\\n * Remove the inner padding in Chrome and Safari on macOS.\\n */\\n\\n[type=\\\"search\\\"]::-webkit-search-decoration {\\n  -webkit-appearance: none;\\n}\\n\\n/**\\n * 1. Correct the inability to style clickable types in iOS and Safari.\\n * 2. Change font properties to `inherit` in Safari.\\n */\\n\\n::-webkit-file-upload-button {\\n  -webkit-appearance: button; /* 1 */\\n  font: inherit; /* 2 */\\n}\\n\\n/* Interactive\\n   ========================================================================== */\\n\\n/*\\n * Add the correct display in Edge, IE 10+, and Firefox.\\n */\\n\\ndetails {\\n  display: block;\\n}\\n\\n/*\\n * Add the correct display in all browsers.\\n */\\n\\nsummary {\\n  display: list-item;\\n}\\n\\n/* Misc\\n   ========================================================================== */\\n\\n/**\\n * Add the correct display in IE 10+.\\n */\\n\\ntemplate {\\n  display: none;\\n}\\n\\n/**\\n * Add the correct display in IE 10.\\n */\\n\\n[hidden] {\\n  display: none;\\n}\\n```\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"https://static.talkxj.com/articles/3dffb2fcbd541886616ab54c92570de3.jpg\",\"articleTitle\":\"vue开发技巧\",\"categoryName\":\"前端\",\"id\":55,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[\"vue\"],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-29 22:15:21', NULL);
INSERT INTO `tb_operation_log` VALUES (1092, '友链模块', '新增或修改', '/admin/links', 'com.minzheng.blog.controller.FriendLinkController.saveOrUpdateFriendLink', '保存或修改友链', '[{\"id\":26,\"linkAddress\":\"http://localhost:8081/\",\"linkAvatar\":\"1\",\"linkIntro\":\"小飞\",\"linkName\":\"小飞的个人博客\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-30 19:46:14', NULL);
INSERT INTO `tb_operation_log` VALUES (1093, '友链模块', '新增或修改', '/admin/links', 'com.minzheng.blog.controller.FriendLinkController.saveOrUpdateFriendLink', '保存或修改友链', '[{\"id\":26,\"linkAddress\":\"http://localhost:8081/\",\"linkAvatar\":\"https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg\",\"linkIntro\":\"小飞\",\"linkName\":\"小飞的个人博客\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-30 19:46:24', NULL);
INSERT INTO `tb_operation_log` VALUES (1094, '友链模块', '新增或修改', '/admin/links', 'com.minzheng.blog.controller.FriendLinkController.saveOrUpdateFriendLink', '保存或修改友链', '[{\"linkAddress\":\"http://localhost:8081/\",\"linkAvatar\":\"https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg\",\"linkIntro\":\"aaa\",\"linkName\":\"aaa\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-30 19:46:50', NULL);
INSERT INTO `tb_operation_log` VALUES (1095, '友链模块', '删除', '/admin/links', 'com.minzheng.blog.controller.FriendLinkController.deleteFriendLink', '删除友链', '[[27]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-30 19:47:20', NULL);
INSERT INTO `tb_operation_log` VALUES (1096, '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"id\":904,\"pageCover\":\"http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/config/9d07275d73d810d3458d0c12e0482eaa.jpg\",\"pageLabel\":\"talk\",\"pageName\":\"说说\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-30 19:47:35', NULL);
INSERT INTO `tb_operation_log` VALUES (1097, '博客信息模块', '修改', '/admin/about', 'com.minzheng.blog.controller.BlogInfoController.updateAbout', '修改关于我信息', '[{\"aboutContent\":\"#测试\"}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-30 20:16:08', NULL);
INSERT INTO `tb_operation_log` VALUES (1098, '博客信息模块', '修改', '/admin/about', 'com.minzheng.blog.controller.BlogInfoController.updateAbout', '修改关于我信息', '[{\"aboutContent\":\"# 测试\"}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-30 20:16:19', NULL);
INSERT INTO `tb_operation_log` VALUES (1099, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"![1.jpg](http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/articles/c7313dc52ddce8ed0b270e10216e7b68.jpg)\",\"articleCover\":\"http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/articles/9d07275d73d810d3458d0c12e0482eaa.jpg\",\"articleTitle\":\"2022-05-30\",\"categoryName\":\"后端\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":2}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-30 20:36:16', NULL);
INSERT INTO `tb_operation_log` VALUES (1100, '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"![1.jpg](http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/articles/c7313dc52ddce8ed0b270e10216e7b68.jpg)\",\"articleCover\":\"http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/articles/9d07275d73d810d3458d0c12e0482eaa.jpg\",\"articleTitle\":\"2022-05-30\",\"categoryName\":\"后端\",\"id\":56,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":2}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '管理员', '127.0.0.1', '', '2022-05-30 23:16:37', NULL);
INSERT INTO `tb_operation_log` VALUES (1101, '文章模块', '修改', '/admin/articles', 'com.xiaofei.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[56],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '小飞', '127.0.0.1', '', '2022-06-02 20:50:28', NULL);
INSERT INTO `tb_operation_log` VALUES (1102, '文章模块', '新增或修改', '/admin/articles', 'com.xiaofei.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"# [vue.config.js](https://cli.vuejs.org/zh/config/)\\n\\n## 设置`@`符号\\n\\n```javascript\\n\'use strict\'\\n\\nconst path = require(\'path\')\\nfunction resolve(dir) {\\n    return path.join(__dirname, dir)\\n}\\n\\nmodule.exports = {\\n    //设置@的作用\\n    configureWebpack: {\\n        resolve: {\\n            alias: {\\n                \'@\': resolve(\'src\')//在项目中使用@，会指定先src的目录下面\\n            }\\n        }\\n    },\\n}\\n\\n```\\n\\n\\n\\n## 设置代理\\n\\n> **将任何未知的请求代理到指定服务器**\\n\\n```javascript\\nmodule.exports = {\\n    devServer: {\\n        // 将所有未知的请求代理到下面指定的服务器上  \\n        proxy: \'http://localhost:4000\'\\n    }\\n}\\n```\\n\\n> **将不同路径代理到不同服务器中**\\n\\n```javascript\\nmodule.exports = {\\n    devServer: {\\n        proxy: {\\n            // 将api开头的路径的请求代理到url中  \\n            \'/api\': {\\n                target: \'<url>\',\\n                ws: true,\\n                changeOrigin: true\\n            },\\n            // 将foo开头的路径的请求代理到other_url中  \\n            \'/foo\': {\\n                target: \'<other_url>\'\\n            }\\n        }\\n    }\\n}\\n```\\n\\n\\n\\n## 关闭代码检查\\n\\n```javascript\\nmodule.exports = {\\n    lintOnSave: false,\\n}\\n```\\n\\n\\n\\n\\n\\n## vue配置文件模板\\n\\n```javascript\\n\'use strict\'\\n\\nconst path = require(\'path\')\\nfunction resolve(dir) {\\n    return path.join(__dirname, dir)\\n}\\n\\nmodule.exports = {\\n    //关闭代码检查\\n    lintOnSave: false,\\n    \\n    //设置代理\\n    devServer: {\\n        proxy: {\\n            //设置为0.0.0.0之后，同一局域网内可以直接访问项目\\n            host: \'0.0.0.0\',\\n            //端口号\\n            port: 80,\\n            //是否自动打开浏览器\\n            open: true,\\n            //将路径请求为api开头的请求代理到target指定的服务器中\\n            \'/api\':{\\n                target:\'http://localhost:8080\'\\n            }\\n        }\\n    },\\n    //设置@的作用\\n    configureWebpack: {\\n        resolve: {\\n            alias: {\\n                \'@\': resolve(\'src\')//在项目中使用@，会指定先src的目录下面\\n            }\\n        }\\n    },\\n}\\n```\\n\\n\\n\\n\\n\\n\\n\\n# [vuex](https://vuex.vuejs.org/zh/)\\n\\n## vuex原理图\\n\\nvuex的原理图，在组件调用store的`dispatch`方法后，执行了`actions`中的方法（action中可以调用Ajax请求），在actions中`commit`调用`mutations`后，在`mutation和actions`中都可以修改`store`中的方法\\n\\n![image-20220517145549307](E:\\\\note\\\\开发技巧\\\\vue开发技巧.assets\\\\image-20220517145549307.png)\\n\\n当在`actions`中不需要进行什么操作（直接将接收的值传入mutations中的时候）可以在组件中不需要调用`actions`，直接在组件中直接`commit调用mutations`，可以直接越过`actions`\\n\\n![image-20220517145909111](E:\\\\note\\\\开发技巧\\\\vue开发技巧.assets\\\\image-20220517145909111.png)\\n\\n## vuex的基本使用\\n\\n\\n\\n### 创建store\\n\\n- 在src下面创建一个文件夹`store`，创建一个文件`index.js`，写入以下内容\\n\\n  ```javascript\\n  //引入vue\\n  import Vue from \'vue\'\\n  //引入vuex\\n  import Vuex from \'vuex\'\\n  \\n  //在vue中使用vuex\\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      //用于响应组件中的动作\\n      actions: {},\\n      //用于操作数据（state）\\n      mutations: {},\\n      //用于存储数据\\n      state: {},\\n      //用于将state中的数据进行加工，比如state中sum+1\\n      getters: {},\\n      //用于存放vuex的各个模块，进行模块化管理时使用\\n      modules: {}\\n  })\\n  ```\\n\\n- 在src下面的`main.js`中引入上面创建的`store`文件\\n\\n  ```javascript\\n  //在main.js文件中引入store\\n  import store from \'./store\'\\n  new Vue({\\n      ........\\n      //在vue实例中引入store\\n    \\tstore,\\n  }).$mount(\'#app\')\\n  ```\\n\\n\\n\\n### vuex的基本使用\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {\\n          jia(context, value) {\\n              context.commit(\'JIA\', value)\\n          }\\n      },\\n      mutations: {\\n          JIA(state, value) {\\n              state.sum += value\\n          }\\n      },\\n      state: {\\n          sum: 0,\\n      },\\n      getters: {\\n          bigSum(state){\\n              return state.sum + 10\\n          }\\n      },\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中操作store。**使用`this.$store.dispatch(actions中的方法或mutations中的方法，传入的值)`**\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div @click=\\\"storeJia\\\">操作store</div>\\n          <!-- 获取state中的数据 -->\\n          <div style=\\\"font-size: 20px;\\\">{{$store.state.sum}}</div>\\n          <!-- 获取getters中的数据 -->\\n          <div style=\\\"font-size: 20px;\\\">{{$store.getters.bigSum}}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  export default {\\n      methods: {\\n          storeJia() {\\n              this.$store.dispatch(\'jia\', 2)\\n          }\\n      },\\n  }\\n  </script>\\n  \\n  ```\\n\\n- 在组件中访问`store / getters`\\n\\n  - 在`template`中使用插值语法`{{}}`访问：\\n    - 访问store：`{{$store.state.state中的变量}}`\\n    - 访问getters：`{{$store.getters.getters中的变量}}`\\n\\n\\n\\n### vuex的进阶使用—mapState\\n\\n在vue组件中使用store中的数据时，总是要使用`$store.state.state中的变量`访问变量，所以vuex提供了`mapState`结合vue提供的`computen计算属性`一起使用能够快捷的访问state中的属性\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用state中的数据\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {},\\n      mutations: {},\\n      state: {\\n          sum: 0,\\n          username: \'张三\'\\n      },\\n      getters: {},\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中使用`mapState`：在计算属性`computed`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapState({sum:\'state中的变量\',username:\'state中的变量\'})`\\n  - 使用方式而：`...mapState([state中的变量1 , state中的变量2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px;\\\">{{ username1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ username }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  // 引入vuex中的mapState\\n  import {mapState} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          //使用对象接收store中的数据，可以重新赋变量名，可以和store中的数据一致\\n          ...mapState({sum1: \'sum\', username1: \'username\'}),\\n          //使用数组接收store中的数据，变量名为store中的变量名\\n          ...mapState([\'sum\', \'username\']),\\n      },\\n  }\\n  </script>\\n  ```\\n\\n  \\n\\n### vuex的进阶使用—mapGetters\\n\\n在vue组件中使用getters中的数据时，总是要使用`$store.getters.getters中的变量`访问变量，所以vuex提供了`mapGerrers`结合vue提供的`computen计算属性`一起使用能够快捷的访问getters中的属性\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用getters中的数据\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {},\\n      mutations: {},\\n      state: {\\n          sum: 0,\\n          username: \'张三\'\\n      },\\n      getters: {\\n          bigSum(state) {\\n              return state.sum + 10\\n          },\\n          newUsername(state){\\n              return state.username+\\\"是好人\\\"\\n          }\\n      },\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中使用`mapGetters`：在计算属性`computed`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapGetters({sum:\'getters中的变量\',username:\'getters中的变量\'})`\\n  - 使用方式而：`...mapGetters([getters中的变量1 , getters中的变量2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px;\\\">{{ bigSum1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ newUsername1 }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ bigSum }}</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ newUsername }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  //从vuex中引入mapGetters\\n  import {mapGetters} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          ...mapGetters({bigSum1: \'bigSum\', newUsername1: \'newUsername\'}),\\n          ...mapGetters([\'bigSum\', \'newUsername\']),\\n      },\\n  }\\n  </script>\\n  ```\\n\\n\\n\\n\\n\\n### vuex的进阶使用—mapActions\\n\\n在vue组件中使用actions中的方法时，总是要使用`this.$store.dispatch(\'actions中的方法\', 需要传入的值)`访问actions中的方法，所以vuex提供了`mapActions`结合vue提供的`methods`一起使用能够快捷的访问actions中的方法\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用actions中的方法\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {\\n          jia(context, value) {\\n              context.commit(\'JIA\', value)\\n          },\\n          jian(context, value) {\\n              context.commit(\'JIAN\', value)\\n          }\\n      },\\n      mutations: {\\n          JIA(state, value) {\\n              state.sum += value\\n          },\\n          JIAN(state, value) {\\n              state.sum -= value\\n          }\\n      },\\n      state: {\\n          sum: 0,\\n      },\\n      getters: {},\\n      modules: {}\\n  })\\n  ```\\n\\n- 在组件中使用`mapActions`：在`methods`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapActions({jia1:\'actios中的方法\',jian1:\'actions中的方法\'})`\\n  - 使用方式而：`...mapActions([actions中的方法1 , actions中的方法2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jia(1)\\\">jia</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jian(1)\\\">jian</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jia1(1)\\\">jia1</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"jian1(1)\\\">jian1</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  import {mapState, mapActions} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          ...mapState([\'sum\']),\\n      },\\n      methods: {\\n          ...mapActions({jia1: \'jia\', jian1: \'jian\'}),\\n          ...mapActions([\'jia\', \'jian\']),\\n      },\\n  }\\n  </script>\\n  ```\\n\\n  \\n\\n### vuex的进阶使用—mapMutations\\n在vue组件中使用actions中的方法时，总是要使用`this.$store.dispatch(\'mutations中的方法\', 需要传入的值)`访问mutations中的方法，所以vuex提供了`mapMutations`结合vue提供的`methods`一起使用能够快捷的访问mutations中的方法\\n\\n- 创建vuex和在main.js中引入（上面创建store中有具体步骤）。这里只使用mutations中的方法\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      actions: {},\\n      mutations: {\\n          JIA(state, value) {\\n              state.sum += value\\n          },\\n          JIAN(state, value) {\\n              state.sum -= value\\n          }\\n      },\\n      state: {\\n          sum: 0,\\n      },\\n      getters: {},\\n      modules: {}\\n  })\\n  ```\\n  \\n- 在组件中使用`mapMutations`：在`methods`中使用\\n\\n  - 使用对象的方式一个一个引入  /  使用数组的方式直接引入\\n  - 使用方式一：`...mapMutations({JIA1:\'mutations中的方法\',JIAN1:\'mutations中的方法\'})`\\n  - 使用方式而：`...mapMutations([mutations中的方法1 , mutations中的方法2 , ......])`\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIA1(1)\\\">JIA1</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIAN1(1)\\\">JIAN1</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIA(1)\\\">JIA</div>\\n          <div style=\\\"font-size: 20px\\\" @click=\\\"JIAN(1)\\\">JIAN</div>\\n          <div style=\\\"font-size: 20px;\\\">{{ sum }}</div>\\n      </div>\\n  </template>\\n  \\n  <script>\\n  import {mapState ,mapMutations} from \'vuex\'\\n  \\n  export default {\\n      computed: {\\n          ...mapState([\'sum\']),\\n      },\\n      methods: {\\n          ...mapMutations({JIA1: \'JIA\', JIAN1: \'JIAN\'}),\\n          ...mapMutations([\'JIA\', \'JIAN\']),\\n      },\\n  }\\n  </script>\\n  \\n  ```\\n  \\n  \\n\\n## vuex模块化+命名空间\\n\\n模块化可以将多个store整合到一个store中，需要在每个store中需要将`namespaced: true`\\n\\n### 创建store\\n\\n- 创建子模块 person，里面用于放入一些用户的基本信息\\n\\n  ```javascript\\n  export default {\\n      namespaced: true,\\n      //用于响应组件中的动作\\n      actions: {\\n          append(context, value) {\\n              context.commit(\\\"APPEND\\\", value)\\n          }\\n      },\\n      //用于操作数据（state）\\n      mutations: {\\n          APPEND(state, value) {\\n              state.username += value\\n          }\\n      },\\n      //用于存储数据\\n      state: {\\n          username: \\\"张三\\\"\\n      },\\n      //用于将state中的数据进行加工，比如state中sum+1\\n      getters: {\\n          newUsername(state){\\n              return state.username+\\\"是个好人\\\"\\n          }\\n      },\\n      //用于存放vuex的各个模块，进行模块化管理时使用\\n      modules: {}\\n  }\\n  ```\\n\\n- 创建sum，里面用于放一些运算操作\\n\\n  ```javascript\\n  export default {\\n      namespaced: true,\\n      //用于响应组件中的动作\\n      actions: {\\n          sum(context, value) {\\n              context.commit(\'SUM\', value)\\n          }\\n      },\\n      //用于操作数据（state）\\n      mutations: {\\n          SUM(state, value) {\\n              state.sumValue += value\\n          }\\n      },\\n      //用于存储数据\\n      state: {\\n          sumValue: 20\\n      },\\n      //用于将state中的数据进行加工，比如state中sum+1\\n      getters: {\\n          bigSumValue(state) {\\n              return state.sumValue + 20\\n          }\\n      },\\n      //用于存放vuex的各个模块，进行模块化管理时使用\\n      modules: {}\\n  }\\n  ```\\n\\n- 创建index，用于整合所有模块\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import Vuex from \'vuex\'\\n  \\n  //引入一个一个的store\\n  import sum from \'./sum\'\\n  import person from \'./person\'\\n  \\n  Vue.use(Vuex)\\n  \\n  export default new Vuex.Store({\\n      modules: {\\n          sum: sum, \\n          person: person\\n      }\\n  })\\n  ```\\n\\n\\n\\n### 在vue中使用模块化中的store数据\\n\\n```vue\\n<template>\\n    <div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"append(\'测试\')\\\">append</div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"APPEND(\'测试2\')\\\">APPEND</div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"sum(20)\\\">sum</div>\\n        <div style=\\\"font-size: 20px\\\" @click=\\\"SUM(10)\\\">SUM</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ username }}</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ newUsername }}</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ sumValue }}</div>\\n        <div style=\\\"font-size: 20px;\\\">{{ bigSumValue }}</div>\\n    </div>\\n</template>\\n\\n<script>\\nimport {mapState, mapGetters, mapActions, mapMutations} from \'vuex\'\\n\\nexport default {\\n    computed: {\\n        //使用vuex提供的mapXxx方法\\n        ...mapState(\'person\', [\'username\']),\\n        ...mapGetters(\'person\', [\'newUsername\']),\\n\\n        //从$store方法中获取\\n        bigSumValue() {\\n            return this.$store.getters[\'sum/bigSumValue\']\\n        },\\n        sumValue() {\\n            return this.$store.state.sum.sumValue\\n        }\\n    },\\n    methods: {\\n        //使用mapXxx\\n        ...mapActions(\'person\', [\'append\']),\\n        ...mapMutations(\'person\', [\'APPEND\']),\\n\\n        //使用$store获取\\n        sum() {\\n            this.$store.dispatch(\'sum/sum\', 20)\\n        },\\n        SUM() {\\n            this.$store.commit(\'sum/SUM\', 10)\\n        }\\n    },\\n}\\n</script>\\n```\\n\\n\\n\\n\\n\\n## [vuex持久化](https://blog.csdn.net/weixin_52283244/article/details/119058888)\\n\\n[博客2：](https://juejin.cn/post/6918684399659646989)https://juejin.cn/post/6918684399659646989\\n\\n# [vue-router](https://router.vuejs.org/zh/)\\n\\n## vue-router参数详解\\n\\n\\n\\n\\n\\n## router-link标签参数详解\\n\\n\\n\\n## 一级路由\\n\\n```javascript\\nimport Vue from \'vue\'\\nimport VueRouter from \'vue-router\'\\n\\n//引入组件\\nimport Home from \'../components/Home\'\\n\\nVue.use(VueRouter)\\n\\n/*\\nname：可以用于\\n\\n*/\\n\\n//创建路由\\nconst routes = [\\n    //创建路由方式一：使用import函数，直接找到组件，不用在开头引入组件，推荐使用\\n    {path: \'/\', name: \'Index\', component: () => import(\'@/views/index\')},\\n    //创建路由方式二：需要在开头先使用import引入组件，再到下面定义路由\\n    {path:\'/home\', name: \'home\', component:Home},\\n\\n]\\n\\nconst router = new VueRouter({\\n    mode: \'history\',\\n    base: process.env.BASE_URL,\\n    routes\\n})\\n\\nexport default router\\n\\n```\\n\\n\\n\\n## 多级路由\\n\\n```javascript\\nimport Vue from \'vue\'\\nimport VueRouter from \'vue-router\'\\n\\nVue.use(VueRouter)\\n\\nconst routes = [\\n    //多级路由方式创建一：只需要添加children的值，值为创建一个新的路由，children的值是一个数组\\n    //二级路由访问路径为：一级路由地址/二级路由地址\\n    {\\n        path: \'/image4\',\\n        name: \'Image4\',\\n        component: () => import(\'@/views/图片展示/图片4\'),\\n        children: [\\n            //一个一个嵌套即可\\n            {\\n                path: \'/image1\', \\n                name: \'Image1\', \\n                component: () => import(\'@/views/图片展示/图片1\')\\n            }\\n        ]\\n    },\\n\\n]\\n\\nconst router = new VueRouter({\\n    mode: \'history\',\\n    base: process.env.BASE_URL,\\n    routes\\n})\\n\\nexport default router\\n\\n```\\n\\n\\n\\n## 路由query参数—router-link\\n\\n```vue\\n<template>\\n    <div id=\\\"app\\\">\\n        <router-view/>\\n        <!-- 跳转路由并携带query参数，to的字符串写法 -->\\n        <router-link :to=\\\"`/home?id=${1}&title=${\'测试\'}`\\\">测试</router-link>\\n        <!-- 跳转路由并携带query参数，to的对象写法 -->\\n        <router-link :to=\\\"{path:\'/home\',query:{id:1,title:\'测试\'}}\\\">路由测试</router-link>\\n    </div>\\n</template>\\n```\\n\\n\\n\\n## 命名路由\\n\\n利用路由的`name`的值访问路由\\n\\n- 定义一个路由\\n\\n  ```javascript\\n  import Vue from \'vue\'\\n  import VueRouter from \'vue-router\'\\n  \\n  Vue.use(VueRouter)\\n  \\n  const routes = [\\n      {path: \'/image4\', name: \'Image4\', component: () => import(\'@/views/index\')},\\n  ]\\n  \\n  const router = new VueRouter({\\n      mode: \'history\',\\n      base: process.env.BASE_URL,\\n      routes\\n  })\\n  \\n  export default router\\n  ```\\n\\n- 利用路由的`path和name`属性访问组件\\n\\n  ```vue\\n  <template>\\n      <div>\\n          <!-- 使用name属性访问 -->\\n          <router-link :to=\\\"{name:\'Image4\'}\\\">测试</router-link><br/>\\n          <!-- 使用path属性访问 -->\\n          <router-link :to=\\\"{path:\'image4\'}\\\">测试</router-link><br/>\\n          <!-- 直接写路径，可以默认为path的值 -->\\n          <router-link to=\\\"/image4\\\">测试</router-link><br/>\\n      </div>\\n  </template>\\n  ```\\n\\n\\n\\n\\n\\n\\n# [css解决文本溢出](https://www.php.cn/css-tutorial-409501.html)\\n\\n```css\\n*{\\n    overflow: hidden;\\n\\t\\t\\t\\ttext-overflow: ellipsis;\\n\\t\\t\\t\\tdisplay: -webkit-box;\\n    \\t\\t\\t//设置几行开始使用省略号\\n\\t\\t\\t\\t-webkit-line-clamp: 3;\\n\\t\\t\\t\\t-webkit-box-orient: vertical;\\n}\\n```\\n\\n\\n\\n\\n\\n\\n\\n# 格式化配置文件\\n\\n> **命名为`.editorconfig`文件**\\n\\n```\\n# 告诉EditorConfig插件，这是根文件，不用继续往上查找\\nroot = true\\n\\n# 匹配全部文件\\n[*]\\n# 结尾换行符，可选\\\"lf\\\"、\\\"cr\\\"、\\\"crlf\\\"\\nend_of_line = lf\\n# 在文件结尾插入新行\\ninsert_final_newline = true\\n# 删除一行中的前后空格\\ntrim_trailing_whitespace = true\\n# 匹配js和py结尾的文件\\n[*.{js,py,vue, html, css}]\\n# 设置字符集\\ncharset = utf-8\\n\\n# 匹配py结尾的文件\\n[*.{js, py, vue, html}]\\n# 缩进风格，可选\\\"space\\\"、\\\"tab\\\"\\nindent_style = space\\n# 缩进的空格数\\nindent_size = 4\\n\\n# 以下匹配，类同\\n[Makefile]\\nindent_style = tab\\n# tab的宽度\\ntab_width = 4\\n\\n# 以下匹配，类同\\n[lib/**.js]\\nindent_style = space\\nindent_size = 2\\n\\n[{package.json, .travis.yml}]\\nindent_style = space\\nindent_size = 2\\n\\n```\\n\\n\\n\\n\\n\\n\\n\\n# CSS重置样式表和基础样式\\n\\n## reset.css\\n\\n```css\\n/* http://meyerweb.com/eric/tools/css/reset/ \\n   v2.0 | 20110126\\n   License: none (public domain)\\n*/\\n\\nhtml, body, div, span, applet, object, iframe,\\nh1, h2, h3, h4, h5, h6, p, blockquote, pre,\\na, abbr, acronym, address, big, cite, code,\\ndel, dfn, em, img, ins, kbd, q, s, samp,\\nsmall, strike, strong, sub, sup, tt, var,\\nb, u, i, center,\\ndl, dt, dd, ol, ul, li,\\nfieldset, form, label, legend,\\ntable, caption, tbody, tfoot, thead, tr, th, td,\\narticle, aside, canvas, details, embed, \\nfigure, figcaption, footer, header, hgroup, \\nmenu, nav, output, ruby, section, summary,\\ntime, mark, audio, video {\\n\\tmargin: 0;\\n\\tpadding: 0;\\n\\tborder: 0;\\n\\tfont-size: 100%;\\n\\tfont: inherit;\\n\\tvertical-align: baseline;\\n}\\n/* HTML5 display-role reset for older browsers */\\narticle, aside, details, figcaption, figure, \\nfooter, header, hgroup, menu, nav, section {\\n\\tdisplay: block;\\n}\\nbody {\\n\\tline-height: 1;\\n}\\nol, ul {\\n\\tlist-style: none;\\n}\\nblockquote, q {\\n\\tquotes: none;\\n}\\nblockquote:before, blockquote:after,\\nq:before, q:after {\\n\\tcontent: \'\';\\n\\tcontent: none;\\n}\\ntable {\\n\\tborder-collapse: collapse;\\n\\tborder-spacing: 0;\\n}\\n```\\n\\n\\n\\n\\n\\n## normalize.css\\n\\n```css\\n/*! normalize.css v8.0.1 | MIT License | github.com/necolas/normalize.css */\\n\\n/* Document\\n   ========================================================================== */\\n\\n/**\\n * 1. Correct the line height in all browsers.\\n * 2. Prevent adjustments of font size after orientation changes in iOS.\\n */\\n\\nhtml {\\n  line-height: 1.15; /* 1 */\\n  -webkit-text-size-adjust: 100%; /* 2 */\\n}\\n\\n/* Sections\\n   ========================================================================== */\\n\\n/**\\n * Remove the margin in all browsers.\\n */\\n\\nbody {\\n  margin: 0;\\n}\\n\\n/**\\n * Render the `main` element consistently in IE.\\n */\\n\\nmain {\\n  display: block;\\n}\\n\\n/**\\n * Correct the font size and margin on `h1` elements within `section` and\\n * `article` contexts in Chrome, Firefox, and Safari.\\n */\\n\\nh1 {\\n  font-size: 2em;\\n  margin: 0.67em 0;\\n}\\n\\n/* Grouping content\\n   ========================================================================== */\\n\\n/**\\n * 1. Add the correct box sizing in Firefox.\\n * 2. Show the overflow in Edge and IE.\\n */\\n\\nhr {\\n  box-sizing: content-box; /* 1 */\\n  height: 0; /* 1 */\\n  overflow: visible; /* 2 */\\n}\\n\\n/**\\n * 1. Correct the inheritance and scaling of font size in all browsers.\\n * 2. Correct the odd `em` font sizing in all browsers.\\n */\\n\\npre {\\n  font-family: monospace, monospace; /* 1 */\\n  font-size: 1em; /* 2 */\\n}\\n\\n/* Text-level semantics\\n   ========================================================================== */\\n\\n/**\\n * Remove the gray background on active links in IE 10.\\n */\\n\\na {\\n  background-color: transparent;\\n}\\n\\n/**\\n * 1. Remove the bottom border in Chrome 57-\\n * 2. Add the correct text decoration in Chrome, Edge, IE, Opera, and Safari.\\n */\\n\\nabbr[title] {\\n  border-bottom: none; /* 1 */\\n  text-decoration: underline; /* 2 */\\n  text-decoration: underline dotted; /* 2 */\\n}\\n\\n/**\\n * Add the correct font weight in Chrome, Edge, and Safari.\\n */\\n\\nb,\\nstrong {\\n  font-weight: bolder;\\n}\\n\\n/**\\n * 1. Correct the inheritance and scaling of font size in all browsers.\\n * 2. Correct the odd `em` font sizing in all browsers.\\n */\\n\\ncode,\\nkbd,\\nsamp {\\n  font-family: monospace, monospace; /* 1 */\\n  font-size: 1em; /* 2 */\\n}\\n\\n/**\\n * Add the correct font size in all browsers.\\n */\\n\\nsmall {\\n  font-size: 80%;\\n}\\n\\n/**\\n * Prevent `sub` and `sup` elements from affecting the line height in\\n * all browsers.\\n */\\n\\nsub,\\nsup {\\n  font-size: 75%;\\n  line-height: 0;\\n  position: relative;\\n  vertical-align: baseline;\\n}\\n\\nsub {\\n  bottom: -0.25em;\\n}\\n\\nsup {\\n  top: -0.5em;\\n}\\n\\n/* Embedded content\\n   ========================================================================== */\\n\\n/**\\n * Remove the border on images inside links in IE 10.\\n */\\n\\nimg {\\n  border-style: none;\\n}\\n\\n/* Forms\\n   ========================================================================== */\\n\\n/**\\n * 1. Change the font styles in all browsers.\\n * 2. Remove the margin in Firefox and Safari.\\n */\\n\\nbutton,\\ninput,\\noptgroup,\\nselect,\\ntextarea {\\n  font-family: inherit; /* 1 */\\n  font-size: 100%; /* 1 */\\n  line-height: 1.15; /* 1 */\\n  margin: 0; /* 2 */\\n}\\n\\n/**\\n * Show the overflow in IE.\\n * 1. Show the overflow in Edge.\\n */\\n\\nbutton,\\ninput { /* 1 */\\n  overflow: visible;\\n}\\n\\n/**\\n * Remove the inheritance of text transform in Edge, Firefox, and IE.\\n * 1. Remove the inheritance of text transform in Firefox.\\n */\\n\\nbutton,\\nselect { /* 1 */\\n  text-transform: none;\\n}\\n\\n/**\\n * Correct the inability to style clickable types in iOS and Safari.\\n */\\n\\nbutton,\\n[type=\\\"button\\\"],\\n[type=\\\"reset\\\"],\\n[type=\\\"submit\\\"] {\\n  -webkit-appearance: button;\\n}\\n\\n/**\\n * Remove the inner border and padding in Firefox.\\n */\\n\\nbutton::-moz-focus-inner,\\n[type=\\\"button\\\"]::-moz-focus-inner,\\n[type=\\\"reset\\\"]::-moz-focus-inner,\\n[type=\\\"submit\\\"]::-moz-focus-inner {\\n  border-style: none;\\n  padding: 0;\\n}\\n\\n/**\\n * Restore the focus styles unset by the previous rule.\\n */\\n\\nbutton:-moz-focusring,\\n[type=\\\"button\\\"]:-moz-focusring,\\n[type=\\\"reset\\\"]:-moz-focusring,\\n[type=\\\"submit\\\"]:-moz-focusring {\\n  outline: 1px dotted ButtonText;\\n}\\n\\n/**\\n * Correct the padding in Firefox.\\n */\\n\\nfieldset {\\n  padding: 0.35em 0.75em 0.625em;\\n}\\n\\n/**\\n * 1. Correct the text wrapping in Edge and IE.\\n * 2. Correct the color inheritance from `fieldset` elements in IE.\\n * 3. Remove the padding so developers are not caught out when they zero out\\n *    `fieldset` elements in all browsers.\\n */\\n\\nlegend {\\n  box-sizing: border-box; /* 1 */\\n  color: inherit; /* 2 */\\n  display: table; /* 1 */\\n  max-width: 100%; /* 1 */\\n  padding: 0; /* 3 */\\n  white-space: normal; /* 1 */\\n}\\n\\n/**\\n * Add the correct vertical alignment in Chrome, Firefox, and Opera.\\n */\\n\\nprogress {\\n  vertical-align: baseline;\\n}\\n\\n/**\\n * Remove the default vertical scrollbar in IE 10+.\\n */\\n\\ntextarea {\\n  overflow: auto;\\n}\\n\\n/**\\n * 1. Add the correct box sizing in IE 10.\\n * 2. Remove the padding in IE 10.\\n */\\n\\n[type=\\\"checkbox\\\"],\\n[type=\\\"radio\\\"] {\\n  box-sizing: border-box; /* 1 */\\n  padding: 0; /* 2 */\\n}\\n\\n/**\\n * Correct the cursor style of increment and decrement buttons in Chrome.\\n */\\n\\n[type=\\\"number\\\"]::-webkit-inner-spin-button,\\n[type=\\\"number\\\"]::-webkit-outer-spin-button {\\n  height: auto;\\n}\\n\\n/**\\n * 1. Correct the odd appearance in Chrome and Safari.\\n * 2. Correct the outline style in Safari.\\n */\\n\\n[type=\\\"search\\\"] {\\n  -webkit-appearance: textfield; /* 1 */\\n  outline-offset: -2px; /* 2 */\\n}\\n\\n/**\\n * Remove the inner padding in Chrome and Safari on macOS.\\n */\\n\\n[type=\\\"search\\\"]::-webkit-search-decoration {\\n  -webkit-appearance: none;\\n}\\n\\n/**\\n * 1. Correct the inability to style clickable types in iOS and Safari.\\n * 2. Change font properties to `inherit` in Safari.\\n */\\n\\n::-webkit-file-upload-button {\\n  -webkit-appearance: button; /* 1 */\\n  font: inherit; /* 2 */\\n}\\n\\n/* Interactive\\n   ========================================================================== */\\n\\n/*\\n * Add the correct display in Edge, IE 10+, and Firefox.\\n */\\n\\ndetails {\\n  display: block;\\n}\\n\\n/*\\n * Add the correct display in all browsers.\\n */\\n\\nsummary {\\n  display: list-item;\\n}\\n\\n/* Misc\\n   ========================================================================== */\\n\\n/**\\n * Add the correct display in IE 10+.\\n */\\n\\ntemplate {\\n  display: none;\\n}\\n\\n/**\\n * Add the correct display in IE 10.\\n */\\n\\n[hidden] {\\n  display: none;\\n}\\n```\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"https://static.talkxj.com/articles/3dffb2fcbd541886616ab54c92570de3.jpg\",\"articleTitle\":\"vue开发技巧\",\"categoryName\":\"前端\",\"id\":55,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '小飞', '127.0.0.1', '', '2022-06-02 20:50:31', NULL);
INSERT INTO `tb_operation_log` VALUES (1103, '文章模块', '修改', '/admin/articles', 'com.xiaofei.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[55],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '小飞', '127.0.0.1', '', '2022-06-02 20:50:33', NULL);
INSERT INTO `tb_operation_log` VALUES (1104, '文章模块', '新增或修改', '/admin/articles', 'com.xiaofei.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"恭喜你成功运行博客，开启你的文章之旅吧。\",\"articleCover\":\"https://static.talkxj.com/articles/3dffb2fcbd541886616ab54c92570de3.jpg\",\"articleTitle\":\"测试文章\",\"categoryName\":\"测试分类\",\"id\":54,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '小飞', '127.0.0.1', '', '2022-06-02 20:50:46', NULL);
INSERT INTO `tb_operation_log` VALUES (1105, '文章模块', '修改', '/admin/articles', 'com.xiaofei.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[54],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', 1, '小飞', '127.0.0.1', '', '2022-06-02 20:50:49', NULL);

-- ----------------------------
-- Table structure for tb_page
-- ----------------------------
DROP TABLE IF EXISTS `tb_page`;
CREATE TABLE `tb_page`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `page_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面名',
  `page_label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面标签',
  `page_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面封面',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 904 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '页面' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_page
-- ----------------------------
INSERT INTO `tb_page` VALUES (1, '首页', 'home', 'https://static.talkxj.com/config/0bee7ba5ac70155766648e14ae2a821f.jpg', '2021-08-07 10:32:36', '2021-12-27 12:19:01');
INSERT INTO `tb_page` VALUES (2, '归档', 'archive', 'https://static.talkxj.com/config/643f28683e1c59a80ccfc9cb19735a9c.jpg', '2021-08-07 10:32:36', '2021-10-04 15:43:14');
INSERT INTO `tb_page` VALUES (3, '分类', 'category', 'https://static.talkxj.com/config/83be0017d7f1a29441e33083e7706936.jpg', '2021-08-07 10:32:36', '2021-10-04 15:43:31');
INSERT INTO `tb_page` VALUES (4, '标签', 'tag', 'https://static.talkxj.com/config/a6f141372509365891081d755da963a1.png', '2021-08-07 10:32:36', '2021-10-04 15:43:38');
INSERT INTO `tb_page` VALUES (5, '相册', 'album', 'https://static.talkxj.com/config/1ecb6fc94e38c38713000efe37492e73.png', '2021-08-07 10:32:36', '2021-12-27 12:23:12');
INSERT INTO `tb_page` VALUES (6, '友链', 'link', 'https://static.talkxj.com/config/9034edddec5b8e8542c2e61b0da1c1da.jpg', '2021-08-07 10:32:36', '2021-10-04 15:44:02');
INSERT INTO `tb_page` VALUES (7, '关于', 'about', 'https://static.talkxj.com/config/2a56d15dd742ff8ac238a512d9a472a1.jpg', '2021-08-07 10:32:36', '2021-10-04 15:44:08');
INSERT INTO `tb_page` VALUES (8, '留言', 'message', 'https://static.talkxj.com/config/acfeab8379508233fa7e4febf90c2f2e.png', '2021-08-07 10:32:36', '2021-10-04 16:11:45');
INSERT INTO `tb_page` VALUES (9, '个人中心', 'user', 'https://static.talkxj.com/config/ebae4c93de1b286a8d50aa62612caa59.jpeg', '2021-08-07 10:32:36', '2021-10-04 15:45:17');
INSERT INTO `tb_page` VALUES (10, '文章列表', 'articleList', 'https://static.talkxj.com/config/924d65cc8312e6cdad2160eb8fce6831.jpg', '2021-08-10 15:36:19', '2021-10-04 15:45:45');
INSERT INTO `tb_page` VALUES (904, '说说', 'talk', 'http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/config/9d07275d73d810d3458d0c12e0482eaa.jpg', '2022-01-23 00:51:24', '2022-05-30 19:47:35');

-- ----------------------------
-- Table structure for tb_photo
-- ----------------------------
DROP TABLE IF EXISTS `tb_photo`;
CREATE TABLE `tb_photo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_id` int NOT NULL COMMENT '相册id',
  `photo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片名',
  `photo_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片描述',
  `photo_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片地址',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '照片' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_photo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_photo_album
-- ----------------------------
DROP TABLE IF EXISTS `tb_photo_album`;
CREATE TABLE `tb_photo_album`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册名',
  `album_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册描述',
  `album_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册封面',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值 1公开 2私密',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '相册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_photo_album
-- ----------------------------

-- ----------------------------
-- Table structure for tb_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限路径',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `parent_id` int NULL DEFAULT NULL COMMENT '父权限id',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否匿名访问 0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 288 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES (165, '分类模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (166, '博客信息模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (167, '友链模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (168, '文章模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (169, '日志模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (170, '标签模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (171, '照片模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (172, '用户信息模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (173, '用户账号模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (174, '留言模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (175, '相册模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (176, '菜单模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (177, '角色模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (178, '评论模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (179, '资源模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (180, '页面模块', NULL, NULL, NULL, 0, '2021-08-11 21:04:21', NULL);
INSERT INTO `tb_resource` VALUES (181, '查看博客信息', '/', 'GET', 166, 1, '2021-08-11 21:04:22', '2021-08-11 21:05:29');
INSERT INTO `tb_resource` VALUES (182, '查看关于我信息', '/about', 'GET', 166, 1, '2021-08-11 21:04:22', '2021-08-11 21:05:29');
INSERT INTO `tb_resource` VALUES (183, '查看后台信息', '/admin', 'GET', 166, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (184, '修改关于我信息', '/admin/about', 'PUT', 166, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (185, '查看后台文章', '/admin/articles', 'GET', 168, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (186, '添加或修改文章', '/admin/articles', 'POST', 168, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (187, '恢复或删除文章', '/admin/articles', 'PUT', 168, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (188, '物理删除文章', '/admin/articles', 'DELETE', 168, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (189, '上传文章图片', '/admin/articles/images', 'POST', 168, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (190, '修改文章置顶', '/admin/articles/top', 'PUT', 168, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (191, '根据id查看后台文章', '/admin/articles/*', 'GET', 168, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (192, '查看后台分类列表', '/admin/categories', 'GET', 165, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (193, '添加或修改分类', '/admin/categories', 'POST', 165, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (194, '删除分类', '/admin/categories', 'DELETE', 165, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (195, '搜索文章分类', '/admin/categories/search', 'GET', 165, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (196, '查询后台评论', '/admin/comments', 'GET', 178, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (197, '删除评论', '/admin/comments', 'DELETE', 178, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (198, '审核评论', '/admin/comments/review', 'PUT', 178, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (199, '查看后台友链列表', '/admin/links', 'GET', 167, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (200, '保存或修改友链', '/admin/links', 'POST', 167, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (201, '删除友链', '/admin/links', 'DELETE', 167, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (202, '查看菜单列表', '/admin/menus', 'GET', 176, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (203, '新增或修改菜单', '/admin/menus', 'POST', 176, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (204, '删除菜单', '/admin/menus/*', 'DELETE', 176, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (205, '查看后台留言列表', '/admin/messages', 'GET', 174, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (206, '删除留言', '/admin/messages', 'DELETE', 174, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (207, '审核留言', '/admin/messages/review', 'PUT', 174, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (208, '查看操作日志', '/admin/operation/logs', 'GET', 169, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (209, '删除操作日志', '/admin/operation/logs', 'DELETE', 169, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (210, '获取页面列表', '/admin/pages', 'GET', 180, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (211, '保存或更新页面', '/admin/pages', 'POST', 180, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (212, '删除页面', '/admin/pages/*', 'DELETE', 180, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (213, '根据相册id获取照片列表', '/admin/photos', 'GET', 171, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (214, '保存照片', '/admin/photos', 'POST', 171, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (215, '更新照片信息', '/admin/photos', 'PUT', 171, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (216, '删除照片', '/admin/photos', 'DELETE', 171, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (217, '移动照片相册', '/admin/photos/album', 'PUT', 171, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (218, '查看后台相册列表', '/admin/photos/albums', 'GET', 175, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (219, '保存或更新相册', '/admin/photos/albums', 'POST', 175, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (220, '上传相册封面', '/admin/photos/albums/cover', 'POST', 175, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (221, '获取后台相册列表信息', '/admin/photos/albums/info', 'GET', 175, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (222, '根据id删除相册', '/admin/photos/albums/*', 'DELETE', 175, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (223, '根据id获取后台相册信息', '/admin/photos/albums/*/info', 'GET', 175, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (224, '更新照片删除状态', '/admin/photos/delete', 'PUT', 171, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (225, '查看资源列表', '/admin/resources', 'GET', 179, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (226, '新增或修改资源', '/admin/resources', 'POST', 179, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (227, '导入swagger接口', '/admin/resources/import/swagger', 'GET', 179, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (228, '删除资源', '/admin/resources/*', 'DELETE', 179, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (229, '保存或更新角色', '/admin/role', 'POST', 177, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (230, '查看角色菜单选项', '/admin/role/menus', 'GET', 176, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (231, '查看角色资源选项', '/admin/role/resources', 'GET', 179, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (232, '查询角色列表', '/admin/roles', 'GET', 177, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (233, '删除角色', '/admin/roles', 'DELETE', 177, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (234, '查询后台标签列表', '/admin/tags', 'GET', 170, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (235, '添加或修改标签', '/admin/tags', 'POST', 170, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (236, '删除标签', '/admin/tags', 'DELETE', 170, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (237, '搜索文章标签', '/admin/tags/search', 'GET', 170, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (238, '查看当前用户菜单', '/admin/user/menus', 'GET', 176, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (239, '查询后台用户列表', '/admin/users', 'GET', 173, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (240, '修改用户禁用状态', '/admin/users/disable', 'PUT', 172, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (241, '查看在线用户', '/admin/users/online', 'GET', 172, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (242, '修改管理员密码', '/admin/users/password', 'PUT', 173, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (243, '查询用户角色选项', '/admin/users/role', 'GET', 177, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (244, '修改用户角色', '/admin/users/role', 'PUT', 172, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (245, '下线用户', '/admin/users/*/online', 'DELETE', 172, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (246, '获取网站配置', '/admin/website/config', 'GET', 166, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (247, '更新网站配置', '/admin/website/config', 'PUT', 166, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (248, '根据相册id查看照片列表', '/albums/*/photos', 'GET', 171, 1, '2021-08-11 21:04:22', '2021-08-11 21:06:35');
INSERT INTO `tb_resource` VALUES (249, '查看首页文章', '/articles', 'GET', 168, 1, '2021-08-11 21:04:22', '2021-08-11 21:05:45');
INSERT INTO `tb_resource` VALUES (250, '查看文章归档', '/articles/archives', 'GET', 168, 1, '2021-08-11 21:04:22', '2021-08-11 21:05:47');
INSERT INTO `tb_resource` VALUES (251, '根据条件查询文章', '/articles/condition', 'GET', 168, 1, '2021-08-11 21:04:22', '2021-08-11 21:05:47');
INSERT INTO `tb_resource` VALUES (252, '搜索文章', '/articles/search', 'GET', 168, 1, '2021-08-11 21:04:22', '2021-08-11 21:05:48');
INSERT INTO `tb_resource` VALUES (253, '根据id查看文章', '/articles/*', 'GET', 168, 1, '2021-08-11 21:04:22', '2021-08-11 21:05:49');
INSERT INTO `tb_resource` VALUES (254, '点赞文章', '/articles/*/like', 'POST', 168, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (255, '查看分类列表', '/categories', 'GET', 165, 1, '2021-08-11 21:04:22', '2021-08-11 21:05:26');
INSERT INTO `tb_resource` VALUES (256, '查询评论', '/comments', 'GET', 178, 1, '2021-08-11 21:04:22', '2021-08-11 21:07:33');
INSERT INTO `tb_resource` VALUES (257, '添加评论', '/comments', 'POST', 178, 0, '2021-08-11 21:04:22', '2021-08-11 21:10:05');
INSERT INTO `tb_resource` VALUES (258, '评论点赞', '/comments/*/like', 'POST', 178, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (259, '查询评论下的回复', '/comments/*/replies', 'GET', 178, 1, '2021-08-11 21:04:22', '2021-08-11 21:07:30');
INSERT INTO `tb_resource` VALUES (260, '查看友链列表', '/links', 'GET', 167, 1, '2021-08-11 21:04:22', '2021-08-11 21:05:41');
INSERT INTO `tb_resource` VALUES (261, '查看留言列表', '/messages', 'GET', 174, 1, '2021-08-11 21:04:22', '2021-08-11 21:07:14');
INSERT INTO `tb_resource` VALUES (262, '添加留言', '/messages', 'POST', 174, 1, '2021-08-11 21:04:22', '2021-08-11 21:07:15');
INSERT INTO `tb_resource` VALUES (263, '获取相册列表', '/photos/albums', 'GET', 175, 1, '2021-08-11 21:04:22', '2021-08-11 21:07:20');
INSERT INTO `tb_resource` VALUES (264, '用户注册', '/register', 'POST', 173, 1, '2021-08-11 21:04:22', '2021-08-11 21:07:01');
INSERT INTO `tb_resource` VALUES (265, '查询标签列表', '/tags', 'GET', 170, 1, '2021-08-11 21:04:22', '2021-08-11 21:06:30');
INSERT INTO `tb_resource` VALUES (267, '更新用户头像', '/users/avatar', 'POST', 172, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (268, '发送邮箱验证码', '/users/code', 'GET', 173, 1, '2021-08-11 21:04:22', '2021-08-11 21:07:02');
INSERT INTO `tb_resource` VALUES (269, '绑定用户邮箱', '/users/email', 'POST', 172, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (270, '更新用户信息', '/users/info', 'PUT', 172, 0, '2021-08-11 21:04:22', NULL);
INSERT INTO `tb_resource` VALUES (271, 'qq登录', '/users/oauth/qq', 'POST', 173, 1, '2021-08-11 21:04:22', '2021-08-11 21:07:06');
INSERT INTO `tb_resource` VALUES (272, '微博登录', '/users/oauth/weibo', 'POST', 173, 1, '2021-08-11 21:04:22', '2021-08-11 21:07:06');
INSERT INTO `tb_resource` VALUES (273, '修改密码', '/users/password', 'PUT', 173, 1, '2021-08-11 21:04:22', '2021-08-11 21:07:09');
INSERT INTO `tb_resource` VALUES (274, '上传语音', '/voice', 'POST', 166, 1, '2021-08-11 21:04:22', '2021-08-11 21:05:33');
INSERT INTO `tb_resource` VALUES (275, '上传访客信息', '/report', 'POST', 166, 1, '2021-08-24 00:32:05', '2021-08-24 00:32:07');
INSERT INTO `tb_resource` VALUES (276, '获取用户区域分布', '/admin/users/area', 'GET', 173, 0, '2021-08-24 00:32:35', '2021-09-24 16:25:34');
INSERT INTO `tb_resource` VALUES (278, '说说模块', NULL, NULL, NULL, 0, '2022-01-24 01:29:13', NULL);
INSERT INTO `tb_resource` VALUES (279, '查看首页说说', '/home/talks', 'GET', 278, 1, '2022-01-24 01:29:29', '2022-01-24 01:31:56');
INSERT INTO `tb_resource` VALUES (280, '查看说说列表', '/talks', 'GET', 278, 1, '2022-01-24 01:29:52', '2022-01-24 01:31:56');
INSERT INTO `tb_resource` VALUES (281, '根据id查看说说', '/talks/*', 'GET', 278, 1, '2022-01-24 01:30:10', '2022-01-24 01:31:57');
INSERT INTO `tb_resource` VALUES (282, '点赞说说', '/talks/*/like', 'POST', 278, 0, '2022-01-24 01:30:30', NULL);
INSERT INTO `tb_resource` VALUES (283, '上传说说图片', '/admin/talks/images', 'POST', 278, 0, '2022-01-24 01:30:46', NULL);
INSERT INTO `tb_resource` VALUES (284, '保存或修改说说', '/admin/talks', 'POST', 278, 0, '2022-01-24 01:31:04', NULL);
INSERT INTO `tb_resource` VALUES (285, '删除说说', '/admin/talks', 'DELETE', 278, 0, '2022-01-24 01:31:22', NULL);
INSERT INTO `tb_resource` VALUES (286, '查看后台说说', '/admin/talks', 'GET', 278, 0, '2022-01-24 01:31:38', NULL);
INSERT INTO `tb_resource` VALUES (287, '根据id查看后台说说', '/admin/talks/*', 'GET', 278, 0, '2022-01-24 01:31:53', '2022-01-24 01:33:14');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名',
  `role_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用  0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '管理员', 'admin', 0, '2021-03-22 14:10:21', '2022-01-24 01:32:26');
INSERT INTO `tb_role` VALUES (2, '用户', 'user', 0, '2021-03-22 14:25:25', '2022-01-24 01:32:21');
INSERT INTO `tb_role` VALUES (3, '测试', 'test', 0, '2021-03-22 14:42:23', '2022-01-24 01:32:59');

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2527 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES (1397, 8, 1);
INSERT INTO `tb_role_menu` VALUES (1398, 8, 2);
INSERT INTO `tb_role_menu` VALUES (1399, 8, 6);
INSERT INTO `tb_role_menu` VALUES (1400, 8, 7);
INSERT INTO `tb_role_menu` VALUES (1401, 8, 8);
INSERT INTO `tb_role_menu` VALUES (1402, 8, 9);
INSERT INTO `tb_role_menu` VALUES (1403, 8, 10);
INSERT INTO `tb_role_menu` VALUES (1404, 8, 3);
INSERT INTO `tb_role_menu` VALUES (1405, 8, 11);
INSERT INTO `tb_role_menu` VALUES (1406, 8, 12);
INSERT INTO `tb_role_menu` VALUES (1407, 8, 202);
INSERT INTO `tb_role_menu` VALUES (1408, 8, 13);
INSERT INTO `tb_role_menu` VALUES (1409, 8, 14);
INSERT INTO `tb_role_menu` VALUES (1410, 8, 201);
INSERT INTO `tb_role_menu` VALUES (1411, 8, 4);
INSERT INTO `tb_role_menu` VALUES (1412, 8, 16);
INSERT INTO `tb_role_menu` VALUES (1413, 8, 15);
INSERT INTO `tb_role_menu` VALUES (1414, 8, 17);
INSERT INTO `tb_role_menu` VALUES (1415, 8, 18);
INSERT INTO `tb_role_menu` VALUES (1416, 8, 19);
INSERT INTO `tb_role_menu` VALUES (1417, 8, 20);
INSERT INTO `tb_role_menu` VALUES (1418, 8, 5);
INSERT INTO `tb_role_menu` VALUES (1595, 9, 1);
INSERT INTO `tb_role_menu` VALUES (1596, 9, 2);
INSERT INTO `tb_role_menu` VALUES (1597, 9, 6);
INSERT INTO `tb_role_menu` VALUES (1598, 9, 7);
INSERT INTO `tb_role_menu` VALUES (1599, 9, 8);
INSERT INTO `tb_role_menu` VALUES (1600, 9, 9);
INSERT INTO `tb_role_menu` VALUES (1601, 9, 10);
INSERT INTO `tb_role_menu` VALUES (1602, 9, 3);
INSERT INTO `tb_role_menu` VALUES (1603, 9, 11);
INSERT INTO `tb_role_menu` VALUES (1604, 9, 12);
INSERT INTO `tb_role_menu` VALUES (1605, 9, 202);
INSERT INTO `tb_role_menu` VALUES (1606, 9, 13);
INSERT INTO `tb_role_menu` VALUES (1607, 9, 14);
INSERT INTO `tb_role_menu` VALUES (1608, 9, 201);
INSERT INTO `tb_role_menu` VALUES (1609, 9, 4);
INSERT INTO `tb_role_menu` VALUES (1610, 9, 16);
INSERT INTO `tb_role_menu` VALUES (1611, 9, 15);
INSERT INTO `tb_role_menu` VALUES (1612, 9, 17);
INSERT INTO `tb_role_menu` VALUES (1613, 9, 18);
INSERT INTO `tb_role_menu` VALUES (1614, 9, 19);
INSERT INTO `tb_role_menu` VALUES (1615, 9, 20);
INSERT INTO `tb_role_menu` VALUES (1616, 9, 5);
INSERT INTO `tb_role_menu` VALUES (1639, 13, 2);
INSERT INTO `tb_role_menu` VALUES (1640, 13, 6);
INSERT INTO `tb_role_menu` VALUES (1641, 13, 7);
INSERT INTO `tb_role_menu` VALUES (1642, 13, 8);
INSERT INTO `tb_role_menu` VALUES (1643, 13, 9);
INSERT INTO `tb_role_menu` VALUES (1644, 13, 10);
INSERT INTO `tb_role_menu` VALUES (1645, 13, 3);
INSERT INTO `tb_role_menu` VALUES (1646, 13, 11);
INSERT INTO `tb_role_menu` VALUES (1647, 13, 12);
INSERT INTO `tb_role_menu` VALUES (2366, 14, 1);
INSERT INTO `tb_role_menu` VALUES (2367, 14, 2);
INSERT INTO `tb_role_menu` VALUES (2461, 1, 1);
INSERT INTO `tb_role_menu` VALUES (2462, 1, 2);
INSERT INTO `tb_role_menu` VALUES (2463, 1, 6);
INSERT INTO `tb_role_menu` VALUES (2464, 1, 7);
INSERT INTO `tb_role_menu` VALUES (2465, 1, 8);
INSERT INTO `tb_role_menu` VALUES (2466, 1, 9);
INSERT INTO `tb_role_menu` VALUES (2467, 1, 10);
INSERT INTO `tb_role_menu` VALUES (2468, 1, 3);
INSERT INTO `tb_role_menu` VALUES (2469, 1, 11);
INSERT INTO `tb_role_menu` VALUES (2470, 1, 12);
INSERT INTO `tb_role_menu` VALUES (2471, 1, 202);
INSERT INTO `tb_role_menu` VALUES (2472, 1, 13);
INSERT INTO `tb_role_menu` VALUES (2473, 1, 201);
INSERT INTO `tb_role_menu` VALUES (2474, 1, 213);
INSERT INTO `tb_role_menu` VALUES (2475, 1, 14);
INSERT INTO `tb_role_menu` VALUES (2476, 1, 15);
INSERT INTO `tb_role_menu` VALUES (2477, 1, 16);
INSERT INTO `tb_role_menu` VALUES (2478, 1, 4);
INSERT INTO `tb_role_menu` VALUES (2479, 1, 214);
INSERT INTO `tb_role_menu` VALUES (2480, 1, 209);
INSERT INTO `tb_role_menu` VALUES (2481, 1, 17);
INSERT INTO `tb_role_menu` VALUES (2482, 1, 18);
INSERT INTO `tb_role_menu` VALUES (2483, 1, 205);
INSERT INTO `tb_role_menu` VALUES (2484, 1, 206);
INSERT INTO `tb_role_menu` VALUES (2485, 1, 208);
INSERT INTO `tb_role_menu` VALUES (2486, 1, 210);
INSERT INTO `tb_role_menu` VALUES (2487, 1, 215);
INSERT INTO `tb_role_menu` VALUES (2488, 1, 216);
INSERT INTO `tb_role_menu` VALUES (2489, 1, 217);
INSERT INTO `tb_role_menu` VALUES (2490, 1, 218);
INSERT INTO `tb_role_menu` VALUES (2491, 1, 19);
INSERT INTO `tb_role_menu` VALUES (2492, 1, 20);
INSERT INTO `tb_role_menu` VALUES (2493, 1, 5);
INSERT INTO `tb_role_menu` VALUES (2494, 3, 1);
INSERT INTO `tb_role_menu` VALUES (2495, 3, 2);
INSERT INTO `tb_role_menu` VALUES (2496, 3, 6);
INSERT INTO `tb_role_menu` VALUES (2497, 3, 7);
INSERT INTO `tb_role_menu` VALUES (2498, 3, 8);
INSERT INTO `tb_role_menu` VALUES (2499, 3, 9);
INSERT INTO `tb_role_menu` VALUES (2500, 3, 10);
INSERT INTO `tb_role_menu` VALUES (2501, 3, 3);
INSERT INTO `tb_role_menu` VALUES (2502, 3, 11);
INSERT INTO `tb_role_menu` VALUES (2503, 3, 12);
INSERT INTO `tb_role_menu` VALUES (2504, 3, 202);
INSERT INTO `tb_role_menu` VALUES (2505, 3, 13);
INSERT INTO `tb_role_menu` VALUES (2506, 3, 201);
INSERT INTO `tb_role_menu` VALUES (2507, 3, 213);
INSERT INTO `tb_role_menu` VALUES (2508, 3, 14);
INSERT INTO `tb_role_menu` VALUES (2509, 3, 15);
INSERT INTO `tb_role_menu` VALUES (2510, 3, 16);
INSERT INTO `tb_role_menu` VALUES (2511, 3, 4);
INSERT INTO `tb_role_menu` VALUES (2512, 3, 214);
INSERT INTO `tb_role_menu` VALUES (2513, 3, 209);
INSERT INTO `tb_role_menu` VALUES (2514, 3, 17);
INSERT INTO `tb_role_menu` VALUES (2515, 3, 18);
INSERT INTO `tb_role_menu` VALUES (2516, 3, 205);
INSERT INTO `tb_role_menu` VALUES (2517, 3, 206);
INSERT INTO `tb_role_menu` VALUES (2518, 3, 208);
INSERT INTO `tb_role_menu` VALUES (2519, 3, 210);
INSERT INTO `tb_role_menu` VALUES (2520, 3, 215);
INSERT INTO `tb_role_menu` VALUES (2521, 3, 216);
INSERT INTO `tb_role_menu` VALUES (2522, 3, 217);
INSERT INTO `tb_role_menu` VALUES (2523, 3, 218);
INSERT INTO `tb_role_menu` VALUES (2524, 3, 19);
INSERT INTO `tb_role_menu` VALUES (2525, 3, 20);
INSERT INTO `tb_role_menu` VALUES (2526, 3, 5);

-- ----------------------------
-- Table structure for tb_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_resource`;
CREATE TABLE `tb_role_resource`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `resource_id` int NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4886 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role_resource
-- ----------------------------
INSERT INTO `tb_role_resource` VALUES (4750, 14, 238);
INSERT INTO `tb_role_resource` VALUES (4751, 2, 254);
INSERT INTO `tb_role_resource` VALUES (4752, 2, 267);
INSERT INTO `tb_role_resource` VALUES (4753, 2, 269);
INSERT INTO `tb_role_resource` VALUES (4754, 2, 270);
INSERT INTO `tb_role_resource` VALUES (4755, 2, 257);
INSERT INTO `tb_role_resource` VALUES (4756, 2, 258);
INSERT INTO `tb_role_resource` VALUES (4757, 2, 282);
INSERT INTO `tb_role_resource` VALUES (4758, 1, 165);
INSERT INTO `tb_role_resource` VALUES (4759, 1, 192);
INSERT INTO `tb_role_resource` VALUES (4760, 1, 193);
INSERT INTO `tb_role_resource` VALUES (4761, 1, 194);
INSERT INTO `tb_role_resource` VALUES (4762, 1, 195);
INSERT INTO `tb_role_resource` VALUES (4763, 1, 166);
INSERT INTO `tb_role_resource` VALUES (4764, 1, 183);
INSERT INTO `tb_role_resource` VALUES (4765, 1, 184);
INSERT INTO `tb_role_resource` VALUES (4766, 1, 246);
INSERT INTO `tb_role_resource` VALUES (4767, 1, 247);
INSERT INTO `tb_role_resource` VALUES (4768, 1, 167);
INSERT INTO `tb_role_resource` VALUES (4769, 1, 199);
INSERT INTO `tb_role_resource` VALUES (4770, 1, 200);
INSERT INTO `tb_role_resource` VALUES (4771, 1, 201);
INSERT INTO `tb_role_resource` VALUES (4772, 1, 168);
INSERT INTO `tb_role_resource` VALUES (4773, 1, 185);
INSERT INTO `tb_role_resource` VALUES (4774, 1, 186);
INSERT INTO `tb_role_resource` VALUES (4775, 1, 187);
INSERT INTO `tb_role_resource` VALUES (4776, 1, 188);
INSERT INTO `tb_role_resource` VALUES (4777, 1, 189);
INSERT INTO `tb_role_resource` VALUES (4778, 1, 190);
INSERT INTO `tb_role_resource` VALUES (4779, 1, 191);
INSERT INTO `tb_role_resource` VALUES (4780, 1, 254);
INSERT INTO `tb_role_resource` VALUES (4781, 1, 169);
INSERT INTO `tb_role_resource` VALUES (4782, 1, 208);
INSERT INTO `tb_role_resource` VALUES (4783, 1, 209);
INSERT INTO `tb_role_resource` VALUES (4784, 1, 170);
INSERT INTO `tb_role_resource` VALUES (4785, 1, 234);
INSERT INTO `tb_role_resource` VALUES (4786, 1, 235);
INSERT INTO `tb_role_resource` VALUES (4787, 1, 236);
INSERT INTO `tb_role_resource` VALUES (4788, 1, 237);
INSERT INTO `tb_role_resource` VALUES (4789, 1, 171);
INSERT INTO `tb_role_resource` VALUES (4790, 1, 213);
INSERT INTO `tb_role_resource` VALUES (4791, 1, 214);
INSERT INTO `tb_role_resource` VALUES (4792, 1, 215);
INSERT INTO `tb_role_resource` VALUES (4793, 1, 216);
INSERT INTO `tb_role_resource` VALUES (4794, 1, 217);
INSERT INTO `tb_role_resource` VALUES (4795, 1, 224);
INSERT INTO `tb_role_resource` VALUES (4796, 1, 172);
INSERT INTO `tb_role_resource` VALUES (4797, 1, 240);
INSERT INTO `tb_role_resource` VALUES (4798, 1, 241);
INSERT INTO `tb_role_resource` VALUES (4799, 1, 244);
INSERT INTO `tb_role_resource` VALUES (4800, 1, 245);
INSERT INTO `tb_role_resource` VALUES (4801, 1, 267);
INSERT INTO `tb_role_resource` VALUES (4802, 1, 269);
INSERT INTO `tb_role_resource` VALUES (4803, 1, 270);
INSERT INTO `tb_role_resource` VALUES (4804, 1, 173);
INSERT INTO `tb_role_resource` VALUES (4805, 1, 239);
INSERT INTO `tb_role_resource` VALUES (4806, 1, 242);
INSERT INTO `tb_role_resource` VALUES (4807, 1, 276);
INSERT INTO `tb_role_resource` VALUES (4808, 1, 174);
INSERT INTO `tb_role_resource` VALUES (4809, 1, 205);
INSERT INTO `tb_role_resource` VALUES (4810, 1, 206);
INSERT INTO `tb_role_resource` VALUES (4811, 1, 207);
INSERT INTO `tb_role_resource` VALUES (4812, 1, 175);
INSERT INTO `tb_role_resource` VALUES (4813, 1, 218);
INSERT INTO `tb_role_resource` VALUES (4814, 1, 219);
INSERT INTO `tb_role_resource` VALUES (4815, 1, 220);
INSERT INTO `tb_role_resource` VALUES (4816, 1, 221);
INSERT INTO `tb_role_resource` VALUES (4817, 1, 222);
INSERT INTO `tb_role_resource` VALUES (4818, 1, 223);
INSERT INTO `tb_role_resource` VALUES (4819, 1, 176);
INSERT INTO `tb_role_resource` VALUES (4820, 1, 202);
INSERT INTO `tb_role_resource` VALUES (4821, 1, 203);
INSERT INTO `tb_role_resource` VALUES (4822, 1, 204);
INSERT INTO `tb_role_resource` VALUES (4823, 1, 230);
INSERT INTO `tb_role_resource` VALUES (4824, 1, 238);
INSERT INTO `tb_role_resource` VALUES (4825, 1, 177);
INSERT INTO `tb_role_resource` VALUES (4826, 1, 229);
INSERT INTO `tb_role_resource` VALUES (4827, 1, 232);
INSERT INTO `tb_role_resource` VALUES (4828, 1, 233);
INSERT INTO `tb_role_resource` VALUES (4829, 1, 243);
INSERT INTO `tb_role_resource` VALUES (4830, 1, 178);
INSERT INTO `tb_role_resource` VALUES (4831, 1, 196);
INSERT INTO `tb_role_resource` VALUES (4832, 1, 197);
INSERT INTO `tb_role_resource` VALUES (4833, 1, 198);
INSERT INTO `tb_role_resource` VALUES (4834, 1, 257);
INSERT INTO `tb_role_resource` VALUES (4835, 1, 258);
INSERT INTO `tb_role_resource` VALUES (4836, 1, 179);
INSERT INTO `tb_role_resource` VALUES (4837, 1, 225);
INSERT INTO `tb_role_resource` VALUES (4838, 1, 226);
INSERT INTO `tb_role_resource` VALUES (4839, 1, 227);
INSERT INTO `tb_role_resource` VALUES (4840, 1, 228);
INSERT INTO `tb_role_resource` VALUES (4841, 1, 231);
INSERT INTO `tb_role_resource` VALUES (4842, 1, 180);
INSERT INTO `tb_role_resource` VALUES (4843, 1, 210);
INSERT INTO `tb_role_resource` VALUES (4844, 1, 211);
INSERT INTO `tb_role_resource` VALUES (4845, 1, 212);
INSERT INTO `tb_role_resource` VALUES (4846, 1, 278);
INSERT INTO `tb_role_resource` VALUES (4847, 1, 282);
INSERT INTO `tb_role_resource` VALUES (4848, 1, 283);
INSERT INTO `tb_role_resource` VALUES (4849, 1, 284);
INSERT INTO `tb_role_resource` VALUES (4850, 1, 285);
INSERT INTO `tb_role_resource` VALUES (4851, 1, 286);
INSERT INTO `tb_role_resource` VALUES (4852, 1, 287);
INSERT INTO `tb_role_resource` VALUES (4853, 3, 192);
INSERT INTO `tb_role_resource` VALUES (4854, 3, 195);
INSERT INTO `tb_role_resource` VALUES (4855, 3, 183);
INSERT INTO `tb_role_resource` VALUES (4856, 3, 246);
INSERT INTO `tb_role_resource` VALUES (4857, 3, 199);
INSERT INTO `tb_role_resource` VALUES (4858, 3, 185);
INSERT INTO `tb_role_resource` VALUES (4859, 3, 191);
INSERT INTO `tb_role_resource` VALUES (4860, 3, 254);
INSERT INTO `tb_role_resource` VALUES (4861, 3, 208);
INSERT INTO `tb_role_resource` VALUES (4862, 3, 234);
INSERT INTO `tb_role_resource` VALUES (4863, 3, 237);
INSERT INTO `tb_role_resource` VALUES (4864, 3, 213);
INSERT INTO `tb_role_resource` VALUES (4865, 3, 241);
INSERT INTO `tb_role_resource` VALUES (4866, 3, 239);
INSERT INTO `tb_role_resource` VALUES (4867, 3, 276);
INSERT INTO `tb_role_resource` VALUES (4868, 3, 205);
INSERT INTO `tb_role_resource` VALUES (4869, 3, 218);
INSERT INTO `tb_role_resource` VALUES (4870, 3, 221);
INSERT INTO `tb_role_resource` VALUES (4871, 3, 223);
INSERT INTO `tb_role_resource` VALUES (4872, 3, 202);
INSERT INTO `tb_role_resource` VALUES (4873, 3, 230);
INSERT INTO `tb_role_resource` VALUES (4874, 3, 238);
INSERT INTO `tb_role_resource` VALUES (4875, 3, 232);
INSERT INTO `tb_role_resource` VALUES (4876, 3, 243);
INSERT INTO `tb_role_resource` VALUES (4877, 3, 196);
INSERT INTO `tb_role_resource` VALUES (4878, 3, 257);
INSERT INTO `tb_role_resource` VALUES (4879, 3, 258);
INSERT INTO `tb_role_resource` VALUES (4880, 3, 225);
INSERT INTO `tb_role_resource` VALUES (4881, 3, 231);
INSERT INTO `tb_role_resource` VALUES (4882, 3, 210);
INSERT INTO `tb_role_resource` VALUES (4883, 3, 282);
INSERT INTO `tb_role_resource` VALUES (4884, 3, 286);
INSERT INTO `tb_role_resource` VALUES (4885, 3, 287);

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
INSERT INTO `tb_tag` VALUES (29, '测试标签', '2022-01-24 23:33:57', NULL);
INSERT INTO `tb_tag` VALUES (30, 'vue', '2022-05-29 22:15:20', NULL);

-- ----------------------------
-- Table structure for tb_talk
-- ----------------------------
DROP TABLE IF EXISTS `tb_talk`;
CREATE TABLE `tb_talk`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '说说id',
  `user_id` int NOT NULL COMMENT '用户id',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '说说内容',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1.公开 2.私密',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_talk
-- ----------------------------
INSERT INTO `tb_talk` VALUES (51, 1, 'hdiusahduisaq', NULL, 0, 1, '2022-06-02 20:50:01', NULL);

-- ----------------------------
-- Table structure for tb_unique_view
-- ----------------------------
DROP TABLE IF EXISTS `tb_unique_view`;
CREATE TABLE `tb_unique_view`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `views_count` int NOT NULL COMMENT '访问量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 535 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_unique_view
-- ----------------------------
INSERT INTO `tb_unique_view` VALUES (534, 2, '2022-05-30 00:00:00', NULL);

-- ----------------------------
-- Table structure for tb_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_auth`;
CREATE TABLE `tb_user_auth`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_info_id` int NOT NULL COMMENT '用户信息id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `login_type` tinyint(1) NOT NULL COMMENT '登录类型',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 996 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_auth
-- ----------------------------
INSERT INTO `tb_user_auth` VALUES (1, 1, '1903078434@qq.com', '$2a$10$AkxkZaqcxEXdiNE1nrgW1.ms3aS9C5ImXMf8swkWUJuFGMqDl.TPW', 1, '127.0.0.1', '', '2021-08-12 15:43:18', '2022-06-02 20:49:33', '2022-06-02 20:49:33');
INSERT INTO `tb_user_auth` VALUES (995, 1005, 'fa52@5biswq9j.cn', '$2a$10$K7KQJ8mED4NKLvaNlAOx5ey4NbcU1CUDrEJnL9zCWNIvnbjrhwOnK', 1, '61.222.202.239', '湖南省', '2022-01-27 10:58:11', '2022-01-27 10:58:12', '2022-01-27 10:58:12');

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱号',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户简介',
  `web_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人网站',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1006 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
INSERT INTO `tb_user_info` VALUES (1, '1903078434@qq.com', '小飞', 'https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg', '1903078434@qq.com', 'www.naste.top', 0, '2021-08-12 15:43:17', '2022-05-31 00:35:25');
INSERT INTO `tb_user_info` VALUES (1005, 'xiaainy@163.com', '用户1486533968342859778', 'https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg', NULL, NULL, 0, '2022-01-27 10:58:11', NULL);

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES (1001, 1, 1);
INSERT INTO `tb_user_role` VALUES (1002, 1005, 2);

-- ----------------------------
-- Table structure for tb_website_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_website_config`;
CREATE TABLE `tb_website_config`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `config` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配置信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_website_config
-- ----------------------------
INSERT INTO `tb_website_config` VALUES (1, '{\"alipayQRCode\":\"https://vkceyugu.cdn.bspapp.com/VKCEYUGU-de7019a4-e7b5-4283-9f05-1c4fc1b08926/049952d0-9e50-436d-965e-5f733de2f799.jpg\",\"gitee\":\"https://gitee.com/xiao-i-fei\",\"github\":\"https://github.com/xiao-i-fei\",\"isChatRoom\":0,\"isCommentReview\":1,\"isEmailNotice\":1,\"isMessageReview\":0,\"isMusicPlayer\":0,\"isReward\":1,\"qq\":\"1903078434\",\"socialLoginList\":[\"weibo\",\"qq\"],\"socialUrlList\":[\"qq\",\"github\",\"gitee\"],\"touristAvatar\":\"http://xiaofei-mall.oss-cn-beijing.aliyuncs.com/config/160294eb381c3795a12c8ae516a6e6a6.jpg\",\"userAvatar\":\"https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg\",\"websiteAuthor\":\"小飞\",\"websiteAvatar\":\"https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/IMG_20220401_113118.jpg\",\"websiteCreateTime\":\"2022-05-30\",\"websiteIntro\":\"个人博客网站\",\"websiteName\":\"小飞个人博客\",\"websiteNotice\":\"请前往后台管理->系统管理->网站管理处修改信息\",\"websiteRecordNo\":\"\",\"websocketUrl\":\"ws://127.0.0.1:8080/websocket\",\"weiXinQRCode\":\"https://xiaofei-mall.oss-cn-beijing.aliyuncs.com/%E9%80%9A%E7%94%A8%E5%9B%BE%E7%89%87/%E5%A4%B4%E5%83%8F/mmqrcode1653232853385.png\"}', '2021-08-09 19:37:30', '2022-05-31 00:26:29');

SET FOREIGN_KEY_CHECKS = 1;
