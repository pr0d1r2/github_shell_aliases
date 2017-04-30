# List branches of all pull requests
#
# github_pull_request_links_all org/project
function github_pull_requests_all_branches() {
  local github_pull_requests_all_branches_NAME
  for github_pull_requests_all_branches_NAME in `github_pull_request_links_all $@`
  do
    echo `github_pull_request_branch $github_pull_requests_all_branches_NAME`
  done
}
