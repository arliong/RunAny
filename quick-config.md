## 【自定义树形菜单配置方法】

#### **首次使用请阅读：**

### [新建分类/目录]
**以 `-`开头为1级菜单， `--`+名称为2级菜单，`---`+名称3级菜单……以此类推，如：`-app应用`、`--img图像处理`、……  `---三级菜单`**

### [分隔符]
**单独一个 `-`是1级分隔符， `--`2级分隔符……以此类推，如：`-`、`--`、……  `----`**

### [菜单别名]
**在竖 `|` 前面添加程序的别名，如：`word|winword.exe`菜单上只会显示word**

### [注释]
**前加 `;`可以注释暂时不用的，如：`;cmd.exe`**

### [区分重名程序]

1. 升级RunAny版本到5.6.9版本以上，自动优先最新版本exe程序功能
2. 修改RunAny设置中的Everything搜索参数，屏蔽不正确路径程序
3. 创建该程序的快捷方式，在RunAny中添加使用快捷方式解决重名问题
4. 全路径指定运行，只推荐固定路径安装程序，不推荐绿色软件使用此方式

详细方法文章：[无路径如何区别运行重名的exe程序](run-repeat-exe.md)

> 默认支持exe、lnk、ahk、bat、cmd文件的无路径识别，其他后缀可以在RunAny设置中的Everything搜索参数，如支持doc文档免设路径识别
>
> 每个菜单名首字母(或用&指定任意)便是启动快捷键，如：`IE(&E)|iexplore.exe`快捷键是e


## 【进阶配置】

选中视频文件按<kbd>\`</kbd>只弹出`影音(&Video)`分类内容，多款播放软件选择使用

![RunAny新增修改菜单分类](/assets/images/RunAny新增修改菜单分类.jpg)

### [不同后缀不同菜单]

**在分类/目录名后加 `|`和后缀，选中不同文件出不同菜单**

  - 推荐使用RunAny的“修改菜单”界面，选中分类后右键编辑

  - 如果手动修改RunAny.ini：`-影音(&Video)|avi mkv mp4 rm rmvb flv wmv swf` 

> 如果后缀分类菜单中只有一款软件，那选中对应后缀文件后按<kbd>\`</kbd>将一键用该软件打开文件


### [半透明启动程序]

**推荐使用RunAny“新增修改菜单项”界面修改透明度**

![RunAny新增修改菜单项](/assets/images/RunAny新增修改菜单项.jpg)

**手动修改`RunAny.ini`：**

在应用别名后面添加 `_:数字`形式来透明启动应用（默认不透明,1-100是全透明到不透明），如88%透明度：

```ini
记事本(&N)_:88|Notepad.exe
```

---