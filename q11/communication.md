# 空姓名仍输出问候语

## Issue
- 环境：Ubuntu 24.04（WSL2），Python 3.12.3，greetlab 0.1.0；Windows 待确认。
- 复现命令：sdt-greet --name " "
- 期望结果：拒绝空白姓名，以 SystemExit(2) 退出。
- 实际结果：输出 "Hello, !"，并以 0 退出。

## 提交信息
拒绝空白姓名参数

--name 为空白时仍输出问候语并以 0 退出。
修复：为 --name 增加 type 校验（_non_blank），空白值抛
ArgumentTypeError，以退出码 2 终止。

## 评审意见（Suggestion）
- 具体行为：现有测试仅覆盖 ASCII 空格，tab、全角空格等变体未覆盖。
- 风险：strip() 能处理这些字符，但缺回归测试，改动易悄悄破坏校验。
- 建议动作：在 tests/test_cli.py 中补充参数化测试（"\t"、"\u3000"）。
