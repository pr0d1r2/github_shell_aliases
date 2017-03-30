# Get raw GitHub API response about pull request
#
# Usage:
#   github_pull_request_raw https://github.com/org/project/pull/8472
function github_pull_request_raw() {
  local github_pull_request_raw_PROJECT=`echo $1 | cut -f 4-5 -d /`
  local github_pull_request_raw_PULL=`echo $1 | cut -f 7 -d /`

  curl \
    -u `github_api_credentials` \
    -i "https://api.github.com/repos/$github_pull_request_raw_PROJECT/pulls/$github_pull_request_raw_PULL"
}
