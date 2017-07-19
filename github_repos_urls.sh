function github_repos_urls() {
  github_repos_raw $@ 2>/dev/null | grep git_url | cut -f 4 -d '"'
}
