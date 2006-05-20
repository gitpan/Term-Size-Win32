package Term::Size::Win32;

use strict;
use Carp;
use vars qw(@EXPORT_OK @ISA $VERSION);

use Exporter ();

require Win32::Console;

@ISA = qw(Exporter);
@EXPORT_OK = qw(chars pixels);

$VERSION = '0.204';

=head1 NAME

Term::Size::Win32 - Perl extension for retrieving terminal size (Win32 version)

=head1 SYNOPSIS

    use Term::Size;

    ($columns, $rows) = Term::Size::chars *STDOUT{IO};
    ($x, $y) = Term::Size::pixels;

=head1 DESCRIPTION

B<Term::Size> is a Perl module which provides a straightforward way to
retrieve the terminal size.

Both functions take an optional filehandle argument, which defaults to
C<*STDIN{IO}>.  They both return a list of two values, which are the
current width and height, respectively, of the terminal associated with
the specified filehandle.

C<Term::Size::chars> returns the size in units of characters, whereas
C<Term::Size::pixels> uses units of pixels.

In a scalar context, both functions return the first element of the
list, that is, the terminal width.

The functions may be imported.

If you need to pass a filehandle to either of the C<Term::Size>
functions, beware that the C<*STDOUT{IO}> syntax is only supported in
Perl 5.004 and later.  If you have an earlier version of Perl, or are
interested in backwards compatibility, use C<*STDOUT> instead.

  To be true, you don't need a Win32 machine to run this module. 
  You need a working B<Win32::Console>. Of course, it is
  easier if you are in Win32.

=head1 EXAMPLES

1. Refuse to run in a too narrow window.

    use Term::Size;

    die "Need 80 column screen" if Term::Size::chars *STDOUT{IO} < 80;

2. Track window size changes. (Well, this is not for you, Windows users.)

    use Term::Size 'chars';

    my $changed = 1;

    while (1) {
            local $SIG{'WINCH'} = sub { $changed = 1 };

            if ($changed) {
                    ($cols, $rows) = chars;
                    # Redraw, or whatever.
                    $changed = 0;
            }
    }

=head1 RETURN VALUES

Both functions return C<undef> if there is an error.

If the terminal size information is not available, the functions
will normally return C<(0, 0)>, but this depends on your system.  On
character only terminals, C<pixels> will normally return C<(0, 0)>.
To be true, in Win32, it I<always> return C<(0, 0)>.

=head1 BUGS

This version only works on Win32 systems.

I lied about the function argument: it is ignored by now, 
always using STD_INPUT_HANDLE. Need to work this out: 
mapping tty devices to appropriate Windows handles.
(See Win32::Console docs.)

=head1 TODO

Unify this with Term-Size.

=head1 AUTHOR

Tim Goodwin, <tim@uunet.pipex.com>, 1997-04-23. (The author of the
original Unix-only version of this module.)

Adriano Ferreira, <ferreira@cpan.org>, 2006-05-19.

=cut

sub chars {
    my @size = Win32::Console->new()->Size();  # FIXME
    return @size if wantarray;
    return $size[0];
}

sub pixels {
    return (0, 0) if wantarray;
    return 0;
}

1;

__END__
