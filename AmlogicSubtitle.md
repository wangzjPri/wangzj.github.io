#Amlogic Subtitle Service analysis
###source code：
vendor/amlogic/common/apps/SubTitle
vendor/amlogic/common/interfaces/subtitleserver/
vendor/amlogic/common/frameworks/services/subtiltleserver



### aidl and hidl
vendor/amlogic/common/interfaces/subtitleserver/1.0/ISubtitleServer.hal
vendor/amlogic/common/interfaces/subtitleserver/1.0/ISubtitleServerCallback.hal
vendor/amlogic/common/interfaces/subtitleserver/1.0/types.hal
vendor/amlogic/common/apps/SubTitle/src/com/droidlogic/app/ISubTitleServiceCallback.aidl
vendor/amlogic/common/apps/SubTitle/src/com/droidlogic/app/ISubTitleService.aidl
vendor/amlogic/common/frameworks/core/java/com/droidlogic/app/ISubTitleServiceCallback.aidl
vendor/amlogic/common/frameworks/core/java/com/droidlogic/app/ISubTitleService.aidl
question to ask：
1. what this module do
a: display subtitle in a overlay window  , when playing video using internal video player

2. how did the interface defined
a: many play control functions , and a callback

3. which one is server which one is client
1.  client proxy interface  ， extends BpInterface:
 vendor/amlogic/common/apps/SubTitle/service/ISubTitleService.cpp
 
2. actual service code extends ISubTitleService.Stub
 vendor/amlogic/common/apps/SubTitle/src/com/droidlogic/SubTitleService/SubTitleService.java
 
3. actual java client ,that do  bind action:  com.droidlogic.SubTitleServer
 vendor/amlogic/common/frameworks/core/java/com/droidlogic/app/SubtitleManager.java
