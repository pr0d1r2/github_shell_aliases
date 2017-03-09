function github_pull_failed_build_urls() {
  local github_pull_failed_build_urls_CREDENTIALS=`github_api_credentials` || return $?
  local github_pull_failed_build_urls_PARAM

  for github_pull_failed_build_urls_PARAM in $@
  do
    github_is_pull_request $github_pull_failed_build_urls_PARAM
    if [ $? -eq 0 ]; then
      local github_pull_failed_build_urls_STATUS_REF=`github_pull_last_hash $github_pull_failed_build_urls_PARAM`

      curl \
        -u $github_pull_failed_build_urls_CREDENTIALS \
        -i "$github_pull_failed_build_urls_REPO_URL/commits/$github_pull_failed_build_urls_STATUS_REF/status" 2>/dev/null | \
          grep target_url | \
          cut -f 4 -d '"'
    fi
  done
}
