# Create pull request on GitHub
#
# Example usage:
#   gpr
function gpr() {
  ensure_command git || return $?
  ensure_command hub || return $?
  hub pull-request --push || return $?
}
