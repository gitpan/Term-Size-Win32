
use Test::More;

BEGIN { 
    eval { require Win32::Console };
    plan skip_all => "Win32::Console not installed" if $@;

    plan tests => 1,
}

BEGIN { use_ok('Term::Size::Win32'); }

diag( "Testing Term::Size::Win32 $Term::Size::Win32::VERSION, Perl $], $^X" );
