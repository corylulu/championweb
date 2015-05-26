defaultmsg="updated data"
read -p "Please enter a git message (default : '$defaultmsg'):" gitmsg
if ["$gitmsg" == ""]; then
	gitmsg="$defaultmsg"
fi
echo $gitmsg

mongodump --db leaguetimes --collection championdatas --out ./db
mongodump --db leaguetimes --collection championmatchups --out ./db
mongodump --db leaguetimes --collection championroles --out ./db
mongodump --db leaguetimes --collection roles --out ./db
mongodump --db leaguetimes --collection stattables --out ./db
mongodump --db leaguetimes --collection summaries --out ./db

grunt production

git add -A && git commit -m "$gitmsg" && git push origin master
