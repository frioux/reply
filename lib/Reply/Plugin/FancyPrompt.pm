package Reply::Plugin::FancyPrompt;
use strict;
use warnings;
# ABSTRACT: provides a more informative prompt

use base 'Reply::Plugin';

=head1 SYNOPSIS

  ; .replyrc
  [FancyPrompt]

=head1 DESCRIPTION

This plugin enhances the default Reply prompt. Currently, the only difference
is that it includes a counter of the number of lines evaluated so far in the
current session.

=cut

sub new {
    my $class = shift;
    my $self = $class->SUPER::new(@_);
    $self->{counter} = 0;
    return $self;
}

sub prompt {
    my $self = shift;
    my ($next) = @_;
    return $self->{counter} . $next->();
}

sub loop {
    my $self = shift;
    $self->{counter}++;
}

1;
