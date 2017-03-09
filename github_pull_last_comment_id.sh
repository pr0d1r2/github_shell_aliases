function github_pull_last_comment_id() {
  github_is_pull_request $1 || return $?
  curl \
    -u `github_api_credentials` \
    -i "`github_api_url_from_pull_request $1`/pulls/`basename $1`/comments" 2>/dev/null | \
      grep '^    "id":' | \
      cut -f 2 -d : | \
      cut -f 1 -d , | \
      sed -e "s/^ //g" | \
      sort | \
      tail -n 1
}
