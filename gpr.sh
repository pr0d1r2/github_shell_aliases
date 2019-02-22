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
#
# If you set up `github_pr_comments` function with your GitHub comments
# mapped to projects and specific file (for example to comment with command
# to run specific CI checks if specific files change)
function gpr() {
  local gpr_GITHUB_USER
  local gpr_GITHUB_LABELS
  local gpr_GITHUB_COMMENTS
  local gpr_HUB_PARAMS
  local gpr_HUB_OUTPUT
  local gpr_GITHUB_PR_LINK
  local gpr_LAST_COMMIT_MESSAGE
  local gpr_PR_TEMPLATE
  ensure_command git || return $?
  ensure_command hub || return $?
  gpr_GITHUB_USER="$(github_user 2>/dev/null)"
  gpr_GITHUB_LABELS="$(github_pr_labels 2>/dev/null)"
  gpr_GITHUB_COMMENTS="$(github_pr_comments 2>/dev/null)"
  if [ -n "$gpr_GITHUB_USER" ]; then
    gpr_HUB_PARAMS="-a $gpr_GITHUB_USER"
  fi
  if [ -n "$gpr_GITHUB_LABELS" ]; then
    gpr_HUB_PARAMS="$gpr_HUB_PARAMS -l $gpr_GITHUB_LABELS"
  fi
  if [ -f .github/PULL_REQUEST_TEMPLATE.md ]; then
    gpr_LAST_COMMIT_MESSAGE=$(git log -1 --pretty=%B)
    gpr_PR_TEMPLATE="/tmp/.gpr-$$-pr-template.md"
    echo "$gpr_LAST_COMMIT_MESSAGE" > "$gpr_PR_TEMPLATE"
    echo >> "$gpr_PR_TEMPLATE"
    cat ".github/PULL_REQUEST_TEMPLATE.md" >> "$gpr_PR_TEMPLATE"
    gpr_HUB_PARAMS="$gpr_HUB_PARAMS -F $gpr_PR_TEMPLATE"
  fi
  gpr_HUB_OUTPUT="$(hub pull-request --no-edit --push $gpr_HUB_PARAMS)" || return $?
  if [ -n "$gpr_PR_TEMPLATE" ]; then
    rm -f "$gpr_PR_TEMPLATE"
  fi
  gpr_GITHUB_PR_LINK="$(echo "$gpr_HUB_OUTPUT" | grep "^https://github.com/" | grep "/pull/")"
  echo "$gpr_HUB_OUTPUT" || return $?
  if [ -n "$gpr_GITHUB_COMMENTS" ]; then
    github_pull_comment_issue "$gpr_GITHUB_PR_LINK" "$gpr_GITHUB_COMMENTS" || return $?
  fi
  open "$gpr_GITHUB_PR_LINK" || return $?
}
