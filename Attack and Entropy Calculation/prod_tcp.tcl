set ns [new Simulator]

# Definition of colors used to color different flows.   
$ns color 0 black
$ns color 1 blue
$ns color 2 red

#open the trace file
set tracefile1 [open out.tr w]
$ns trace-all $tracefile1

#open the nam trace fileclear
set namfile [open out.nam w]
$ns namtrace-all $namfile

#define a 'finish' procedure
proc finish {} {
	global ns tracefile1 namfile
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
set n15 [$ns node]
set n16 [$ns node]

$n9 color blue
$n10 color red
$n11 color red
$n12 color red
$n13 color red
$n14 color red

$n15 color yellow
$n16 color green

$ns duplex-link $n0 $n4 12Mb 100ms DropTail
$ns duplex-link $n1 $n4 12Mb 100ms DropTail
$ns duplex-link $n2 $n4 12Mb 100ms DropTail
$ns duplex-link $n3 $n4 12Mb 100ms DropTail
$ns duplex-link $n4 $n15 12Mb 100ms DropTail
$ns duplex-link $n5 $n9 12Mb 100ms DropTail
$ns duplex-link $n6 $n9 12Mb 100ms DropTail
$ns duplex-link $n7 $n9 12Mb 100ms DropTail
$ns duplex-link $n8 $n9 12Mb 100ms DropTail
$ns duplex-link $n9 $n15 12Mb 100ms DropTail
$ns duplex-link $n10 $n14 12Mb 100ms DropTail
$ns duplex-link $n11 $n14 12Mb 100ms DropTail
$ns duplex-link $n12 $n14 12Mb 100ms DropTail
$ns duplex-link $n13 $n14 12Mb 100ms DropTail
$ns duplex-link $n14 $n15 12Mb 100ms DropTail
$ns duplex-link $n15 $n16 6Mb 200ms DropTail

$ns queue-limit $n15 $n16 10

$n4 shape square
$n9 shape square
$n14 shape square
$n15 shape hexagon
$n16 shape hexagon

#queue monitoring
set qmonitor [$ns monitor-queue $n15 $n16 [open qm.out w] ];
[$ns link $n15 $n16] queue-sample-timeout;

####################################### UDP SET #########################################

#setup a tcp connection
set tcp1 [new Agent/TCP]
$ns attach-agent $n0 $tcp1

set sink1 [new Agent/TCPSink]
$ns attach-agent $n16 $sink1

set sink2 [new Agent/TCPSink]
$ns attach-agent $n16 $sink2

set sink3 [new Agent/TCPSink]
$ns attach-agent $n16 $sink3

set sink4 [new Agent/TCPSink]
$ns attach-agent $n16 $sink4


$ns connect $tcp1 $sink1
$tcp1 set fid_ 0

#setup a tcp connection
set tcp2 [new Agent/TCP]
$ns attach-agent $n1 $tcp2
$ns connect $tcp2 $sink2
$tcp2 set fid_ 0

#setup a tcp connection
set tcp3 [new Agent/TCP]
$ns attach-agent $n2 $tcp3
$ns connect $tcp3 $sink3
$tcp3 set fid_ 0

#setup a tcp connection
set tcp4 [new Agent/TCP]
$ns attach-agent $n3 $tcp4
$ns connect $tcp4 $sink4
$tcp4 set fid_ 0






set null1 [new Agent/Null]
$ns attach-agent $n16 $null1




set sink5 [new Agent/TCPSink]
$ns attach-agent $n16 $sink5

set sink6 [new Agent/TCPSink]
$ns attach-agent $n16 $sink6

set sink7 [new Agent/TCPSink]
$ns attach-agent $n16 $sink7

set sink8 [new Agent/TCPSink]
$ns attach-agent $n16 $sink8



#setup a udp connection
set udp6 [new Agent/TCP]
$ns attach-agent $n5 $udp6
$ns connect $udp6 $sink5
$udp6 set fid_ 1

#setup a udp connection
set udp7 [new Agent/TCP]
$ns attach-agent $n6 $udp7
$ns connect $udp7 $sink6
$udp7 set fid_ 1

#setup a udp connection
set udp8 [new Agent/TCP]
$ns attach-agent $n7 $udp8
$ns connect $udp8 $sink7
$udp8 set fid_ 1

#setup a udp connection
set udp9 [new Agent/TCP]
$ns attach-agent $n8 $udp9
$ns connect $udp9 $sink8
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

#setup a udp connection
set udp13 [new Agent/UDP]
$ns attach-agent $n12 $udp13
$ns connect $udp13 $null1
$udp13 set fid_ 2

#setup a udp connection
set udp14 [new Agent/UDP]
$ns attach-agent $n13 $udp14
$ns connect $udp14 $null1
$udp14 set fid_ 2

###################################### CBR SET #############################################


#setup aCBR over UDP connection
set cbr1 [new Application/FTP]
$cbr1 attach-agent $tcp1
$cbr1 set packet_size_ 500
$cbr1 set rate_ 1Mb
$cbr1 set random_ false
$cbr1 set interval_ 0.1 

#setup aCBR over UDP connection
set cbr2 [new Application/FTP]
$cbr2 attach-agent $tcp2
$cbr2 set packet_size_ 500
$cbr2 set rate_ 1Mb
$cbr2 set random_ false
$cbr2 set interval_ 0.1

#setup aCBR over UDP connection
set cbr3 [new Application/FTP]
$cbr3 attach-agent $tcp3
$cbr3 set packet_size_ 500
$cbr3 set rate_ 1Mb
$cbr3 set random_ false
$cbr3 set interval_ 0.1

#setup aCBR over UDP connection
set cbr4 [new Application/FTP]
$cbr4 attach-agent $tcp4
$cbr4 set packet_size_ 500
$cbr4 set rate_ 1Mb
$cbr4 set random_ false
$cbr4 set interval_ 0.1



#setup aCBR over UDP connection
set cbr6 [new Application/FTP]
$cbr6 attach-agent $udp6
$cbr6 set packet_size_ 500
$cbr6 set rate_ 0.1Mb
$cbr6 set random_ false
$cbr6 set interval_ 0.1

#setup aCBR over UDP connection
set cbr7 [new Application/FTP]
$cbr7 attach-agent $udp7
$cbr7 set packet_size_ 500
$cbr7 set rate_ 0.1Mb
$cbr7 set random_ false
$cbr7 set interval_ 0.1

#setup aCBR over UDP connection
set cbr8 [new Application/FTP]
$cbr8 attach-agent $udp8
$cbr8 set packet_size_ 500
$cbr8 set rate_ 0.1Mb
$cbr8 set random_ false
$cbr8 set interval_ 0.1

#setup aCBR over UDP connection
set cbr9 [new Application/FTP]
$cbr9 attach-agent $udp9
$cbr9 set packet_size_ 500
$cbr9 set rate_ 0.1Mb
$cbr9 set random_ false
$cbr9 set interval_ 0.1

#setup aCBR over UDP connection
set cbr11 [new Application/Traffic/CBR]
$cbr11 attach-agent $udp11
$cbr11 set packet_size_ 3000
$cbr11 set rate_ 0.1Mb
$cbr11 set random_ false
$cbr11 set interval_ 0.01

#setup aCBR over UDP connection
set cbr12 [new Application/Traffic/CBR]
$cbr12 attach-agent $udp12
$cbr12 set packet_size_ 3000
$cbr12 set rate_ 0.1Mb
$cbr12 set random_ false
$cbr12 set interval_ 0.01

#setup aCBR over UDP connection
set cbr13 [new Application/Traffic/CBR]
$cbr13 attach-agent $udp13
$cbr13 set packet_size_ 3000
$cbr13 set rate_ 0.1Mb
$cbr13 set random_ false
$cbr13 set interval_ 0.01

#setup aCBR over UDP connection
set cbr14 [new Application/Traffic/CBR]
$cbr14 attach-agent $udp14
$cbr14 set packet_size_ 3000
$cbr14 set rate_ 0.1Mb
$cbr14 set random_ false
$cbr14 set interval_ 0.01

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
$ns at 1.5 "$cbr13 start"
$ns at 5.0 "$cbr13 stop"
$ns at 1.5 "$cbr14 start"
$ns at 5.0 "$cbr14 stop"
$ns at 5.0 "finish"
$ns run
