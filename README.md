# MyPiliPlus

上游链接：[PiliPlus](https://github.com/bggRGjQaUbCoE/PiliPlus)

个人出于兴趣爱好的PiliPlus修复和调整用的小项目。不会关issue，可以随意讨论，工作优先程度：1. 影响到作者使用的bug 2.作者想加的新功能 3.没影响到作者使用，上游不管的bug 4.作者用不到的新功能

以后随缘合并上游更改。

### 修复：
1. 某些设备上字体不正常
2. 插入usb声卡后视频播放速度不正常

### 新增功能：
1. 实体键盘快捷键调整视频播放速度，c键加速，x键减速，z键还原

### 调整：
1. 横屏适配默认打开
2. 安卓硬件解码先尝试使用vulkan，其次是auto-safe
3. 安卓默认使用AudioTrack播放音频
