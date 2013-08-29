#!/usr/bin/env perl

use IO::Stty;

$| = 1;
IO::Stty::stty(\*STDIN, "raw");
IO::Stty::stty(\*STDIN, "-echo");

while(read STDIN, $c, 1){
	last if ord($c) == 0x1b;
	printf " %02x", ord($c);
}

IO::Stty::stty(\*STDIN, "-raw");
IO::Stty::stty(\*STDIN, "echo");

