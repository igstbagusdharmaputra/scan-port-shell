#!/bin/bash

function checkport {
	if nc -zv -w30 $1 $2 <<< '' &> /dev/null
	then
		echo "[+] Port $1/$2 is open"
	else
		echo "[-] Port $1/$2 is closed"
	fi
}

listPort=(443 80 8000); \
listIP=(192.168.1.1 192.168.1.2 192.168.1.3 192.168.1.4); \

for ((i=0; i < ${#listPort[@]}; i++)); \
    do \
        for ((j=0; j < ${#listIP[@]}; j++)); \
        do
            checkport ${listIP[$j]} ${listPort[$i]}
        done; \
    done; \
