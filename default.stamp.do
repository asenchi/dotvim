redo-always
if [ -d bundle/$1/.git ]
then (cd bundle/$1/; git fetch origin --dry-run) | redo-stamp
fi
