function github_following_raw() {
  local github_following_raw_PAGE=1
  local github_following_raw_RESULTS=100
  local github_following_raw_RESULT
  while [ $github_following_raw_RESULTS -eq 100 ]
  do
    github_following_raw_RESULT=$(
      curl \
        -u "$(github_api_credentials)" \
        -i "https://api.github.com/users/$(github_username)/following?per_page=100&page=$github_following_raw_PAGE"
    )
    echo "$github_following_raw_RESULT"
    github_following_raw_RESULTS=$(echo "$github_following_raw_RESULT" | grep -c '"login"')
    github_following_raw_PAGE=$((github_following_raw_PAGE + 1))
  done
}
