#!/bin/sh

NAME[0]="Zero"
NAME[1]="One"
NAME[2]="Two"
NAME[3]="Three"
NAME[4]="Four"

echo "First Method: ${NAME[*]}"
echo "Second Method: ${NAME[@]}"
