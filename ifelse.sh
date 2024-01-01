#!/usr/local/Cellar/bash/5.2.21/bin/bash
#echo $0    #  to view absolute path
if [ "${1,,}" = "herbert" ]; then # Converts $1 to lowercase for case-insensitive comparison
    echo "Oh, you're the boss here. Welcome!"
elif [ "${1,,}" = "help" ]; then
    echo "Just enter your username, duh!"
else
    echo "I don't know who you are. But you're not the boss of me!"
fi
