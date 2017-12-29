# cordova-plugin-photobrowser
Cordova 图片浏览插件
一款原生图片浏览插件，支持iOS、Android
# 效果图

# 安装
```
cordova plugin add https://github.com/gaofengtan/cordova-plugin-photobrowser
```
# 使用
```
declare var cordova: any;

cordova.plugins.PhotoBrowser.show(imageUrls, index);

params
- imageUrls：图片地址集合
- index：当前需要查看的位置
```

