BEGIN {
s4=0;s9=0;s14=0;ts=0;p4=0;p9=0;p14=0;
}
{ 
 action = $1;
 time = $2;
 from = $3;
 to = $4;
 type = $5;
 pktsize = $6;
 flow_id = $8;
 src = $9;
 dst = $10;
 seq_no = $11;
 packet_id = $12;

 if ($2>=t && $2<=(t+0.2))
 {
  if(int($3)==4 && int($10)==16)
	s4++;
  if(int($3)==9 && int($10)==16)
	s9++;
  if(int($3)==14 && int($10)==16)
	s14++;
 }

}
END{
 ts=s4+s9+s14;
 p4=s4/ts;
 p9=s9/ts;
 p14=s14/ts;
 printf("%f %f %f %f\n",t,p4,p9,p14);
}
