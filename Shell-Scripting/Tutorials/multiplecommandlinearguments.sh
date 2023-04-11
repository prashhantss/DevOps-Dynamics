#Shell script to process an unknown number of commandline arguments with either the $* or $@ special parameters.


#!/bin/sh

for TOKEN in $*
do
   echo $TOKEN
done


#print exit status echo $?
