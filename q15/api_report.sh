#!/bin/bash

# 使用 curl 获取数据，并用 jq 筛选和排序
DATA=$(curl -fsS http://127.0.0.1:8000/packages.json | jq -r '
  map(select(.status == "active" and .downloads >= 100)) 
  | sort_by(-.downloads, .name) 
  | map("| \(.name) | \(.version) | \(.downloads) |") 
  | join("\n")
')

# 生成 Markdown 报告
cat > summary.md << MD_EOF
# Active Packages Summary

| Name | Version | Downloads |
|------|---------|-----------|
${DATA}
MD_EOF
