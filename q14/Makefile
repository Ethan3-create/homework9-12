all: report.txt

# 最终产物：依赖脚本 + 模板 + 中间数据
report.txt: build_report.py report.md stats.txt
	python3 build_report.py

# 中间产物：依赖脚本 + 原始数据
stats.txt: stats.py data.csv
	python3 stats.py

clean:
	rm -f stats.txt report.txt

.PHONY: all clean
