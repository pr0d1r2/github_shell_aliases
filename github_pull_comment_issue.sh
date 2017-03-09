# Example usage:
#   github_pull_comment_issue https://github.com/myorg/myproject/pull/8472 My comment under the pull request which is actually an issue
function github_pull_comment_issue() {
  github_is_pull_request $1 || return $?
  curl \
    -XPOST \
    -u `github_api_credentials` \
    -i "`github_api_url_from_pull_request $1`/issues/`basename $1`/comments" \
    -d "{\"body\": \"`echo $@ | cut -f2- -d ' '`\"}" || return $?
}
