## GitLab MR & Commit Analyzer

中文

这是一个命令行工具，用于收集、搜索、查看并可选用 `cursor-agent` 做 AI 总结，目标是让 GitLab 版本的使用体验与 GitHub 版本保持一致。

## 安装

```bash
pip install gitlab-pr-analyzer
```

## 配置

必填环境变量：

```bash
export GITLAB_HOST="https://gitlab.example.com"
export GITLAB_TOKEN="glpat-xxxxxxxxxxxxxxxxxxxx"
```

可选（启用 AI）：

```bash
export CURSOR_AGENT_PATH="/path/to/cursor-agent"
```

## 快速开始

```bash
gl-pr-analyzer interactive

gl-pr-analyzer search "payment bugfix"
gl-pr-analyzer search "payment bugfix" --analyze -cn

gl-pr-analyzer view-pr 1024 --analyze
gl-pr-analyzer traverse --days 7 --save-json
```

详细参数请看 [USAGE.cn.md](USAGE.cn.md)。


