
use Test::More tests => 6;

BEGIN { use_ok('Term::Size'); }

@chars = Term::Size::chars;
ok(@chars == 2);

@chars1 = Term::Size::chars *STDERR;
is_deeply([@chars], [@chars1]);

$cols = Term::Size::chars;
is($cols, $chars[0]);

@pixels = Term::Size::pixels;
ok(@pixels==2);

$x = Term::Size::pixels;
ok($x == $pixels[0]);

diag("This terminal is $chars[0]x$chars[1] characters,"),
diag("  and $pixels[0]x$pixels[1] pixels.");

