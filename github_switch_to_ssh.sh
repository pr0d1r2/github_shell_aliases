function github_switch_to_ssh() {
  test -f .git/config || return $?
  if ! (grep -qE 'url = git@github.com:' .git/config); then
    sed -i old "s|https://github.com/|git@github.com:|g" .git/config
  fi
  grep url .git/config
}
