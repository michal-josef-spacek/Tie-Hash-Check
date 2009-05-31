#------------------------------------------------------------------------------
package Hash::Check;
#------------------------------------------------------------------------------

# Pragmas.
use strict;
use warnings;

# Modules.
use Error::Simple::Multiple qw(err);

# Version.
our $VERSION = 0.01;

# Error level.
$Error::Simple::Multiple::LEVEL = 5;

#------------------------------------------------------------------------------
sub TIEHASH {
#------------------------------------------------------------------------------
# Constructor.

	my ($class, $hash_hr, $stack_ar) = @_;
	if (ref $hash_hr ne 'HASH') {
		err 'Parameter isn\'t hash.';
	}
	if (! $stack_ar) {
		$stack_ar = [];
	}
	if (ref $stack_ar ne 'ARRAY') {
		err 'Stack isn\'t array.';
	}
	my $self = bless {}, $class;
	foreach my $key (keys %{$hash_hr}) {
		if (ref $hash_hr->{$key} eq 'HASH') {
			tie my %tmp, 'Hash::Check', $hash_hr->{$key},
				[@{$stack_ar}, $key];
			$self->{'data'}->{$key} = \%tmp;
		} else {
			$self->{'data'}->{$key} = $hash_hr->{$key};
		}
	}
	$self->{'stack'} = $stack_ar;
	return $self;
}

#------------------------------------------------------------------------------
sub CLEAR {
#------------------------------------------------------------------------------
# Hash clear.

	my $self = shift;
	$self->{'data'} = {};
	return;
}

#------------------------------------------------------------------------------
sub DELETE {
#------------------------------------------------------------------------------
# Hash delete.

	my ($self, $key) = @_;
	delete $self->{'data'}->{$key};
	return;
}

#------------------------------------------------------------------------------
sub EXISTS {
#------------------------------------------------------------------------------
# Hash exists.

	my ($self, $key) = @_;
	return exists $self->{'data'}->{$key};
}

#------------------------------------------------------------------------------
sub FETCH {
#------------------------------------------------------------------------------
# Hash fetch.

	my ($self, $key) = @_;
	if (exists $self->{'data'}->{$key}) {
		return $self->{'data'}->{$key};
	} else {
		my @stack = (@{$self->{'stack'}}, $key);
		err 'Key \''.join('->', @stack).'\' doesn\'t exist.';
		return;
	}
}

#------------------------------------------------------------------------------
sub FIRSTKEY {
#------------------------------------------------------------------------------
# Hash first key.

	my $self = shift;

	# Resets each.
	my $a = scalar keys %{$self->{'data'}};

	return each %{$self->{'data'}};
}

#------------------------------------------------------------------------------
sub NEXTKEY {
#------------------------------------------------------------------------------
# Hash nextkey.

	my $self= shift;
	return each %{$self->{'data'}};
}

#------------------------------------------------------------------------------
sub SCALAR {
#------------------------------------------------------------------------------
# Hash scalar.

	my $self = shift;
	return scalar %{$self->{'data'}};
}

#------------------------------------------------------------------------------
sub STORE {
#------------------------------------------------------------------------------
# Hash store.

	my ($self, $key, $value) = @_;
	$self->{'data'}->{$key} = $value;
	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Hash::Check - TODO

=head1 SYNOPSIS

TODO

=head1 SUBROUTINES

=over 8

=item B<TIEHASH>

TODO

=item B<CLEAR>

TODO

=item B<DELETE>

TODO

=item B<EXISTS>

TODO

=item B<FETCH>

TODO

=item B<FIRSTKEY>

TODO

=item B<NEXTKEY>

TODO

=item B<SCALAR>

TODO

=item B<STORE>

TODO

=back

=head1 ERRORS

 Key '%s' doesn't exist.
 Parameter isn't hash.
 Stack isn't array.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Hash::Check;

 # Tied hash.
 tie my %hash, 'Hash::Check', {
         'one' => 1,
         'two' => 2,  
 };

 # Turn error "Key 'three' doesn't exist.".
 print $hash{'three'};

=head1 DEPENDENCIES

L<Error::Simple::Multiple(3pm)>.

=head1 AUTHOR

Michal Špaček L<tupinek@gmail.com>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
