#!/usr/bin/perl -w

use strict;

use base qw/Exporter/;
use vars qw/@EXPORT/;

@EXPORT = qw/is_near sum/;

sub is_near ($$;@) {
	my ($got, $expected) = (shift, shift);
	@_ = (abs($got - $expected), "<", 0.001, @_);
	goto \&Test::More::cmp_ok;
}

sub sum {
	my $s = 0;
	$s += shift while @_;
	$s;
}

__PACKAGE__

__END__
