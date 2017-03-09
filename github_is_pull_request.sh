function github_is_pull_request() {
  case $1 in
    https://github.com/*/*/pull/[1-9] | \
    https://github.com/*/*/pull/[1-9][0-9] | \
    https://github.com/*/*/pull/[1-9][0-9][0-9] | \
    https://github.com/*/*/pull/[1-9][0-9][0-9][0-9] | \
    https://github.com/*/*/pull/[1-9][0-9][0-9][0-9][0-9] | \
    https://github.com/*/*/pull/[1-9][0-9][0-9][0-9][0-9][0-9])
      return 0
      ;;
  esac
  return 1
}
