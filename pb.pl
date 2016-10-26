#!/usr/bin/env perl

use v5.20;                      # or later to get signatures
use utf8;                       # so literals and identifiers can be in UTF-8
use warnings;                   # on by default
use warnings  qw(FATAL utf8);   # fatalize encoding glitches
use open      qw(:std :utf8);   # undeclared streams in UTF-8

use feature qw(signatures);
no warnings qw(experimental::signatures);

use lib 'lib';
use File::Basename;
use File::Slurper qw(read_text);
use FindBin;
use JSON;
use WWW::Pastebin::Account;
use WWW::Pastebin::Paste;


my %scripts = (
    "$FindBin::Bin/turtle/bin/get_all"       => 'DmEhcUVa',
    "$FindBin::Bin/turtle/bin/get_script"    => 'pzEBgR8k',
    "$FindBin::Bin/turtle/bin/find_box"      => 'x1kHs0v3',
    "$FindBin::Bin/turtle/bin/find_loc"      => 'SEYF57X4',
    "$FindBin::Bin/turtle/bin/go_box"        => 'HaNYCNZM',
    "$FindBin::Bin/turtle/bin/go_home"       => 'nCp8t5Q1',
    "$FindBin::Bin/turtle/bin/harvest_wheat" => '8rXFt1YW',
    "$FindBin::Bin/turtle/bin/dig_cube"      => '2DRzRAR3',
    "$FindBin::Bin/turtle/bin/set_home"      => 'N30TvHE7',
    "$FindBin::Bin/turtle/lib/harvest"       => 'G1u3NJE1',
    "$FindBin::Bin/turtle/lib/move"          => 'rpdxDz77',
    "$FindBin::Bin/turtle/lib/myinv"         => 'bxF3p2yy',
    "$FindBin::Bin/turtle/lib/settings"      => 'nqQjpWVX',
);


my $config  = decode_json(read_text('pass.txt'));
my $account = WWW::Pastebin::Account->new({ 
    user    => $config->{'user'}, 
    pass    => $config->{'pass'}, 
    api_key => $config->{'api_key'}
});
$account->login();

foreach my $path(keys %scripts) {
    my $hash    = $scripts{$path};
    my $content = read_text($path);
    my $paste   = WWW::Pastebin::Paste->new({ hash => $hash });
    $paste->edit($account, $content);
    say "Updated " . basename($path) . ".";
}

