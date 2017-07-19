function github_repos_raw() {
  local github_repos_raw_PAGE=1
  local github_repos_raw_RESULTS=100
  case $1 in
    "")
      local github_repos_raw_URL="https://api.github.com/user/repos"
      ;;
    *)
      local github_repos_raw_URL="https://api.github.com/users/$1/repos"
      ;;
  esac
  while [ $github_repos_raw_RESULTS -eq 100 ]
  do
    local github_repos_raw_RESULT=`
      curl \
        -u \`github_api_credentials\` \
        -i "$github_repos_raw_URL?per_page=100&page=$github_repos_raw_PAGE"
    `
    echo $github_repos_raw_RESULT
    github_repos_raw_RESULTS=`echo $(echo $github_repos_raw_RESULT | grep git_url | wc -l)`
    github_repos_raw_PAGE=`expr $github_repos_raw_PAGE + 1`
  done
}
