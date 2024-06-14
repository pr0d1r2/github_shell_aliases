function rg_codeowners() {
  rg "$@" -l | parallel codeowners
}
