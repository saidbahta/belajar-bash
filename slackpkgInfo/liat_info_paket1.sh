#!/bin/zsh
i=$(wc -l < pkg.lists) 					
while [ $i -gt 0 ];					
do 							
	n_paket=$(sed -n $i\p<pkg.lists) 		
	read -p "Liat info paket $n_paket ? " yn	
	case $yn in 					
		[Yy]* ) slackpkg info $n_paket;;	
		[Nn]* ) exit;;				
		* ) echo "Y atau N";; 			
	esac	
i=$[$i-1]						
done 							
