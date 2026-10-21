# 未纳入的插件与名称纠正

## 4 个私有插件（未安装）

| 插件 | 原因 | 现状 |
| --- | --- | --- |
| @huanlin/dsh-plugin-account-signin | 逆向官方实现，不便公开 | 未安装；Windows 侧路径 D:/Projects/deepseek-harness/dsh-plugin-account-signin |
| @huanlin/dsh-plugin-annotations | 尚未写完 | 未安装；D:/Projects/deepseek-harness/dsh-plugin-annotations |
| @huanlin/dsh-plugin-deepseek-voice-input | 原计划用 whale-typeless.exe 替代，现改用官方语音输入 | 未安装；D:/Projects/deepseek-harness/dsh-plugin-deepseek-voice-input |
| @huanlin/dsh-plugin-export-session | 企业版专用 | 未安装；D:/Projects/deepseek-harness/dsh-plugin-export-session |

whale-typeless.exe 是 Windows PE，依赖 Win32 全局热键 / explorer 剪贴板 / 原生 overlay，在 Wayland 下不可用；已改用官方 dsh-experimental-voice-input-bundle（本地 SenseVoice）。

## 名称纠正（截图 OCR -> 实际包）

| 截图里的名字 | 实际包 | 版本 | 状态 |
| --- | --- | --- | --- |
| @huanlin/dsh-plugin-sidbar-brand-text | @huanlin/dsh-plugin-sidebar-brand-text | 0.7.3 | 已安装 |
| @huanlin/dsh-plugin-prefaec-context | @huanlin/dsh-plugin-preface-context | 0.4.0 | 已安装 |
| @huanlin/dsh-plugin-komani | @huanlin/dsh-plugin-komari | 0.1.0 | 已安装 |

## 可选替代

- 会话导出：DSH 内置 /export（session-log-download），可能不需要 export-session。
- 语音输入：官方 @deepseek-ai/dsh-experimental-voice-input-bundle，已启用。
