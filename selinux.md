#  Selinux for android 踩坑记录
## 概述
  selinux 是一个复杂而又单纯的系统，复杂是因为对于一个白名单系统来说，太多的操作需要被允许，几万条规则组成的系统不可谓不复杂
单纯是因为， 整个系统最核心的只有一句话：
  allow [xx进程]   xx资源:xx类型  {操作} 
  举例： allow fhservice cache_file:dir { open read search create rmdir getattr remove_name add_name write };
  
## mac 与dac 
- linux基于用户和组的权限系统（dac：Discretionary Access Control），对应的用户与组被赋予访问文件、设备的完全权限。
  - 例如文件权限为755的文件，赋予所有者权限7（读、写、执行），组所有者权限5（读取、执行），其他用户权限5（读取、执行
- Selinux 强制权限系统（mac：Mandatory Access Control），规则由系统管理员制定，规则之外的访问权限一律不被允许（白名单系统）

## Android 下的selinux
### 标签系统
- file_contexts //系统中所有file_contexts安全上下文
- seapp_contexts //app安全上下文
- property_contexts //属性的安全上下文
- service_contexts    //service文件安全上下文
- genfs_contexts //虚拟文件系统安全上下文
- 进程标签，一般一个进程对应一个 {进程类型}.te 文件，例如对于系统签名的apk权限：  system_app.te
### 标签系统的查看
- 使用PS -Z 查看进程标签 ls -Z 查看文件或设备的标签
### 属性系统
type关键字：
> Statement Identifier  # Comment
> #-----------------------#---------------------------------------------------
> type bin_t;             # A type identifier ends with _t
> attribute file_type;    # An attribute identifier generally ends with _type

type语句：
> type type_id [alias alias_id] [, attribute_id];

示例:
> Using the type statement to declare a type of setfiles_t that 
> also has an alias of restorecon_t and one previously declared
> attribute of can_relabelto_binary_policy associated with it.

> attribute can_relabelto_binary_policy;

> type setfiles_t alias restorecon_t, can_relabelto_binary_policy;

typeattribute 语句：
> The typeattribute statement allows the association of previously declared types to one or more previously declared attributes.
> The statement definition is:
> typeattribute type_id attribute_id;




###部分编译
 make vendor_sepolicy.cil -j8

输出目标文件： /vendor/etc/selinux/vendor_sepolicy.cil
但替换此文件不能生效


### USEFULL MACROS
```
define(`domain_trans', `
# 例如：domain_trans(init, rootfs, adbd)  $1=init $2=rootfs $3=adbd

# 允许 init进程读取、执行 rootfs类型的文件
allow $1 $2:file { getattr open read execute map };
# 允许 init进程 转化为adbd进程类型
allow $1 $3:process transition;
# 新进程通过执行文件 /bin/adbd 进入
allow $3 $2:file { entrypoint open read execute getattr map };
# adbd 进程允许发送 sigchld 消息给init进程
ifelse($1, `init', `', `allow $3 $1:process sigchld;')
# Enable AT_SECURE, i.e. libc secure mode.
dontaudit $1 $3:process noatsecure;
# XXX dontaudit candidate but requires further study.
allow $1 $3:process { siginh rlimitinh };
')

#####################################
# domain_auto_trans(olddomain, type, newdomain)
# Automatically transition from olddomain to newdomain
# upon executing a file labeled with type.
# 例如：domain_auto_trans(adbd, shell_exec, shell)  olddomain:adbd type:shell_exec newdomain:shell

define(`domain_auto_trans', `
# Allow the necessary permissions.
domain_trans($1,$2,$3)
# 触发类型转化  type_transition语法： type_transition source_type target_type : class default_type;
type_transition $1 $2:process $3;
')
```




[参考文章:应用场景举例](https://blog.csdn.net/shell812/article/details/58596377)
[参考文章:type系统](https://blog.csdn.net/fybon/article/details/42263813)
