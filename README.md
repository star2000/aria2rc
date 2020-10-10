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

鼠标移至命令上，连点三次，`Ctrl+C`，`Win+R`，`Ctrl+V`，`Enter`

```powershell
powershell (New-Object Net.WebClient).DownloadString('https://raw.fastgit.org/star2000/aria2rc/master/install.ps1') | iex
```

### Linux

```bash
wget -qO- raw.fastgit.org/star2000/aria2rc/master/install.sh | sh
```

## 卸载

### Windows

```powershell
powershell (New-Object Net.WebClient).DownloadString('https://raw.fastgit.org/star2000/aria2rc/master/uninstall.ps1') | iex
```

### Linux

```bash
wget -qO- raw.fastgit.org/star2000/aria2rc/master/uninstall.sh | sh
```
