#!/bin/bash
# Commit and push for some repo with some yor comment.
# Attention! Before change repo and before run this script you should pull latest version of repo.
# 1st argument: your repository; it may be path, full path or direcotry name (default: current directory)
# 2nd argument: your comment for commit without spaces (optional argument, default: update_with_script)
# Examples of run:
# ./commpush.sh ~/repos/myrepo My_super_change
# or
# ./commpush.sh ../myrepo My_comment_for_commit_one_word
# or
# ./commpush.sh ../myrepo
# or (just commit and push current repository with default comment):
# ./commpush.sh
# Let's go:

export REP=${1}
export COMMENT=${2}

if [ "${REP}" = "" ]; then
 export REP="./"
fi

if [ "${COMMENT}" = "" ]; then
 export COMMENT="update_with_script"
fi

echo
echo "##### Commit and push to ${REP} repository: #####"
cd ${REP} && git status && git add -A && git status && git commit -am ${COMMENT} && git push && git status && git pull && echo "${REP} repository has been successfully updated." && echo && echo "########## ${REP} commit and push: OK ##########"

echo
echo Done.
echo


