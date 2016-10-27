#!/usr/bin/env perl

use v5.14;
use warnings;
use File::Copy;
use File::Find;
use File::Slurp;
use File::Temp;

### If you uncomment the _modules line, remember that I have a section called 
### "TLE_modules", and the "_modules" line below, as-is, will break the links 
### to that section.
###
File::Copy::mv( '_sources', 'sources' );
File::Copy::mv( '_static',  'static'  );

my $files_fixed = 0;
find( \&wanted, '.' );
say "I just fixed $files_fixed files.";


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

