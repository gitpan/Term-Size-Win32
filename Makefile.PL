
use 5;
use ExtUtils::MakeMaker;

my $EUMM_VERSION = eval $ExtUtils::MakeMaker::VERSION;

my $is_win32 = ($^O =~ /MSWin/i);

WriteMakefile(
    'NAME'            => 'Term::Size::Win32',
    'VERSION_FROM'    => 'lib/Term/Size/Win32.pm',
    'PREREQ_PM'       => {
        ($is_win32 ? ( # recommended... if you want it to work :)
            'Win32::Console' => 0,
        ) : ()),
        'Test::More'     => 0, # build 
    }, 
    ($] >= 5.005 ? (
        'ABSTRACT_FROM' => 'lib/Term/Size/Win32.pm',
        'AUTHOR'        => 'Adriano R. Ferreira <ferreira@cpan.org>'
    ) : ()),
    ($EUMM_VERSION >= 6.30_01 ? (
        LICENSE => 'perl', 
        EXTRA_META => "recommends:   \n    Win32::Console:                0\n"
    ) :())

);
