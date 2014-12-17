#!/usr/bin/perl
use FindBin qw($Bin);
use lib "$Bin/lib";

use qbit;

use Getopt::Long;
use Pod::Usage;

use QBit::PodNavigator;

my %args = ();
GetOptions(\%args, 'help|?', 'port=i', 'path=s@');

pod2usage(1) if $args{'help'};

$args{'path'} = ["$Bin/lib"];

QBit::PodNavigator->config_opts(paths => $args{'path'});
my $server = QBit::PodNavigator->new();
$server->run(port => $args{'port'});

__END__

=head1 NAME

qbit_pod_navigator

=head1 SYNOPSIS

qbit_pod_navigator [options]

=head1 OPTIONS

=over 15

=item B<--port>

WebServer port. Listen on 0.0.0.0.

=item B<--path>

Directories with perl modules. Use several times if need.

Default shows from all @INC directories.

=item B<--help>

Show help message and exit.

=back

=head1 DESCRIPTION

Start HTTP server with POD navigator application.
