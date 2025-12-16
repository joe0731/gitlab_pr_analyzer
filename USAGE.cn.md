# 使用指南
中文

## 命令

### `check`
验证环境变量配置和 GitLab API 连通性。

```bash
# 基础检查
glpa check

# 检查某个项目的访问权限
glpa check -r group/subgroup/project

# 输出 JSON（便于自动化）
glpa check --json
```

### `interactive`
交互式菜单模式，适合第一次使用。

```bash
glpa interactive
```

### `search`
搜索 merge request 和 commits。

```bash
# 基础搜索
glpa search "query"

# 带 AI 分析（英文输出）
glpa search "query" --ai

# 带 AI 分析（中文输出）
glpa search "query" --ai -cn

# 常用参数
--repo, -r       目标项目路径（默认：从 git remote 自动识别）
--months, -m     回溯月数（默认：3）
--min-score      最小匹配分数（默认：30）
--max-results    最大返回条数（默认：20）
--ai             开启 AI 分析（需要 CURSOR_AGENT_PATH）
--show-diff, -d  展示 diff
--smart-search   启用/禁用 AI 关键词提取（需要 --ai）
--save-json      导出 JSON 数据集
--output-dir     JSON 输出目录（默认：gl_pr_exports）
```

### `collect`
收集统计信息（open/merged MR、commit 数量）。

```bash
glpa collect --months 6 --save-json --output-dir ./exports
```

### `traverse`
遍历近期 MR 并批量做 AI 分析，可自动生成报告。

```bash
glpa traverse --days 7 --save-json
glpa traverse --days 7 --save-json -cn
```

### `view-pr` / `view-commit`
查看单个条目详情。

```bash
glpa view-pr 1024 --ai --output-dir ./exports   # 默认导出 JSON，可用 --no-save-json 关闭
glpa view-commit <SHA>
```

## JSON 导出说明
- `view-pr` 默认会导出 JSON，除非传入 `--no-save-json`。
- `collect/search/traverse` 在传入 `--save-json` 时，会把触达的 MR 导出为 JSON。
- 默认输出到 `gl_pr_exports/`，内容包含 MR 元数据、commits、按文件的 diff、以及讨论 notes。

## 配置

通过环境变量配置：

- **`GITLAB_HOST`**: GitLab 实例 base URL，必填
- **`GITLAB_TOKEN`**: PAT（`read_api` 或 `api` scope），必填
- **`GITLAB_INSTANCE_NAME`**: banner 显示名（默认：`GitLab`）
- **`CURSOR_AGENT_PATH`**: `cursor-agent` 可执行文件路径，用于 `--ai`


