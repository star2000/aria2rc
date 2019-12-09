# aria2rc

[![](https://img.shields.io/badge/dynamic/json?label=Windows&query=files['/install.ps1'].total&url=https://data.jsdelivr.com/v1/package/gh/star2000/aria2rc@1.0.1/stats/year&suffix=%20times/year)](https://www.jsdelivr.com/package/gh/star2000/aria2rc)
[![](https://img.shields.io/badge/dynamic/json?label=Linux&query=files['/install.sh'].total&url=https://data.jsdelivr.com/v1/package/gh/star2000/aria2rc@1.0.1/stats/year&suffix=%20times/year)](https://www.jsdelivr.com/package/gh/star2000/aria2rc)

安装、配置、自启，全自动。

## 用法

### Windows

用`PowerShell`执行

```ps1
(New-Object Net.WebClient).DownloadString('http://cdn.jsdelivr.net/gh/star2000/aria2rc/install.ps1') | iex
```

### Linux

```bash
wget -qO- cdn.jsdelivr.net/gh/star2000/aria2rc/install.sh | sh
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

- 本体：`~/.local/applications/aria2.desktop`
- 配置：`~/.aria2/aria2.conf`
- 会话：`~/.aria2/aria2.session`
- 自启：`~/.config/autostart/aria2.desktop`
