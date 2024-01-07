#!/usr/local/Cellar/bash/5.2.21/bin/bash  

echo hello
echo $SHELL # Displaying the current shell

NICK_NAME=Avy
echo $NICK_NAME

echo What is your real name?
read realname  # Capture user input for realname
echo Your real name is: $realname

echo $1  ## Display the first argument passed to the script

echo "Here, I am executing a command with pipe, grabbing files like 'hello':"
ls -l | grep hello  # Pipe command to list files and filter by 'hello'

echo testing >  hello.txt # For inserting text into hello.txt // this removes anything from the file and replace it with this
echo testing done  >> hello.txt # For appending text to hello.txt 
cat hello.txt
echo -n "Word count in hello.txt: "; wc -w < hello.txt
#echo -n "Word count in hello.txt: "; wc -w < hello.txt | tr -s "  "

echo "count: "$(wc -w <<< "hello there this couts to 6")| tr -s "  "
echo $? #exit code of the program





