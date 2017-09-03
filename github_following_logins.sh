function github_following_logins() {
  github_following_raw 2>/dev/null | grep '"login"' | cut -f 4 -d '"'
}
