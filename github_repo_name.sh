function github_repo_name() {
  git remote -v | \
    grep "github\.com" | \
    grep push | \
    cut -f 2 | \
    cut -f 1 -d ' ' | \
    sed -e 's/github\.com\//|/g' -e 's/github\.com:/|/g' | \
    cut -f 2 -d '|' | \
    cut -f 1 -d . | \
    cut -f 2 -d /
  return $?
}
