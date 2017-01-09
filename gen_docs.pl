#!/usr/bin/env perl

use v5.14;
use warnings;
use File::Copy;
use File::Find;
use File::Slurp;
use File::Temp;
use FindBin;

chdir("$FindBin::Bin/write_docs");
system("make html");
say '';
say "Documentation has been generated.";



chdir("$FindBin::Bin/docs");

File::Copy::mv( '_sources', 'sources' );
File::Copy::mv( '_static',  'static'  );

my $files_fixed = 0;
find( \&wanted, '.' );
say "I just fixed $files_fixed files.";

open my $fh, '>', "CNAME" or die $!;
print $fh "cc.tmtowtdi.online";
close $fh;
say "CNAME file is in place.";


sub wanted {
    ### $File::Find::dir - current dir
    ### $File::Find::name - full pathname to file
    ### $_ - current filename
    return unless $_ =~ /\.html$/;

    my $tmp_fh = File::Temp->new( UNLINK => 0 );
    my $tmp_fn = $tmp_fh->filename;
    close $tmp_fh;

    my $input = File::Slurp::read_file( $_ );
    $input =~ s{_sources}{sources}g;
    $input =~ s{_static}{static}g;
    $input =~ s{"_images}{"images}g;
    File::Slurp::write_file( $tmp_fn, $input );

    File::Copy::mv( $tmp_fn, $_) or die $!;
    unlink $tmp_fn;
    $files_fixed++;
}

