function github_pull_request_is_open() {
  if ! (github_pull_request_state "$1" | grep -q "^open$"); then
    echo "Pull request is not open: $1"
    return 1
  fi
}
