# Get raw GitHub API response about all opened pull requests created by you
#
# Usage:
#   github_pull_requests_raw org/project
function github_pull_requests_raw() {
  local github_pull_requests_raw_PAGE=1
  local github_pull_requests_raw_RESULTS=100
  while [ $github_pull_requests_raw_RESULTS -eq 100 ]
  do
    local github_pull_requests_raw_RESULT=`
      curl \
        -u \`github_api_credentials\` \
        -i "https://api.github.com/repos/$1/issues?per_page=100&page=$github_pull_requests_raw_PAGE&state=open&creator=\`github_username\`"
    `
    echo $github_pull_requests_raw_RESULT
    github_pull_requests_raw_RESULTS=`echo $(echo $github_pull_requests_raw_RESULT | grep git_url | wc -l)`
    github_pull_requests_raw_PAGE=`expr $github_pull_requests_raw_PAGE + 1`
  done
}
