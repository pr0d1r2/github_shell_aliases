function github_switch_to_https() {
  test -f .git/config || return $?
  if ! (grep -qE 'url = https://github' .git/config); then
    sed -i old "s|git@github.com:|https://github.com/|g" .git/config
  fi
  grep url .git/config
}
