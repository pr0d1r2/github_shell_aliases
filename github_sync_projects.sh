function github_sync_projects() {
  local github_sync_projects_PROJECT
  for github_sync_projects_PROJECT in `github_repos_public_urls`
  do
    github_sync_project $github_sync_projects_PROJECT || return $?
  done
  for github_sync_projects_PROJECT in `github_repos_urls`
  do
    github_sync_project $github_sync_projects_PROJECT || return $?
  done
}
