#!/bin/bash
mkdir five 
x=1

while [[ $x -lt 6 ]]
do
    mkdir five/dir$x
    y=1

    while [[ $y -lt 5 ]]
    do
	
	z=1

	while [[ $z -lt $y+1 ]]
	do
	    
	    echo $y >> five/dir$x/file$y
	    z=$(($z+1))
	    
	done
       
        y=$(($y+1))
    done

    x=$(($x+1))
done
