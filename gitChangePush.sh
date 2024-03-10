# logFile=$HOME/.cache/log/natapp.log
# cat $HOME/.config/.natapp.log | grep -oP 'server.natappfree.cc:\d+' | tail -1 >$HOME/.config/natapp.ip
# # echo check is commited

cd "${0:A:h}"
if [[ ! -z "$(git diff-index --name-only HEAD)" ]]; then
	git add -u
	git commit -m "$(date)"
	git remote update
	if ! git diff --quiet origin/master; then
		# echo "the branch is different!"
		git push
	fi
fi
