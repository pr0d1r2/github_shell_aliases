# Get links for all opened pull requests created by you
#
# Usage:
#   github_pull_request_links org/project
function github_pull_request_links() {
  local github_pull_request_links_LINK
  local github_pull_request_links_PROJECT
  for github_pull_request_links_PROJECT in $@
  do
    github_pull_requests_raw $github_pull_request_links_PROJECT 2>/dev/null | \
      grep html_url | \
      grep '/pull/' | \
      cut -f 4 -d '"' | \
      sort | \
      uniq
  done
}
