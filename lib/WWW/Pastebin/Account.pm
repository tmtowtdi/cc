
package WWW::Pastebin::Account 0.1 {
    use Moose;
    use Moose::Util::TypeConstraints;
    use namespace::autoclean;
    use WWW::Mechanize;
    use feature qw(signatures);
    no warnings qw(experimental::signatures);

    has 'api_key' => (
        is       => 'rw',
        isa      => 'Str',
        required => 1,
    );
    has 'api_user_key' => (
        is  => 'rw',
        isa => 'Str',
    );
    has 'phash' => (
        is  => 'rw',
        isa => 'Str',
    );
    has 'user' => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );
    has 'pass' => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );
    has 'mech' => (
        is      => 'rw',
        isa     => 'WWW::Mechanize',
        default => sub{ WWW::Mechanize->new },
    );
    has 'login_url' => (
        is      => 'ro',
        isa     => 'Str',
        default => 'http://pastebin.com/api/api_login.php',
    );
    has 'web_login_url' => (
        is      => 'ro',
        isa     => 'Str',
        default => 'http://pastebin.com/login',
    );
    has 'is_logged_in_web' => (
        is      => 'rw',
        isa     => 'Bool',
        default => 0,
    );

    sub login($self) {#{{{
        my $doc = { 
            api_dev_key       => $self->api_key,
            api_user_name     => $self->user,
            api_user_password => $self->pass,
        };
        my $resp = $self->mech->post( $self->login_url, $doc );
        $self->api_user_key($resp->decoded_content);
    }#}}}
    sub login_web($self) {#{{{
        return if $self->is_logged_in_web;
        $self->mech->get($self->web_login_url);
        $self->mech->form_id("myform");
        $self->mech->field("user_name", $self->user);
        $self->mech->field("user_password", $self->pass);
        $self->mech->submit;
        $self->is_logged_in_web(1);
    }#}}}

    __PACKAGE__->meta->make_immutable;
}

1;
