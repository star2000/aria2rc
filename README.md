# aria2rc

[![total / day](https://img.shields.io/badge/dynamic/json?url=https://data.jsdelivr.com/v1/package/gh/star2000/count@4/stats/day&label=total&query=total&suffix=+/+day&style=flat-square)](https://github.com/star2000/count)
[![total / week](https://img.shields.io/badge/dynamic/json?url=https://data.jsdelivr.com/v1/package/gh/star2000/count@4/stats/week&label=total&query=total&suffix=+/+week&style=flat-square)](https://github.com/star2000/count)
[![total / month](https://img.shields.io/badge/dynamic/json?url=https://data.jsdelivr.com/v1/package/gh/star2000/count@4/stats/month&label=total&query=total&suffix=+/+month&style=flat-square)](https://github.com/star2000/count)
[![total / year](https://img.shields.io/badge/dynamic/json?url=https://data.jsdelivr.com/v1/package/gh/star2000/count@4/stats/year&label=total&query=total&suffix=+/+year&style=flat-square)](https://github.com/star2000/count)

安装、配置、自启，全自动。

## 安装后如何使用

建议搭配 Microsoft Edge 浏览器的[Aria2 manager](https://microsoftedge.microsoft.com/addons/detail/ojbidmhgnhijiiagnlfnlbhhnkajklcl)插件使用

Aria2 manager 安装后需要到[AriaNg 设置](extension://ojbidmhgnhijiiagnlfnlbhhnkajklcl/ui/ariang/index.html#!/settings/ariang)，将`RPC`页的`Aria2 RPC 地址`行的最左边的空改成`127.0.0.1`

另外建议去[Aria2 manager 配置页](extension://ojbidmhgnhijiiagnlfnlbhhnkajklcl/ui/options.html)勾选`自动拦截下载任务到 Aria2c`

## 安装

### Windows

鼠标移至命令上，连点三次，`Ctrl+C`，`Win+R`，`Ctrl+V`，`Enter`

```powershell
iwr -useb 'https://fastly.jsdelivr.net/gh/star2000/aria2rc/install.ps1' | iex
```

### Linux

```bash
wget -qO- 'https://fastly.jsdelivr.net/gh/star2000/aria2rc/install.sh' | sh
```

## 卸载

### Windows

```powershell
iwr -useb 'https://fastly.jsdelivr.net/gh/star2000/aria2rc/uninstall.ps1' | iex
```

### Linux

```bash
wget -qO- 'https://fastly.jsdelivr.net/gh/star2000/aria2rc/uninstall.sh' | sh
```
