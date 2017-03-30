# Show branch for pull request
#
# Usage:
#   github_pull_request_branch https://github.com/org/project/pull/8472
function github_pull_request_branch() {
  github_pull_request_raw $1 2>/dev/null | \
    grep '"ref":' | \
    grep -v master | \
    cut -f 4 -d '"'
}
