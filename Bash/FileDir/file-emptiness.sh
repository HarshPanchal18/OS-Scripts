read -p "Enter Filename: " file1

[ test -s $file1 ] && echo "Non-empty" || echo "Empty"
