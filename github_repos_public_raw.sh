function github_repos_public_raw() {
  local github_repos_public_raw_GITHUB_USER
  local github_repos_public_raw_PAGE
  local github_repos_public_raw_RESULTS
  local github_repos_public_raw_RESULT
  github_repos_public_raw_PAGE=1
  github_repos_public_raw_RESULTS=100
  case $1 in
    "")
      github_repos_public_raw_GITHUB_USER="$(github_username)"
      ;;
    *)
      github_repos_public_raw_GITHUB_USER="$1"
      ;;
  esac
  while [ $github_repos_public_raw_RESULTS -eq 100 ]
  do
    github_repos_public_raw_RESULT=$(
      curl \
      -u "$(github_api_credentials)" \
      -i "https://api.github.com/users/$github_repos_public_raw_GITHUB_USER/repos?per_page=100&page=$github_repos_public_raw_PAGE"
    )
    echo "$github_repos_public_raw_RESULT"
    github_repos_public_raw_RESULTS=$(echo $(echo "$github_repos_public_raw_RESULT" | grep -c git_url))
    github_repos_public_raw_PAGE=$((github_repos_public_raw_PAGE + 1))
  done
}
