# github_shell_aliases

Handy shell aliases to work with GitHub.

## Setup

Please setup function like in your private aliases:

```bash
function github_api_credentials() {
  echo "pr0d1r2:lvxm4pwml5l3gunxbiv18d2esyd4gti01bexspcl"
}
```

You may also use [shell_aliases_compiler](https://github.com/pr0d1r2/shell_aliases_compiler).

## Usage

### Get links to pull request's failing builds

```bash
github_pull_failed_build_urls https://github.com/myorg/myproject/pull/8472 https://github.com/myorg/myproject/pull/5618
```
