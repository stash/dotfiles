awsume() {
  if [ -z "$1" ]; then
    echo "Usage: awsume <profile-name>"
    return 1
  fi
  eval "$(aws configure export-credentials --profile "$1" --format env)"
}
