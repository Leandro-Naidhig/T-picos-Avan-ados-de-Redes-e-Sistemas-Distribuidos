#!/usr/bin/perl

use v5.10;
use Socket;
use warnings;
use strict;
use diagnostics;
use Number::Bytes::Human qw(format_bytes);

my $proto = getprotobyname('tcp');
my $port = 5000;
my $hostname = '10.0.2.15';

socket(my $sock, PF_INET, SOCK_STREAM, $proto)
    or die "Can't open socket $!\n";

bind($sock, pack_sockaddr_in($port, inet_aton($hostname)))
    or die "Can't bind to port $port!\n$!\n";

listen($sock, 2) or die "Listen: $!\n";
say("Listening on port $port");

my $client_addr;

while ($client_addr = accept(my $new_sock, $sock))
{
    my($c_port, $iaddr) = sockaddr_in($client_addr);
    say("Client connected! ($iaddr:$c_port)");
    my $data = eof;
    my $name;

    recv($new_sock, $name, 1024, 0);
    open(my $fh, '>', "$name") or die "Couldn't open file $name";
    my $size;
    my $sum = 0;
    while (defined($data = <$new_sock>))
    {
        #recv($new_sock, $data, 1024, 0);
       	$sum += length($data);
	$size = format_bytes($sum);
        print("Receiving data [$name] . . . . . . .($size)");
	print("   \r");
        print $fh $data;
    }
    say("\nDONE!");
    close($fh);
    close($new_sock);
    say("Connection closed!");
}
close($sock);
