for branch in $(git branch | awk '!/master/ && !/development/ && !/*/ {print $1}')
do
  echo "Delete ${branch}"
  git branch -D $branch
done
