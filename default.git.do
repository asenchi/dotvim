URL=$(grep $1$2 plugins.list)
redo-ifchange $1.stamp

if [ ! -d bundle/$1 ]
then git clone $URL bundle/$1
fi
