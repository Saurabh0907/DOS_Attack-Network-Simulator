set ns [new Simulator]

$ns color 0 black
$ns color 1 blue
$ns color 2 red

set tracefile1 [open out.tr w]
$ns trace-all $tracefile1

#open the nam trace fileclear
set namfile [open out.nam w]
$ns namtrace-all $namfile

#define a 'finish' procedure
proc finish {} {
	global ns tracefile1 namfile fstate
	$ns flush-trace
	close $tracefile1
	close $namfile
	exec nam out.nam &
	exit 0
}


set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]
set n9 [$ns node]
set n10 [$ns node]
set n11 [$ns node]
set n12 [$ns node]
set n13 [$ns node]
set n14 [$ns node]

$n9 color blue
$n10 color red
$n11 color red
$n12 color red

$n13 color yellow
$n14 color green

$ns duplex-link $n0 $n4 12Mb 100ms DropTail
$ns duplex-link $n1 $n4 12Mb 100ms DropTail
$ns duplex-link $n2 $n4 12Mb 100ms DropTail
$ns duplex-link $n3 $n4 12Mb 100ms DropTail
$ns duplex-link $n4 $n13 12Mb 100ms DropTail
$ns duplex-link $n5 $n9 12Mb 100ms DropTail
$ns duplex-link $n6 $n9 12Mb 100ms DropTail
$ns duplex-link $n7 $n9 12Mb 100ms DropTail
$ns duplex-link $n8 $n9 12Mb 100ms DropTail
$ns duplex-link $n9 $n13 12Mb 100ms DropTail
$ns duplex-link $n10 $n12 12Mb 100ms DropTail
$ns duplex-link $n11 $n12 12Mb 100ms DropTail
$ns duplex-link $n12 $n13 12Mb 100ms DropTail
$ns duplex-link $n13 $n14 6Mb 200ms DropTail

$ns queue-limit $n13 $n14 20

#queue monitoring
set qmonitor [$ns monitor-queue $n13 $n14 [open qm.out w] ];
[$ns link $n13 $n14] queue-sample-timeout;

#setup a udp connection
set udp1 [new Agent/UDP]
$ns attach-agent $n0 $udp1
set null1 [new Agent/Null]
$ns attach-agent $n14 $null1
$ns connect $udp1 $null1
$udp1 set fid_ 0

#setup a udp connection
set udp2 [new Agent/UDP]
$ns attach-agent $n1 $udp2
$ns connect $udp2 $null1
$udp2 set fid_ 0

#setup a udp connection
set udp3 [new Agent/UDP]
$ns attach-agent $n2 $udp3
$ns connect $udp3 $null1
$udp3 set fid_ 0

#setup a udp connection
set udp4 [new Agent/UDP]
$ns attach-agent $n3 $udp4
$ns connect $udp4 $null1
$udp4 set fid_ 0

#setup a udp connection
set udp6 [new Agent/UDP]
$ns attach-agent $n5 $udp6
$ns connect $udp6 $null1
$udp6 set fid_ 1

#setup a udp connection
set udp7 [new Agent/UDP]
$ns attach-agent $n6 $udp7
$ns connect $udp7 $null1
$udp7 set fid_ 1

#setup a udp connection
set udp8 [new Agent/UDP]
$ns attach-agent $n7 $udp8
$ns connect $udp8 $null1
$udp8 set fid_ 1

#setup a udp connection
set udp9 [new Agent/UDP]
$ns attach-agent $n8 $udp9
$ns connect $udp9 $null1
$udp9 set fid_ 1

#setup a udp connection
set udp11 [new Agent/UDP]
$ns attach-agent $n10 $udp11
$ns connect $udp11 $null1
$udp11 set fid_ 2

#setup a udp connection
set udp12 [new Agent/UDP]
$ns attach-agent $n11 $udp12
$ns connect $udp12 $null1
$udp12 set fid_ 2


###################################### CBR SET #############################################

#setup aCBR over UDP connection
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packet_size_ 1500
$cbr1 set rate_ 0.2Mb
$cbr1 set random_ false
$cbr1 set interval_ 0.2

#setup aCBR over UDP connection
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
$cbr2 set packet_size_ 1500
$cbr2 set rate_ 0.2Mb
$cbr2 set random_ false
$cbr2 set interval_ 0.2

#setup aCBR over UDP connection
set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp3
$cbr3 set packet_size_ 1500
$cbr3 set rate_ 0.2Mb
$cbr3 set random_ false
$cbr3 set interval_ 0.2

#setup aCBR over UDP connection
set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp4
$cbr4 set packet_size_ 1500
$cbr4 set rate_ 0.2Mb
$cbr4 set random_ false
$cbr4 set interval_ 0.2

#setup aCBR over UDP connection
set cbr6 [new Application/Traffic/CBR]
$cbr6 attach-agent $udp6
$cbr6 set packet_size_ 1500
$cbr6 set rate_ 0.2Mb
$cbr6 set random_ false
$cbr6 set interval_ 0.2

#setup aCBR over UDP connection
set cbr7 [new Application/Traffic/CBR]
$cbr7 attach-agent $udp7
$cbr7 set packet_size_ 1500
$cbr7 set rate_ 0.2Mb
$cbr7 set random_ false
$cbr7 set interval_ 0.2

#setup aCBR over UDP connection
set cbr8 [new Application/Traffic/CBR]
$cbr8 attach-agent $udp8
$cbr8 set packet_size_ 1500
$cbr8 set rate_ 0.2Mb
$cbr8 set random_ false
$cbr8 set interval_ 0.2

#setup aCBR over UDP connection
set cbr9 [new Application/Traffic/CBR]
$cbr9 attach-agent $udp9
$cbr9 set packet_size_ 1500
$cbr9 set rate_ 0.2Mb
$cbr9 set random_ false
$cbr9 set interval_ 0.2

#setup aCBR over UDP connection
set cbr11 [new Application/Traffic/CBR]
$cbr11 attach-agent $udp11
$cbr11 set packet_size_ 4000
$cbr11 set rate_ 0.1Mb
$cbr11 set random_ false
$cbr11 set interval_ 0.01

#setup aCBR over UDP connection
set cbr12 [new Application/Traffic/CBR]
$cbr12 attach-agent $udp12
$cbr12 set packet_size_ 4000
$cbr12 set rate_ 0.1Mb
$cbr12 set random_ false
$cbr12 set interval_ 0.01


$ns at 0.5 "$cbr1 start"
$ns at 5.0 "$cbr1 stop"
$ns at 0.5 "$cbr2 start"
$ns at 5.0 "$cbr2 stop"
$ns at 0.5 "$cbr3 start"
$ns at 5.0 "$cbr3 stop"
$ns at 0.5 "$cbr4 start"
$ns at 5.0 "$cbr4 stop"
$ns at 0.5 "$cbr6 start"
$ns at 5.0 "$cbr6 stop"
$ns at 0.5 "$cbr7 start"
$ns at 5.0 "$cbr7 stop"
$ns at 0.5 "$cbr8 start"
$ns at 5.0 "$cbr8 stop"
$ns at 0.5 "$cbr9 start"
$ns at 5.0 "$cbr9 stop"
$ns at 1.5 "$cbr11 start"
$ns at 5.0 "$cbr11 stop"
$ns at 1.5 "$cbr12 start"
$ns at 5.0 "$cbr12 stop"

$ns at 5.0 "finish"
$ns run
