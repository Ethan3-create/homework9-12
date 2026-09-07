# ai_log.md
1. 核心提示：--name 纯空白时 main 需以 SystemExit(2) 结束；只改 cli.py；用 argparse type 校验。
2. 智能体改动：新增 _non_blank 校验并挂到 --name 的 type 参数。
3. 人工检查：git diff 仅 cli.py 一处改动，无无关修改。
4. 测试结果：修复前 1 failed（红），修复后 1 passed（绿）。
5. 人工验证：sdt-greet --name "   " 退出码 2；正常参数仍输出 Hello, 25020007025!
