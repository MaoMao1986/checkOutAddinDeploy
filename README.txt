CheckOutAddIn 首次安装证书信任包

1. 确认本压缩包来自 CheckOutAddIn 官方 GitHub Pages 安装页。
2. 解压全部文件，双击 Install-CheckOutAddInCertificate.cmd。
3. Windows 显示证书安全警告时，核对指纹：
   9ED715817BB5C0D1BDB0E5474C71E03EF872F14E
4. 返回安装页运行 setup.exe。

该操作只将 CheckOutAddIn 的公钥证书导入当前 Windows 用户的“受信任的根证书颁发机构”和“受信任的发布者”。
它不会复制或安装发布私钥，也不会修改其他 Windows 用户的证书库。

如果当前 Windows 用户已经使用 Codex（默认目录 %USERPROFILE%\.codex，或已设置 CODEX_HOME），
CheckOutAddIn 会在安装后首次启动 Excel 时自动安装或更新 checkout-addin 技能。
未安装 Codex 时会静默跳过，不影响 CheckOutAddIn 的安装和使用。
