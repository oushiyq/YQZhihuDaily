# YQZhihuDaily
## 数据层
因为底层的数据API都是知乎（Zhihu.Inc）提供的，我只能读取数据给业务层加工，所以数据层并不在我的设计范围之内。不过，后期可能会使用fmdb实现一些本地登录、收藏的功能，但仅限于本地操作。
## 业务层
业务层是一个数据加工场，处理核心的业务逻辑，从API提取的数据经过业务层的加工提供给表示层。
主要的类有：

1. YQHttpTool：用于封装基于AFNetWorking的GET方法；

2. YQThemesTool：取得知乎日报API返回的theme信息；

3. YQStoriesTool：取得知乎日报API返回的新闻信息，包括新闻标题、新闻图片、内容ID

4. YQSessionTool：以返回的date对新闻进行不同的session分组。

## 表示层
所有的功能页面等都属于这一类，整个APP可以分成4个功能页面：
1.  leftDrawerView：左抽屉视图，主要包含主题日报，点击跳转进入相应的themeView；

![左抽屉视图](http://7xqzfr.com1.z0.glb.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B45%E6%9C%8817%E6%97%A5%20%E4%B8%8B%E5%8D%883.03.48.png)

2.  mainView：主视图，知乎日报首页，提供每天的『今日热闻』，点击跳转到相应的detailView；

![主视图](http://7xqzfr.com1.z0.glb.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B45%E6%9C%8817%E6%97%A5%20%E4%B8%8B%E5%8D%883.03.45.png)

3.  themeView：主题日报，包含每个主题的推荐内容，点击跳转到相应的detailView；

4.  detailView：新闻视图，根据storyID来获取新闻内容。
