#!/bin/bash
clear
echo "LIGANDO MODO MUNITO"
echo "AGUARDE            AGUARDE 0%.                              100%"
sleep 1
clear
echo "LIGANDO MODO MUNITO"
echo "AGUARDE            AGUARDE 0%...                            100%"
ifconfig > /tmp/ifconfig.txt
echo `awk '/wlan0mon:/ {print $1}' /tmp/ifconfig.txt` > /tmp/ifconfig2.txt 
w0=`awk '/wlan0/ {print $1}' /tmp/ifconfig.txt` 
w1=`awk '/wlan1/ {print $1}' /tmp/ifconfig.txt`
echo $w0
echo $w1
escolha=0
#if [ "$w0" != wlan0: ] && [ "$w1" != wlan1: ]; then ################################################################3
#echo "WI-FI ESTA DESLIGADO ! POR FAVOR ATIVE"
#sleep 3
#exit 0                                              ##################################################################
#fi                                                  ####################################################################
sleep 3
if [ "$w0" == wlan0: ] && [ "$w1" != wlan1: ];then 
escolha=1
fi
if [ "$w1" == wlan1: ] && [ "$w0" != wlan0: ];then 
escolha=2
fi
if [ "$w0" == "wlan0:" ] && [ "$w1" == "wlan1:" ] && [ $escolha == 0 ];then
echo "escolha interface 1 para wlan0 e 2 para wlan1"
read escolha 
fi
if [ "$w0" == wlan0: ] && [ "$w1" == wlan1mon: ];then
echo "ENTERFACE wlan1 ja enta em modo minutor"
sleep 3
airodump-ng --wps wlan1mon
exit 0
fi
if [ "$w0" == wlan0mon: ] && [ "$w1" == wlan1: ];then
echo "ENTERFACE wlan0 ja enta em modo minutor"
sleep 3
airodump-ng --wps wlan0mon
exit 0
fi
if [ "$w0" == wlan0mon: ] && [ "$w1" == wlan1mon: ];then
echo "ENTERFACE wlan0 e wlan1 ja entao em modo minutor"
sleep 3echo "escolha interface 1 para wlan0 e 2 para wlan1"
read escolha
exit 0
fi


status=`sed -n '1p' /tmp/ifconfig2.txt` ; # > /dev/null
clear
echo "LIGANDO MODO MUNITO"
echo "VERIFICANDO        AGUARDE 0%..........                     100%"
sleep 5
 
var=`echo wlan0mon:` > dev/null
rm /tmp/ifconfig.txt  > dev/null
rm /tmp/ifconfig2.txt > dev/null
#rm /tmp/ifconfig3.txt > dev/null ####################################################

while [ TRUE ];  
do             
if [ $var == $status ];then
clear
echo "############################"
echo "MODO MUNITOR JA ESTA LIGADO!"
echo "############################"
sleep 1
echo 
echo ">>>>ATIVANDO airodump-ng>>>>"
sleep 3
   
airodump-ng --wps wlan0mon
exit 0
else
clear
if [ "$escolha" == "1" ];then  
echo "LIGANDO MODO MUNITO"
echo "ATIVANDO wlan0mon  AGUARDE 0%.........                      100%" 
airmon-ng start wlan0 > /dev/null
sleep 1
clear
echo "LIGANDO MODO MUNITO"
echo "START wlan0mon     AGUARDE 0%.................              100%"
airmon-ng start wlan0mon  > /dev/null
sleep 1
clear
echo "LIGANDO MODO MUNITO"
echo "START airodump-ng  AGUARDE 0%............................   100%"
sleep 2
airodump-ng --wps wlan0mon
exit 0
fi #####################################################################################################
if [ "$escolha" == "2" ];then  
echo "LIGANDO MODO MUNITO"
echo "ATIVANDO wlan1mon  AGUARDE 0%.........                      100%" 
airmon-ng start wlan1 > /dev/null
sleep 1
clear
echo "LIGANDO MODO MUNITO"
echo "START wlan1mon     AGUARDE 0%.................              100%"
airmon-ng start wlan0mon  > /dev/null
sleep 1
clear
echo "LIGANDO MODO MUNITO"
echo "START airodump-ng  AGUARDE 0%............................   100%"
sleep 2
airodump-ng --wps wlan1mon
exit 0 
else
echo "LIGANDO MODO MUNITO"
echo "ATIVANDO wlan0mon  AGUARDE 0%.........                      100%" 
airmon-ng start wlan0 > /dev/null
sleep 1
clear
echo "LIGANDO MODO MUNITO"
echo "START wlan0mon     AGUARDE 0%.................              100%"
airmon-ng start wlan0mon  > /dev/null
sleep 1
clear
echo "LIGANDO MODO MUNITO"
echo "START airodump-ng  AGUARDE 0%............................   100%"
sleep 2
airodump-ng --wps wlan0mon 
exit 0
fi #####################################################################################################
exit 0
fi
done 
