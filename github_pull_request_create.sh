# Create pull request
#
# Example usage:
#   github_pull_request_create "the title of pull request" "the body of pull request" v13n-8472-xxx
# or (will detect current branch and make an PR without body):
#   github_pull_request_create "the title of pull request" "the body of pull request"
function github_pull_request_create() {
  local github_pull_request_create_BRANCH
  case $1 in
    "")
      echo "Please provide title as the first parameter!"
      return 101
      ;;
  esac
  case $2 in
    "")
      echo "Please provide description as the second parameter!"
      return 102
      ;;
  esac
  case $3 in
    "")
      github_pull_request_create_BRANCH="$(git_current_branch)" || return $?
      ;;
    *)
      github_pull_request_create_BRANCH="$3"
      ;;
  esac
  ensure_command jshon || return $? ##Darwin
  curl \
    -XPOST \
    -u "$(github_api_credentials)" \
    -i "https://api.github.com/repos/$(github_repo_user)/$(github_repo_name)/pulls" \
    -d "{\"title\": \"$1\", \"body\": $(jshon -s "$2"), \"head\": \"$(github_repo_user):$github_pull_request_create_BRANCH\", \"base\": \"master\"}" \
    2>/dev/null | grep '"html_url": "' | grep pull | cut -f 4 -d '"' || return $?
}
