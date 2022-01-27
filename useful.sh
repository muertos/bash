# Useful Bash

# prepend info to the start of a file
# hard-coded example, but nice to reference

for filepath in operators_manual/**/*.rst; do
  file=$(basename $filepath)
  echo -e ".. _${file%.rst}:\n\n$(cat $filepath)" > $filepath
done
