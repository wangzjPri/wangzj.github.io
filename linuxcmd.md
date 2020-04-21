###打压缩包的过程中， 排除特定文件类型如：git repo 等：
> tar -jcvf bz2/xxx.tar.bz2 xxx --exclude=*.svn --exclude=*.git --exclude=*.repo

###跳过google atv 版本开机向导：
> pm disable com.google.android.tungsten.setupwraith
> settings put secure user_setup_complete 1
> settings put global device_provisioned 1
> settings put secure tv_user_setup_complete 1
