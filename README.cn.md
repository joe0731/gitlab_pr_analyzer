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

## 推荐（可选）

- **GitLab CLI（glab）**：推荐安装以获得更快/更完整的 diff
  - 安装后需要认证：`glab auth login`

## 安装 GitLab CLI（glab）

- **macOS（Homebrew）**：

```bash
brew install glab
glab auth login
```

- **Linux（APT，Ubuntu/Debian）**：

```bash
sudo apt update
sudo apt install -y glab
glab auth login
```

- **Windows（Winget）**：

```powershell
winget install --id GitLab.glab
glab auth login
```

可选（启用 AI）：

```bash
export CURSOR_AGENT_PATH="/path/to/cursor-agent"
```

## 快速开始

```bash
glpa check

glpa interactive

glpa search "payment bugfix"
glpa search "payment bugfix" --ai -cn -r group/subgroup/project

glpa view-pr 1024 --ai -r group/subgroup/project
glpa traverse --days 7 --save-json -r group/subgroup/project
```

详细参数请看 [USAGE.cn.md](USAGE.cn.md)。

> 日常使用建议：用短命令 `glpa`（兼容旧命令 `gl-pr-analyzer`、`gl-pr-ai`）。


