URL=www.tensorflow.org
n=0
echo  ${URL} > $URL.txt
echo "dig ${URL} begin now please wait"
for i in {1..86400}
do
	sleep 1
	res=`dig +norecurse +noall +answer ${URL}`
	if [ -z "$res" ]
	then
		n=$[$n+1]
	else
		if [ $n -ne 0 ] 
	    # if n != 0
		then
			echo  $n  >> $URL.txt
			n=0;
		fi
	fi
	if [ $[$i%9999] == 0 ]
	# set the end of the fig program
	then
		echo $i
	fi
done
if [ $n -ne 0 ]
then
	echo  $n  >> $URL.txt
fi
FINISH