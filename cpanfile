requires 'Plack';
requires 'JSON::XS';

on test => sub {
    requires 'Test::More';
    requires 'File::Spec';
    requires 'File::Basename';
};
