function github_sync_project() {
  case $1 in
    git://github.com/*/*.git)
      local github_sync_project_PROJECT=`echo $1 | sed -e 's|^git://github.com/||' -e 's|.git$||' -e "s|^\`github_username\`/||"`
      ;;
  esac
  echorun github_clone $github_sync_project_PROJECT || return $?
}
