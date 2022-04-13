#!/bin/sh
# I add lots of comments so I can remember why I did what I did when I don't 
# look at these things for months.
# Create an open command in the path $HOME/bin/commands/ and
# also add an entry to the end of .aliasrc which is reused in .zshrc or .bashrc
# This allows e.g. 'openappledev.command' that can be used from spotlight to quickly 
# open a browser.

# Basic check that we have two parameters
if [ "$#" -ne 2 ]; then 
  echo "usage createlink.sh <commandname> <url>"
  exit 1
fi

# Capture the command name and url
readonly command="$1"
readonly url="$2"

# Append to the alias file ~/.aliasrc that exists for me
aliasrc_path="${HOME}/.aliasrc"
entry="alias open$command=\"open '$url'\""
echo "$entry" >> "$aliasrc_path"

# Create the command file
command_path="${HOME}/bin/commands"
command_name="open${command}.command"
command_file="$command_path/$command_name"

# Currently missing a check for existing as I am assuming I am wanting
# to overwrite it.
echo "open '$url'" > "$command_file"
chmod +x "$command_file"