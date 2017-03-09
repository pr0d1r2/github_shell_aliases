function github_pull_failed_build_urls() {
  local github_pull_failed_build_urls_CREDENTIALS=`github_api_credentials` || return $?
  local github_pull_failed_build_urls_PARAM

  for github_pull_failed_build_urls_PARAM in $@
  do
    github_is_pull_request $github_pull_failed_build_urls_PARAM
    if [ $? -eq 0 ]; then
      local github_pull_failed_build_urls_REPO_PATH=`echo $github_pull_failed_build_urls_PARAM | cut -f 4-5 -d /`
      local github_pull_failed_build_urls_REPO_URL="https://api.github.com/repos/$github_pull_failed_build_urls_REPO_PATH"

      local github_pull_failed_build_urls_PULL_REQUEST_NUMBER=`basename $github_pull_failed_build_urls_PARAM`

      local github_pull_failed_build_urls_STATUSES_URL=`curl \
        -u $github_pull_failed_build_urls_CREDENTIALS \
        -i "$github_pull_failed_build_urls_REPO_URL/pulls/$github_pull_failed_build_urls_PULL_REQUEST_NUMBER" 2>/dev/null | \
          grep statuses_url | \
          grep -v 'statuses/{sha}' | \
          cut -f 4 -d '"'`
      local github_pull_failed_build_urls_STATUS_REF=`basename $github_pull_failed_build_urls_STATUSES_URL`

      curl \
        -u $github_pull_failed_build_urls_CREDENTIALS \
        -i "$github_pull_failed_build_urls_REPO_URL/commits/$github_pull_failed_build_urls_STATUS_REF/status" 2>/dev/null | \
          grep target_url | \
          cut -f 4 -d '"'
    fi
  done
}
