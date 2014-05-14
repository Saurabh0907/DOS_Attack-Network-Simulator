grep "^r" out.tr | grep " cbr " > output

rm arrt prob pkt_asd d1 d2 d3 p1 p2 p3


i=49
while [ $i -le 490 ]
do
        i=`echo "$i + 1" | bc`
        j=$(echo "scale=10; $i / 100" | bc)
        awk -v t=$j -f try.awk output>>arrt
done

i=49
while [ $i -le 490 ]
do
        i=`echo "$i + 1" | bc`
        j=$(echo "scale=10; $i / 100" | bc)
        awk -v t=$j -f tryt.awk output>>prob
done

i=49
while [ $i -le 490 ]
do
        i=`echo "$i + 1" | bc`
        j=$(echo "scale=10; $i / 100" | bc)
        awk -v t=$j -f tryq.awk qm.out>>pkt_asd
done
