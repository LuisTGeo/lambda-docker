echo "---git add . ---"
git add .

echo "---git commit . ---"
# git commit -m "last commit 12:23pm"
git commit -m "$*"

# git commit -m "$(read -p 'Commit description: ')" 
echo "---git push . --- "
git push --set-upstream origin development