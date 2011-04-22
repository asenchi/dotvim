test -d bundle || mkdir bundle
DEPS=$(cat plugins.list|cut -d/ -f5)
redo-ifchange $DEPS
redo-ifchange vimrc
