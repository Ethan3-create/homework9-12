#!/usr/bin/env bash
# 第 13 题：本地质量门禁 —— 格式检查 → 静态检查 → 测试
set -euo pipefail
cd "$(dirname "$0")"

echo "==> ruff format --check"
.venv/bin/ruff format --check .

echo "==> ruff check"
.venv/bin/ruff check .

echo "==> pytest"
.venv/bin/python -m pytest

echo "==> ALL CHECKS PASSED"
