use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Math::StochasticProcess',
    AUTHOR              => 'Nicholas Bamber <theabbot@silasthemonk.org.uk>',
    VERSION_FROM        => 'lib/Math/StochasticProcess.pm',
    ABSTRACT_FROM       => 'lib/Math/StochasticProcess.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
	'Params::Validate' => 0
    },
    LICENSE		=> 'perl',
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Math-StochasticProcess-*' },
);
