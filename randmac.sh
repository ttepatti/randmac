#!/bin/bash

Digits="0
1
2
3
4
5
6
7
8
9
A
B
C
D
E
F"

pd=($Digits) # Put digits into array (pd = possible digits)

num_pd=${#pd[*]} # Count how many elements in array

randommac=${pd[$((RANDOM%num_pd))]}${pd[$((RANDOM%num_pd))]}":"${pd[$((RANDOM%num_pd))]}${pd[$((RANDOM%num_pd))]}":"${pd[$((RANDOM%num_pd))]}${pd[$((RANDOM%num_pd))]}":"${pd[$((RANDOM%num_pd))]}${pd[$((RANDOM%num_pd))]}":"${pd[$((RANDOM%num_pd))]}${pd[$((RANDOM%num_pd))]}":"${pd[$((RANDOM%num_pd))]}${pd[$((RANDOM%num_pd))]}

echo "[+] Your randomly generated MAC is" $randommac

echo "[~] Stopping any monitor mode interfaces that may be running..."

airmon-ng stop wlan0
airmon-ng stop mon0

echo "[~] Setting new MAC address..."

macchanger -m $randommac wlan0

echo "[+] Your new MAC address has been set!"

exit
