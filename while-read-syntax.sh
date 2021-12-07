# Basic while read syntax in bash
while read var; do
    <do stuff>
done <<< $(cat file|<results of some command>)
