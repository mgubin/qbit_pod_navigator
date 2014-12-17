#!/usr/bin/perl
use strict;
use warnings;
use Time::Piece;
use Time::TZOffset qw/tzoffset/;
use Benchmark; 

use Time::Piece;
use Time::TZOffset qw/tzoffset/;
use Benchmark; 

foreach my $t (1..5) {
    print "Time $t\n";
    my $timestamp1 = new Benchmark;  
    foreach my $loop_index (0..1_000_000) {
        my $tm = time();
        my $zone =  (tzoffset(localtime($tm)) + 0) / 100; 
    }  
    my $timestamp2 = new Benchmark;  
    print "Time::TZOffset ", timestr(timediff($timestamp2, $timestamp1)), "\n";  

    $timestamp1 = new Benchmark;  
    foreach my $loop_index (0..1_000_000) {
        my $t = localtime;
        my $tt= $t->tzoffset/3600; 
    }  
    $timestamp2 = new Benchmark;  
    print "Time::Piece ", timestr(timediff($timestamp2, $timestamp1)), "\n\n"; 
}
__END__

Result: 

Time 1
Time::TZOffset 31 wallclock secs (29.94 usr +  0.31 sys = 30.25 CPU)
Time::Piece 59 wallclock secs (58.52 usr +  0.70 sys = 59.22 CPU)

Time 2
Time::TZOffset 30 wallclock secs (29.81 usr +  0.31 sys = 30.12 CPU)
Time::Piece 60 wallclock secs (59.55 usr +  0.39 sys = 59.94 CPU)

Time 3
Time::TZOffset 30 wallclock secs (30.05 usr +  0.26 sys = 30.31 CPU)
Time::Piece 61 wallclock secs (59.86 usr +  0.42 sys = 60.28 CPU)

Time 4
Time::TZOffset 31 wallclock secs (30.70 usr +  0.39 sys = 31.09 CPU)
Time::Piece 62 wallclock secs (61.15 usr +  0.59 sys = 61.74 CPU)

Time 5
Time::TZOffset 31 wallclock secs (30.94 usr +  0.36 sys = 31.29 CPU)
Time::Piece 61 wallclock secs (60.23 usr +  0.42 sys = 60.65 CPU)

