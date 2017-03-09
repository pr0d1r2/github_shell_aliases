function github_pull_last_hash() {
  github_is_pull_request $1 || return $?
  if [ $? -eq 0 ]; then
    local github_pull_last_hash_STATUSES_URL=`curl \
      -u \`github_api_credentials\` \
      -i "\`github_api_url_from_pull_request $1\`/pulls/\`basename $1\`" 2>/dev/null | \
      grep statuses_url | \
      grep -v 'statuses/{sha}' | \
      cut -f 4 -d '"'`

    basename $github_pull_last_hash_STATUSES_URL
  fi
}
