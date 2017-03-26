function github_repos_public_raw() {
  local github_repos_public_raw_PAGE=1
  local github_repos_public_raw_RESULTS=100
  while [ $github_repos_public_raw_RESULTS -eq 100 ]
  do
    local github_repos_public_raw_RESULT=`
      curl \
        -u \`github_api_credentials\` \
        -i "https://api.github.com/users/\`github_username\`/repos?per_page=100&page=$github_repos_public_raw_PAGE"
    `
    echo $github_repos_public_raw_RESULT
    github_repos_public_raw_RESULTS=`echo $(echo $github_repos_public_raw_RESULT | grep git_url | wc -l)`
    github_repos_public_raw_PAGE=`expr $github_repos_public_raw_PAGE + 1`
  done
}
