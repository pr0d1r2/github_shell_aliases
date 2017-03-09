function github_pull_last_hash() {
  github_is_pull_request $1 || return $?
  if [ $? -eq 0 ]; then
    local github_pull_last_hash_CREDENTIALS=`github_api_credentials` || return $?
    local github_pull_last_hash_REPO_PATH=`echo $1 | cut -f 4-5 -d /`
    local github_pull_last_hash_REPO_URL="https://api.github.com/repos/$github_pull_last_hash_REPO_PATH"

    local github_pull_last_hash_PULL_REQUEST_NUMBER=`basename $1`

    local github_pull_last_hash_STATUSES_URL=`curl \
      -u $github_pull_last_hash_CREDENTIALS \
      -i "$github_pull_last_hash_REPO_URL/pulls/$github_pull_last_hash_PULL_REQUEST_NUMBER" 2>/dev/null | \
      grep statuses_url | \
      grep -v 'statuses/{sha}' | \
      cut -f 4 -d '"'`

    basename $github_pull_last_hash_STATUSES_URL
  fi
}
