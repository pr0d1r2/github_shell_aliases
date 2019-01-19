# Create pull request on GitHub
#
# Example usage:
#   gpr
#
# If you set up `github_user` function with your GitHub user inside
# it  will be automatically set as an pull request Assignee.
function gpr() {
  local gpr_GITHUB_USER
  ensure_command git || return $?
  ensure_command hub || return $?
  gpr_GITHUB_USER="$(github_user 2>/dev/null)"
  if [ -n "$gpr_GITHUB_USER" ]; then
    hub pull-request --push || return $?
  else
    hub pull-request --push -a "$gpr_GITHUB_USER" || return $?
  fi
}
