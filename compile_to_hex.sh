#!/bin/bash

mkdir -p $(pwd)/hex

for filename in $(pwd)/code/*.s; do
	n=${filename%%.*}
	subname=${filename##*/}
	name=${subname%.*}
	sisa-as "$n.s" -o "$n.o";
	sisa-objdump -d "$n.o" | awk '{ print $2 }' | tail -n +7 | cat > "$(pwd)/hex/$name.hex";
	rm "$n.o" #Erase the .o files 
done
