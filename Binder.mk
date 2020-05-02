## Binder 的作用
Binder 是Android中使用的一种 ipc机制 通过内核驱动来实现。
##Binder 的组成
- 驱动部分： /dev/binder 源码 ： common/driver/android
  - LINKS: [强弱指针]（https://blog.csdn.net/ffmpeg4976/article/details/48107037#t2）
  - LINKS: [Binder驱动 1]（https://blog.csdn.net/weixin_34281477/article/details/88207456）
  - LINKS: [Binder驱动 2]（https://blog.csdn.net/weixin_34191845/article/details/88207448）
客户端： client
服务端： server
特殊服务端：  ServiceManager 守护进程 源码： 
