
use 5;
use ExtUtils::MakeMaker;

my $is_win32 = ($^O =~ /MSWin/i);

WriteMakefile(

    'NAME'            => 'Term::Size::Win32',
    'VERSION_FROM'    => 'lib/Term/Size/Win32.pm',
    'PREREQ_PM'       => {
        'Win32::Console' => 0,
        'Test::More'     => 0, # build 
    }, 
    ($] >= 5.005 ? (
        'ABSTRACT_FROM' => 'lib/Term/Size/Win32.pm',
        'AUTHOR'        => 'Adriano R. Ferreira <ferreira@cpan.org>'
    ) : ()),
    #LICENSE => 'perl', # needs EEUU > 6.30_01

) if $is_win32;

ExtUtils::MakeMaker::WriteEmptyMakefile( # do nothing if not Win32, but don't fail
    'NAME'        => 'Term::Size',
    'VERSION_FROM'    => 'lib/Term/Size/Win32.pm',
) unless $is_win32;

