exec >&2
rm -rf autoload temp.*
TMPDIR=$(mktemp -d ./temp.XXXX)
git clone https://github.com/tpope/vim-pathogen.git $TMPDIR/$1
mv $TMPDIR/$1/autoload ./
rm -rf $TMPDIR
