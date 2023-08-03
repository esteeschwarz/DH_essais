#!/bin/sh

#
# Name:       mmv (a unix/linux "multiple move" script)
# Version:    2
# Purpose:    move all the files with the first filename extension 
#             to the second extension.
# Created By: Alvin Alexander, devdaily.com
#
# Usage example 1:
#
#    mmv htm html  
#    (this renames all *.htm files to *.html)
#
# Usage example 2:
#
#    mmv PNG png  
#    (this renames all *.PNG files to *.png (effectively changing the case 
#    of all files)
#
# WARNINGS:
#
#    (1) Make a backup copy of your files and put them in a different directory
#        before using this script.
#    (2) This script may not work properly on filenames that have a space
#        in them. It worked fine on my small test on a Mac OS X system, but
#        this does not guarantee it will work properly on all systems.
#    (3) This script assumes your filenames have only one decimal (period)
#        character in the filename.
#    (4) This script only works in the current directory (which you can tell
#        from the "for" loop below).
#    (5) I have commented-out the "mv" command below and replaced it with
#        an "echo" command. Because you can lose data any time you perform a
#        move or copy operation, I strongly encourage you to run this script
#        with the echo command first, and if the output from the script looks
#        okay, then un-comment the mv command.


IFS=$'\n'

if [ -z "$1" ] || [ -z "$2" ]
then
  echo "Usage: mmv oldExtension newExtension"
  exit -1
fi

# list all files in the current directory that have the 
# first filename extension
for infile in $(ls -1 *.${1})
do

  # get the base filename by stripping off the first extension
  baseFilename=`basename "${infile}" .${1}`

  # determine the output filename by adding the second extension
  # to the base filename
  outfile="${baseFilename}.${2}"

  # tell the user what is happening
  echo "Moving \"$infile\" --> \"$outfile\" ..."

  # remove the comment below if and only if you have run this script once with just
  # the 'echo' output, and you've confirmed everything looks okay.
  # also, make sure you have a backup of your
  # files in another directory or on another system before
  # running this 'mv' command.
  # mv "$infile" "$outfile"
