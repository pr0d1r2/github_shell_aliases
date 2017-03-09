function github_api_url_from_pull_request() {
  github_is_pull_request $1 || return $?
  echo "https://api.github.com/repos/`echo $1 | cut -f 4-5 -d /`"
}
