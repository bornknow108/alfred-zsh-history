#!/usr/bin/env zsh
source ~/.zshrc
fc -R
TRIM_KEYWORD="$(echo "{query}" | sed -e 's/^ *$//g')"
TRIM_KEYWORD="$(echo "$TRIM_KEYWORD" | sed -e 's/ *$//g')"
HISTORY_COMMAND="history -n 1 | grep -e "$(echo "$TRIM_KEYWORD" | sed -e 's/  */ | grep -e /g')
LIST="$(eval $HISTORY_COMMAND)"
COUNT=0
echo "<?xml version=\"1.0\"?><items>"
while read line
do
    echo "<item uid=\"history$COUNT\" arg=\"$line\">"
    echo "<title>$line</title>"
    echo "<subtitle>Open Terminal Application</subtitle>"
    echo "<icon>icon.png</icon>"
    echo "</item>"
    COUNT=$((COUNT + 1))
done<<END
$LIST
END
echo "</items>"
