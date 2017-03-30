# Show GitHub pull requests links for PRs with branch
# Usually it will be a single link
#
# Usage:
#   github_pull_request_links_with_branch org/project branch
function github_pull_request_links_with_branch() {
  github_pull_requests_with_branch_raw $@ 2>/dev/null | grep '"href": ' | grep '/pull/' | cut -f 4 -d '"'
}
