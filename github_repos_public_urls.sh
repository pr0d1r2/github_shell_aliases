# Returns public repos URLs for GitHub users or organizations
#
# Example usage:
#   github_repos_public_urls pr0d1r2
function github_repos_public_urls() {
  github_repos_public_raw $* 2>/dev/null | grep git_url | cut -f 4 -d '"'
}
