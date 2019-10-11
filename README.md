# aria2rc

安装、配置、自启，全自动。

## 用法

### Windows

用`PowerShell >=3.0`执行

```ps1
iwr -useb git.io/aria2rc.ps1 | iex
```

### Linux

```bash
wget -qO- git.io/aria2rc.sh | sh
```

## 网页前端

命令执行完成，自动打开<http://aria2.net>，  
添加书签或创建快捷方式来方便使用。

## 文件路径

### Windows

- 本体：`~\.config\aria2\aria2c.exe`
- 配置：`~\.config\aria2\aria2.conf`
- 会话：`~\.config\aria2\aria2.session`
- 自启：`~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\aria2.vbs`

### Linux

- 配置：`~/.aria2/aria2.conf`
- 会话：`~/.aria2/aria2.session`
- 自启：`~/.config/autostart/aria2.desktop`
