BEGIN {
sa=0;ss=0;sd=0;c=0;a=0;s=0;d=0;
}
{ 
 time = $1;
 from = $2;
 to = $3;
 qsb = $4;	#queue size bytes in monitor interval
 qsp = $5;	#queue size pkts in monitor interval
 anp = $6; 	#arr no. pkts
 dnp = $7; 	#dep no. pkts
 drp = $8; 	#drop no. pkts
 anb = $9; 	#arr no. bytes
 dnb = $10; 	#dep no. bytes
 drb = $11;	#drop no. bytes
if ($1>=t && $1<(t+0.1))
 {
  sa=sa+$6;	#arrival
  ss=ss+$7;	#departure/send
  sd=sd+$8;	#drop
  c++;
 }
}
END{
 a=sa/c;s=ss/c;d=sd/c;
 printf("%f %d %d %d\n",t,a,s,d);
}
