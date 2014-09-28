#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Hash::Check;

# Set error type.
$ENV{'ERROR_PURE_TYPE'} = 'Print';

# Tied hash.
tie my %hash, 'Hash::Check', {
        'one' => 1,
        'two' => 2,  
};

# Turn error "Key 'three' doesn't exist.".
print $hash{'three'};

# Output:
# Hash::Check: Key 'three' doesn't exist.