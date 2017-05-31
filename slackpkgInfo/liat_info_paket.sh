#!/bin/sh
listLine=$(wc -l < pkg.lists2) 											#Ambil total jumlah baris  
while [ $listLine -gt 0 ]; do 												#Bandingkan jumlah baris > 0  
	n_paket=$(sed -n $listLine\p<pkg.lists2) 									#set n_paket berdasarkan nomor baris $listLine	
	echo  "Liat info paket $n_paket? " 									#Baca input dari keyboard   
	select yt in Ya Tidak Keluar; do
	case $yt in 												#Jika Y/N 
		Ya) slackpkg info $n_paket;									#Y > Liat info paket 	
			echo "Tambahkan ke list hapus?"								#Baca input dari keyboard 
			select yt in Ya Tidak Keluar; do
		        case $yt in										#Jika Y/N
				Ya) echo $n_paket >> "list.hapus"; sed -i "$listLine d" pkg.lists2; clear; break;; 	#Masukkan $n_paket ke fail list.hapus
				Tidak) clear; sed -i "$listLine d" pkg.lists2 ; break;; 				#Lanjutkan program 
				Keluar) exit;;
			esac
			done; break;;
		Tidak) sed -i "$listLine d" pkg.lists2 ; break;;							#N > Keluar 
		Keluar) exit;;
	esac	
	done 
listLine=$[$listLine-1]													#Kurangi jumlah baris dengan 1 
done		 
