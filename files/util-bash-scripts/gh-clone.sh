
## TODO:  route input/output to login
#gh auth login

mkdir -p ~/Projects

gh repo list liquidxinc --limit 4000 | while read -r repo _; do
  cd ~/Projects
  gh repo clone "$repo" "$repo"
done

