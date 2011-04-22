URL=$(grep $1$2 plugins.list)
redo-ifchange $1.stamp
git clone $URL bundle/$1
