function github_pull_request_state() {
  github_pull_request_raw "$1" 2>/dev/null | grep '"state": ' | cut -d '"' -f 4
  return $?
}
