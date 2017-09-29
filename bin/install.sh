#!/bin/bash
BIN_DIR=`dirname $0`
BASE_DIR=`dirname $BIN_DIR`
echo BASE_DIR is $BASE_DIR

# Update bashrc
cat $BASE_DIR/rc/bashrc >> ~/.bashrc  # Append
mkdir -p ~/.bash
# .bashrc will reference ~/.bash/git-completion.bash
# Make sure it is available.
cp $BASE_DIR/rc/git-completion.bash ~/.bash/

# Update screenrc
for rc_file in screenrc vimrc aliases; do
  [[ -f ~/.${rc_file} ]] && mv ~/.${rc_file} ~/.${rc_file}.bak
  cat $BASE_DIR/rc/${rc_file} > ~/.${rc_file} # Overwrite
done
