function github_pull_failed_build_urls() {
  local github_pull_failed_build_urls_PARAM

  for github_pull_failed_build_urls_PARAM in $@
  do
    github_is_pull_request $github_pull_failed_build_urls_PARAM
    if [ $? -eq 0 ]; then
      curl \
        -u `github_api_credentials` \
        -i "`github_api_url_from_pull_request $github_pull_failed_build_urls_PARAM`/commits/`github_pull_last_hash $github_pull_failed_build_urls_PARAM`/statuses" 2>/dev/null | \
          grep -A 2 '"state": "failure"' | \
          grep target_url | \
          cut -f 4 -d '"'
    fi
  done
}
