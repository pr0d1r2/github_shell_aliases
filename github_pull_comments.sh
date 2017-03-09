function github_pull_comments() {
  github_is_pull_request $1 || return $?
  curl \
    -u `github_api_credentials` \
    -i "`github_api_url_from_pull_request $1`/pulls/`basename $1`/comments"
}
