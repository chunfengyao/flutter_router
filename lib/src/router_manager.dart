
typedef FindPageFunc = dynamic Function(String path);
class MNRouter{
  static final MNRouter _INSTANCE = MNRouter();
  get Instance => _INSTANCE;

  ///初始化路由（将子模块的路由传递给管理类，并且提供找页面的功能。）
  void initGroup(String groupName, FindPageFunc findPage){
    //如果groupName已经存在，则直接报错！！！
  }

  ///通过页面对象获取跳转时传递的参数对象
  dynamic getParamsForPage(dynamic pageObj){
    //通过pageObj的hashCode作为关键字！
  }

}