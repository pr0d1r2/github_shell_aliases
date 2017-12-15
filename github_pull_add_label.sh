# Example usage:
#   github_pull_add_label https://github.com/myorg/myproject/pull/8472 Verticalization
function github_pull_add_label() {
  github_is_pull_request $1 || return $?
  curl \
    -XPOST \
    -u `github_api_credentials` \
    -i "`github_api_url_from_pull_request $1`/issues/`basename $1`/labels" \
    -d "[\"$2\"]" || return $?
}
