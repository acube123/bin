#!/bin/bash
BASE_DIR=`dirname $0`
echo BASE_DIR is $BASE_DIR

# Update bashrc
cat $BASE_DIR/rc/bashrc >> ~/.bashrc  # Append
mkdir -p ~/.bash
# .bashrc will reference ~/.bash/git-completion.bash
# Make sure it is available.
cp $BASE_DIR/rc/git-completion.bash ~/.bash/

# Update screenrc
for rc_file in screenrc vimrc; do
  [[ -f ~/.${rc_file} ]] && mv ~/.${rc_file} ~/.${rc_file}.bak
  cat $BASE_DIR/rc/${rc_file} > ~/.${rc_file} # Overwrite
done
