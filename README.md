# aria2rc

[![total / day](https://img.shields.io/badge/dynamic/json?url=https://data.jsdelivr.com/v1/package/gh/star2000/count@4/stats/day&label=total&query=total&suffix=+/+day&style=flat-square)](https://github.com/star2000/count)
[![total / week](https://img.shields.io/badge/dynamic/json?url=https://data.jsdelivr.com/v1/package/gh/star2000/count@4/stats/week&label=total&query=total&suffix=+/+week&style=flat-square)](https://github.com/star2000/count)
[![total / month](https://img.shields.io/badge/dynamic/json?url=https://data.jsdelivr.com/v1/package/gh/star2000/count@4/stats/month&label=total&query=total&suffix=+/+month&style=flat-square)](https://github.com/star2000/count)
[![total / year](https://img.shields.io/badge/dynamic/json?url=https://data.jsdelivr.com/v1/package/gh/star2000/count@4/stats/year&label=total&query=total&suffix=+/+year&style=flat-square)](https://github.com/star2000/count)

安装、配置、自启，全自动。

## 安装

命令执行完成时，自动打开<http://aria2.net>，  
添加书签或创建快捷方式来方便使用。

或者自行安装浏览器扩展。

### Windows

复制以下命令，按`Win+R`，粘贴，回车

```powershell
powershell (New-Object Net.WebClient).DownloadString('https://xing2000.coding.net/p/mirrors/d/aria2rc/git/raw/master/install.ps1') | iex
```

### Linux

```bash
wget -qO- xing2000.coding.net/p/mirrors/d/aria2rc/git/raw/master/install.sh | sh
```

## 卸载

### Windows

```powershell
powershell (New-Object Net.WebClient).DownloadString('https://xing2000.coding.net/p/mirrors/d/aria2rc/git/raw/master/uninstall.ps1') | iex
```

### Linux

```bash
wget -qO- xing2000.coding.net/p/mirrors/d/aria2rc/git/raw/master/uninstall.sh | sh
```
