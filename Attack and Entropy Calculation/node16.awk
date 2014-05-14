BEGIN {
number_of_attack=0;
number_of_normal=0;
}
{
parameter1=$1
parameter2=$2
parameter3=$3
parameter4=$4
parameter5=$5
parameter6=$6
parameter8=$8
parameter9=$9
parameter10=$10
parameter11=$11
parameter12=$12
if (parameter1=="r" && parameter5=="tcp" && parameter4==16)
number_of_normal++;

if (parameter1=="r" && parameter5=="cbr" && parameter4==16)
number_of_attack++;


printf("\n%f %f",parameter2,((number_of_attack)/(number_of_attack + number_of_normal)));
}
END {
}

