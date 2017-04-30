# Get links for all opened pull requests
#
# Usage:
#   github_pull_request_links_all org/project
function github_pull_request_links_all() {
  local github_pull_request_links_all_LINK
  local github_pull_request_links_all_PROJECT
  for github_pull_request_links_all_PROJECT in $@
  do
    github_pull_requests_all_raw $github_pull_request_links_all_PROJECT 2>/dev/null | \
      grep html_url | \
      grep '/pull/' | \
      cut -f 4 -d '"' | \
      sort | \
      uniq
  done
}
