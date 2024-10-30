
## TODO:  route input/output to login
#gh auth login

mkdir -p ~/Projects
cd ~/Projects

gh repo list liquidxinc --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo" -- -q 2>/dev/null || (
    cd ~/Projects
    cd "$repo"
    # Handle case where local checkout is on a non-main/master branch
    # - ignore checkout errors because some repos may have zero commits,
    # so no main or master
    git checkout -q main 2>/dev/null || true
    git checkout -q master 2>/dev/null || true
    git pull -q
  )
done
