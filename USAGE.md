# Usage Guide
English

## Commands

### `interactive`
Launch the menu-driven interface. Best for first-time users.

```bash
gl-pr-analyzer interactive
```

### `search`
Search for merge requests and commits.

```bash
# basic
gl-pr-analyzer search "query"

# with AI analysis (English output)
gl-pr-analyzer search "query" --analyze

# with AI analysis (Chinese output)
gl-pr-analyzer search "query" --analyze -cn

# options
--repo, -r       Target project path (default: auto-detect from git remote)
--months, -m     Months to look back (default: 3)
--min-score      Minimum match score (default: 30)
--max-results    Maximum number of results (default: 20)
--analyze, -a    Enable AI analysis
--show-diff, -d  Show code changes
--save-json      Save matched MRs as JSON datasets
--output-dir     Directory for JSON files (default: gl_pr_exports)
```

### `collect`
Collect statistics (open/merged MRs, commits).

```bash
gl-pr-analyzer collect --months 6 --save-json --output-dir ./exports
```

### `traverse`
Batch analyze recent merge requests for reports.

```bash
gl-pr-analyzer traverse --days 7 --save-json
gl-pr-analyzer traverse --days 7 --save-json -cn
```

### `view-pr` / `view-commit`
View details of a specific item.

```bash
gl-pr-analyzer view-pr 1024 --analyze --output-dir ./exports   # JSON export enabled by default
gl-pr-analyzer view-commit <SHA>
```

### JSON Export Notes
- `view-pr` writes a JSON file automatically unless `--no-save-json` is supplied.
- `collect`, `search`, and `traverse` export the MRs they touch when `--save-json` is present.
- Files are saved under `gl_pr_exports/` by default and contain MR metadata, commits, per-file diffs, and discussion notes.

## Configuration

The tool is configured via environment variables:

- **`GITLAB_HOST`**: GitLab instance base URL. Required.
- **`GITLAB_TOKEN`**: Personal Access Token with `read_api` or `api` scope. Required.
- **`GITLAB_INSTANCE_NAME`**: display name in banner (default: `GitLab`).
- **`CURSOR_AGENT_PATH`**: path to `cursor-agent` executable. Required for `--analyze`.


