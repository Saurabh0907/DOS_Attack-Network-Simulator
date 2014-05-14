rm output.txt
rm node4.txt
rm node9.txt
rm node15.txt
rm node16.txt

rm node4_1.txt
rm node9_1.txt
rm node15_1.txt
rm node16_1.txt


awk -f cal_udp.awk out.tr > output.txt
awk -f node4.awk out.tr > node4.txt
awk -f node9.awk out.tr > node9.txt
awk -f node15.awk out.tr > node15.txt
awk -f node16.awk out.tr > node16.txt

awk -f node4_1.awk out.tr > node4_1.txt
awk -f node9_1.awk out.tr > node9_1.txt
awk -f node15_1.awk out.tr > node15_1.txt
awk -f node16_1.awk out.tr > node16_1.txt


xgraph output.txt
xgraph node4.txt node4_1.txt
xgraph node9.txt node9_1.txt
xgraph node15.txt node15_1.txt
xgraph node16.txt node16_1.txt
