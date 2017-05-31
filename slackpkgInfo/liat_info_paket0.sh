#!/bin/zsh
i=$(wc -l < pkg.lists) 		#Get total line number 
while [ $i -gt 0 ];
do 
	n_paket=$(sed -n $i\p<pkg.lists)
     	slackpkg info $n_paket
	i=$[$i-1]
	      	


done 

#sed -n "$i"p pkg.lists 
#echo -n "Hurry up and type something! > "
#if read -t 3 response; then
#    echo "Great, you made it in time!"
#    else
#        echo "Sorry, you are too slow!"
#        fi
