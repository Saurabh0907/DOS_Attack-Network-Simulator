BEGIN {
s[""];sum=0;s4=0;s9=0;s14=0;a=0;
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
	s4=s4+$6;
  if(int($3)==9 && int($10)==16)
	s9=s9+$6;
  if(int($3)==14 && int($10)==16)
	s14=s14+$6;
  sum=sum+s4+s9+s14;
 }

}
END{
 a=sum/0.01;
 printf("%f %f\n",t,a);
}
