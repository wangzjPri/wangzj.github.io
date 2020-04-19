#  Selinux for android 踩坑记录
## mac 与dac 
-linux基于用户和组的权限系统（dac：Discretionary Access Control），对应的用户与组被赋予访问文件、设备的完全权限。
  -例如文件权限为755的文件，赋予所有者权限7（读、写、执行），组所有者权限5（读取、执行），其他用户权限5（读取、执行
-Selinux 强制权限系统（mac：Mandatory Access Control），规则由系统管理员制定，规则之外的访问权限一律不被允许（白名单系统）

## Android 下的selinux
