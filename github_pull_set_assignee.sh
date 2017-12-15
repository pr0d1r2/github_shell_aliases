# Example usage:
#   github_pull_set_assignee https://github.com/myorg/myproject/pull/8472 pr0d1r2
function github_pull_set_assignee() {
  github_is_pull_request $1 || return $?
  curl \
    -XPOST \
    -u `github_api_credentials` \
    -i "`github_api_url_from_pull_request $1`/issues/`basename $1`/assignees" \
    -d "{\"assignees\": [\"$2\"]}" || return $?
}
