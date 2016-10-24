
package WWW::Pastebin::Paste 0.1 {
    use Moose;
    use Moose::Util::TypeConstraints;
    use namespace::autoclean;
    use WWW::Mechanize;
    use feature qw(signatures);
    no warnings qw(experimental::signatures);

    has 'hash' => (
        is  => 'rw',
        isa => 'Str',
    );
    has 'access_url' => (
        is      => 'ro',
        isa     => 'Str',
        default => 'http://pastebin.com/api/api_post.php',
    );
    has 'edit_url' => (
        is      => 'ro',
        isa     => 'Str',
        default => 'http://pastebin.com/edit',
    );
    has 'raw_url' => (
        is      => 'ro',
        isa     => 'Str',
        default => 'http://pastebin.com/api/api_raw.php',
    );
    has 'mech' => (
        is      => 'rw',
        isa     => 'WWW::Mechanize',
        default => sub{ WWW::Mechanize->new },
    );

    sub edit($self, $account, $content) {#{{{
        $account->login_web();

        my $edit_url = join '/', ($self->edit_url, $self->hash);
        $account->mech->get($edit_url);

        $account->mech->form_id("myform");
        $account->mech->field( 'paste_code', $content );
        $account->mech->submit();
        return $account->mech->status;
    }#}}}
    sub delete($self, $account) {#{{{
        my $doc = {
            api_dev_key   => $account->api_key,
            api_user_key  => $account->api_user_key,
            api_paste_key => $self->hash,
            api_option    => 'delete'
        };
        my $resp = $account->mech->post( $self->access_url, $doc );
        return ( $resp->decoded_content eq 'Paste Removed') ? 1 : 0;
    }#}}}
    sub get($self, $account) {#{{{
        my $doc = {
            api_dev_key   => $account->api_key,
            api_user_key  => $account->api_user_key,
            api_paste_key => $self->hash,
            api_option    => 'show_paste'
        };
        my $resp = $account->mech->post( $self->raw_url, $doc );
        return $resp->decoded_content;
    }#}}}

    __PACKAGE__->meta->make_immutable;
}

1;
