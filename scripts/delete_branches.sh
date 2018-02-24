for branch in $(git for-each-ref --shell | awk '!/master/ && !/development/ && /head/ {print $3}')
do
  echo "Delete ${branch}"
  git branch -D $branch
done
