# Create pull request on GitHub
#
# Example usage:
#   gpr
#
# If you set up `github_user` function with your GitHub user inside
# it  will be automatically set as an pull request Assignee.
#
# If you set up `github_pr_labels` function with your GitHub labels
# mapped to your projects they will be automatically applied.
function gpr() {
  local gpr_GITHUB_USER
  local gpr_GITHUB_LABELS
  local gpr_HUB_PARAMS
  ensure_command git || return $?
  ensure_command hub || return $?
  gpr_GITHUB_USER="$(github_user 2>/dev/null)"
  gpr_GITHUB_LABELS="$(github_pr_labels 2>/dev/null)"
  if [ -n "$gpr_GITHUB_USER" ]; then
    gpr_HUB_PARAMS="-a '$gpr_GITHUB_USER'"
  fi
  if [ -n "$gpr_GITHUB_LABELS" ]; then
    gpr_HUB_PARAMS="-l '$gpr_GITHUB_LABELS'"
  fi
  hub pull-request -o --push $gpr_HUB_PARAMS || return $?
}
