redo-always
if [ -d bundle/$1/.git ]
then
    (cd bundle/$1/; git pull) | redo-stamp
fi
