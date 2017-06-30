function github_open() {
  local github_open_ADDRESS=`git remote -v | grep fetch | sed -e 's|github.com:|github.com/|g' | cut -f 2 -d @ | cut -f 1-2 -d .`
  local github_open_COMMAND="open https://$github_open_ADDRESS/tree/master/{}"
  parallel \
    "echo '$github_open_COMMAND' && $github_open_COMMAND" \
    ::: \
    $@
  return $?
}
