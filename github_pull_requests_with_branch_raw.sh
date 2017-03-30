# Get raw GitHub API response about all opened pull requests with branch
#
# Usage:
#   github_pull_requests_with_branch_raw org/project branch
function github_pull_requests_with_branch_raw() {
  local github_pull_requests_with_branch_raw_PAGE=1
  local github_pull_requests_with_branch_raw_RESULTS=100
  while [ $github_pull_requests_with_branch_raw_RESULTS -eq 100 ]
  do
    local github_pull_requests_with_branch_raw_RESULT=`
      curl \
        -u \`github_api_credentials\` \
        -i "https://api.github.com/repos/$1/pulls?per_page=100&page=$github_pull_requests_with_branch_raw_PAGE&head=toptal:$2"
    `
    echo $github_pull_requests_with_branch_raw_RESULT
    github_pull_requests_with_branch_raw_RESULTS=`echo $(echo $github_pull_requests_with_branch_raw_RESULT | grep git_url | wc -l)`
    github_pull_requests_with_branch_raw_PAGE=`expr $github_pull_requests_with_branch_raw_PAGE + 1`
  done
}

