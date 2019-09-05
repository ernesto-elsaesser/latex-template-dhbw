#!/bin/sh

# $1 - template name
# $2 - clean | full | update

CONTENTDIR=`pwd`
export TEXINPUTS="$CONTENTDIR:$TEXINPUTS"
export BIBINPUTS="$CONTENTDIR:$BIBINPUTS"

cd "$(dirname "$0")"

if [ "$2" == "clean" ]; then
    rm -rf out
fi

if [ ! -d out ]; then
    mkdir out
fi

if [ "$2" == "clean" ] || [ "$2" == "full" ]; then
    texfot xelatex -halt-on-error -output-directory out $1
    if [ $? -ne 0 ]; then
        exit $?
    fi
    makeglossaries -s out/$1.ist out/$1 # assumes usage of makeindex, adjust extension if using xindy
    bibtex out/$1
    xelatex -output-directory out $1 > /dev/null
    xelatex -output-directory out $1 > /dev/null
fi
texfot xelatex -output-directory out $1

cp "out/$1.pdf" "$CONTENTDIR/$1.pdf"
