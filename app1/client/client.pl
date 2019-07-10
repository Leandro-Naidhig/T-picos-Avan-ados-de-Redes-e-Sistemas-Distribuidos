#!/usr/bin/perl

use v5.10;
use Socket;
use warnings;
use strict;
use diagnostics;

my $proto = getprotobyname('tcp');
my $port = 1232;
print("Server IP address: ");
chomp(my $server = <>);

socket(my $sock, PF_INET, SOCK_STREAM, $proto)
    or die "Can't open socket $!\n";

connect($sock, sockaddr_in($port, inet_aton($server)))
    or die "Can't connect to $server on port $port\n";

say("Connected to server ($server:$port)");

print "Name of the file to transfer: ";
chomp(my $fn = <>);
open(my $fh, '<', $fn) or die "Can't open file $fn!\n";
binmode($fh);

send($sock, $fn, 0);
sleep(2);

my $data;
my $i = 0;
while(read($fh, $data, 1024))
{
    print("Sendind $fn . . . . . . ($i KiB)\r");
    $i++;
    send($sock, $data, 0);
}
say("\nDONE!");
close($fh);
close($sock);
