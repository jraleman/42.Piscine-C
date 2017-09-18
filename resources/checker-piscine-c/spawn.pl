#!/usr/bin/env perl
use strict;
use warnings;

use feature 'say';



sub slurp_file {
	my ($file) = @_;

	warn "error opening file $file" and return unless open my $f, '<', $file;
	local $/;
	my $contents = <$f>;
	$f->close;
	
	return $contents
}

sub dump_file {
	my ($file, $contents) = @_;
	
	# warn "creating file $file\n";

	open my $f, '>', $file;
	$f->print($contents);
	$f->close;
}

sub append_file {
	my ($file, $contents) = @_;

	# warn "appending file $file\n";

	open my $f, '>>', $file;
	$f->print($contents);
	$f->close;
}

sub mirror_file {
	my ($file, $destination) = @_;
	my $contents = slurp_file($file);
	dump_file($destination, $contents);
}

sub get_given_function_prototype {
	my ($function, $content) = @_;

	my @protos = split /\r?\n/, $content;
	foreach my $proto (@protos) {
		if ($proto =~ /\A.+\s+\**(\w+)\(.*\);?\Z/) {
			return $proto if $1 eq $function;
		}
	}
	warn "prototype not found for function $function";
	return
}

sub parse_function_ref {
	my ($function) = @_;

	my ($function_name, $function_proto);
	if ($function =~ /\A(\w+)\Z/) {
		$function_name = $1;
		$function_proto = "void	$function_name(void)";
	} elsif ($function =~ /\A(\w+)\((.*)\)\Z/) {
		$function_name = $1;
		$function_proto = "void	$function_name($2)";
	} elsif ($function =~ /\A(.*?) (\w+)\((.*)\)\Z/) {
		$function_name = $2;
		$function_proto = "$1	$function_name($3)";
	} else {
		die "invalid function name: $function";
	}

	return $function_name, $function_proto
}

sub read_file_from_config {
	my ($config, $break) = @_;
	$break = quotemeta $break;
	my $result = '';
	until ($config->[0] =~ /\A$break(?:\s+(.+))?\Z/) {
		die "end of file while looking for break: $break" unless @$config;
		$result .= shift @$config;
		$result .= "\n";
	}

	if ($config->[0] =~ /\A$break(?:\s+(.+))\Z/) {
		$config->[0] = $1;
	} else {
		shift @$config;
	}

	return $result
}

sub parse_flags {
	my ($flags) = @_;
	return map {
			if (/\A(\w+)=(.*)\Z/) {
				$1 => $2
			} else {
				$_ => 1
			}
		} map s/\A-//r, split ' ', $flags
}

sub spawn_source_file {
	my ($exercise, $exercise_flags, $name, $contents, $flags) = @_;

	dump_file("work/$exercise/$name.c", $contents);

	return "work/$exercise/$name.c"
}

sub spawn_header_file {
	my ($exercise, $exercise_flags, $name, $contents, $flags) = @_;

	dump_file("work/$exercise/$name.h", $contents);
	
	return "work/$exercise/$name.h"
}

sub spawn_main_file {
	my ($exercise, $exercise_flags, $name, $contents, $flags) = @_;
	
	my $prefix = "\n\n";
	my $suffix = "\n\n";

	$prefix .= "
		#include <stdio.h>
		#include <stdlib.h>
		#include <string.h>

		#define TEST(EXP, RES) printf(#EXP \" (\" #RES \" vs %d) -> %d\\n\", (EXP), ((EXP)) == (RES))
		#define TEST_STR(EXP, RES) printf(#EXP \" (\" #RES \" vs \\\"%s\\\") -> %d\\n\", (EXP), strcmp(((EXP)), (RES)) == 0)

	";

	if ($flags->{p}) {
		$contents = eval "my \$code = ''; $contents; return \$code";
		die "error compiling main -p: $@" if $@;
	}

	if ($flags->{m}) {
		$prefix .= "\nint main()\n{\n";
		$suffix .= "\nreturn 0;\n}\n";
	}

	dump_file("work/$exercise/$name.c", "$prefix$contents$suffix");

	my $other_files = join ' ', map "work/$exercise/$_", map $flags->{$_}, sort grep /\Af\d*\Z/, keys %$flags;

	append_file('tools/build.sh', "
		echo building work/$exercise/$name
		gcc -Wall -Wextra -Werror stupidity.c $other_files work/$exercise/$name.c -o work/$exercise/$name
	");


	return "work/$exercise/$name.c"
}

sub spawn_check_file {
	my ($exercise, $exercise_flags, $name, $contents, $flags) = @_;


	my $main;
	if ($flags->{m}) {
		$main = "work/$exercise/$flags->{m}";
	} else {
		$main = $exercise_flags->{__LAST_MAIN} // die "check file specified without main!";
	}
	my $prefix = "\n\n";
	my $suffix = "\n\n";

	$prefix .= "
		my \$output = `./$main`;
		my \$expected;
		die \"$main failed to run: \$?\" if \$?;
	" unless $flags->{t};


	$prefix .= "
		my \$count_lines = 0;
		my \$errors = 0;
		foreach my \$line (grep / -> [01]\\Z/, split /\\n/, \$output) {
			\$count_lines++;
			if (\$line !~ / -> 1\\Z/) {
				say \"!!!! ERROR in $main (line \$count_lines): '\$line'\";
				\$errors++;
			}
			# debug
			# else { say \"passing: '\$line'\"; }
		}
		if (\$count_lines < $flags->{l}) {
			say \"!!!! ERROR in $main: expected $flags->{l} lines, got \$count_lines\";
		} elsif (\$errors == 0) {
			say '$main good!';
		}
	" if $flags->{l};

	$prefix .= "my %tests;\n" if $flags->{t};
	$suffix .= "
		my \$errors = 0;
		foreach my \$test (sort keys \%tests) {
			my \$output = `\$test`;
			my \$expected = \$tests{\$test};
			if (\$output ne \$expected) {
				say \"!!!! ERROR in $main test `\$test`: '\$output'\";
				say \"!!!! EXPECTED: '\$expected'\" if defined \$expected;
				\$errors++;
			}
			# else { say \"debug good: \$output\"; }
		}
		if (\$errors == 0) {
			say '$main good!';
		}
	" if $flags->{t};

	$suffix .= "
		if (\$output eq \$expected) {
			say '$main good!';
		} else {
			say \"!!!! ERROR in $main: '\$output'\";
			say \"!!!! EXPECTED: '\$expected'\" if defined \$expected;
		}
	" if $flags->{e};
	
	dump_file("work/$exercise/$name.pl", "#!/usr/bin/env perl
		use strict;
		use warnings;
		use feature 'say';
		
		my \$program = './$main';

		$prefix
		$contents
		$suffix
	");
	append_file('tools/build.sh', "
		cd work/$exercise; make; cd ../..;
	");
	append_file('tools/check_all.sh', "
		perl work/$exercise/$name.pl
	");
	return "work/$exercise/$name.pl"
}








sub main {
	my ($project_directory, $config_file) = @_;

	die "project_directory required" unless defined $project_directory;
	die "config file required" unless defined $config_file;

	mkdir 'tools';
	mkdir 'work';

	dump_file('tools/build.sh', "#!/bin/sh\n\n");
	dump_file('tools/verify.sh', "#!/bin/sh\n\n norminette -R CheckForbiddenSourceHeader");
	dump_file('tools/check_all.sh', "#!/bin/sh\n\n");

	chmod 0755, 'tools/build.sh', 'tools/verify.sh', 'tools/check_all.sh';

	my @config = grep $_ ne '', split /\r?\n/, slurp_file($config_file);

	EXERCISE: while (@config) {
		my $thing = shift @config;
		if ($thing =~ /\A((?:main|check)\w*)(?: (-\w+(?:=\S+)?(?: -\w+(?:=\S+)?)*))? (=.*=)\Z/) {
			(undef) = read_file_from_config(\@config, $3);
			next;
		}
		my $exercise = $thing;
		my $function = shift @config;
		die "invalid exercise name $exercise" unless $exercise =~ /\A(\S+)(?: (-\w+(?:=\S+)?(?: -\w+(?:=\S+)?)*))?\Z/;
		$exercise = $1;
		my %exercise_flags;
		%exercise_flags = parse_flags($2) if defined $2;

		if ($exercise_flags{N}) {
			
			warn "\npreparing $exercise\n";

			my @exercise_files = map $exercise_flags{$_}, sort grep /\Af\d*\Z/, keys %exercise_flags;
			my @exercise_globs = map $exercise_flags{$_}, sort grep /\AF\d*\Z/, keys %exercise_flags;
			unless (-e -d "$project_directory/$exercise") {
				warn "missing directory $project_directory/$exercise, skipping...";
				next;
			}
			foreach my $file (@exercise_files) {
				unless (-e -f "$project_directory/$exercise/$file") {
					warn "missing project file $project_directory/$exercise/$file, skipping...";
					next EXERCISE;
				}
			}
			
			mkdir "work/$exercise";
			
			foreach my $glob (@exercise_globs) {
				foreach my $file_path (<$project_directory/$exercise/$glob>) {
					my $file = $file_path =~ s/\A.*\/([^\/]+)\Z/$1/r;
					warn "mirroring into work/$exercise/$file\n";
					append_file('tools/verify.sh', " work/$exercise/$file") if $file =~ /\.[hc]\Z/;
					mirror_file("$file_path", "work/$exercise/$file");
				}
			}
			foreach my $file (@exercise_files) {
				warn "mirroring into work/$exercise/$file\n";
				append_file('tools/verify.sh', " work/$exercise/$file") if $file =~ /\.[hc]\Z/;
				mirror_file("$project_directory/$exercise/$file", "work/$exercise/$file");
			}

			while (@config and $config[0] =~ /\A(?:(check|source|header|main)(?:_(\w+))?)(?: (-\w+(?:=\S+)?(?: -\w+(?:=\S+)?)*))? (=.*=)\Z/) {
				shift @config;

				my $spawn_type = $1;
				my $spawn_name = defined $2 ? $2 : $1;
				my %spawn_flags;
				my $break = $4;
				%spawn_flags = parse_flags($3) if defined $3;
				
				my $spawn_contents = read_file_from_config(\@config, $break);
				
				my $file;
				if ($spawn_type eq 'source') {
					$file = spawn_source_file($exercise, \%exercise_flags, $spawn_name, $spawn_contents, \%spawn_flags);
				} elsif ($spawn_type eq 'header') {
					$file = spawn_header_file($exercise, \%exercise_flags, $spawn_name, $spawn_contents, \%spawn_flags);
				} elsif ($spawn_type eq 'main') {
					$file = spawn_main_file($exercise, \%exercise_flags, $spawn_name, $spawn_contents, \%spawn_flags);
					$exercise_flags{__LAST_MAIN} = "work/$exercise/$spawn_name";
				} else {
					$file = spawn_check_file($exercise, \%exercise_flags, $spawn_name, $spawn_contents, \%spawn_flags);
				}
				warn "$spawn_name at $file\n";
			}

		} elsif ($exercise_flags{p}) {
			my $program_name = $function;
			
			warn "\npreparing $exercise/$program_name\n";

			unless (-e -d "$project_directory/$exercise") {
				warn "missing directory $project_directory/$exercise, skipping...";
				next;
			}
			unless (-e -f "$project_directory/$exercise/$program_name.c") {
				warn "missing project file $project_directory/$exercise/$program_name.c, skipping...";
				next;
			}
			
			mkdir "work/$exercise";
			
			mirror_file("$project_directory/$exercise/$program_name.c", "work/$exercise/$program_name.c");
			
			append_file('tools/verify.sh', " work/$exercise/$program_name.c");
			append_file('tools/build.sh', "
				echo building work/$exercise/$program_name
				gcc -Wall -Wextra -Werror stupidity.c work/$exercise/$program_name.c -o work/$exercise/$program_name
			");
			
			while (@config and $config[0] =~ /\A(check\w*)(?: (-\w(?:=\S+)?(?: -\w(?:=\S+)?)*))? (=.*=)\Z/) {
				shift @config;
				my $check_file = "$1.pl";
				my %check_flags;
				%check_flags = parse_flags($2) if defined $2;
				my $break = $3;
				warn "$check_file at work/$exercise/$check_file\n";
				
				my $prefix = "\n\n";
				my $suffix = "\n\n";
				my $contents = read_file_from_config(\@config, $break);
				
				$prefix .= "my %tests;\n" if $check_flags{t};
				$suffix .= "
					my \$errors = 0;
					foreach my \$test (sort keys \%tests) {
						\$output = `\$test`;
						\$expected = \$tests{\$test};
						if (\$output ne \$expected) {
							say \"!!!! ERROR in work/$exercise/$check_file test `\$test`: '\$output'\";
							say \"!!!! EXPECTED: '\$expected'\" if defined \$expected;
							\$errors++;
						}
						# else { say \"debug good: \$output\"; }
					}
					if (\$errors == 0) {
						say 'work/$exercise/$check_file good!';
					}
				" if $check_flags{t};

				$suffix .= "
					if (\$output eq \$expected) {
						say 'work/$exercise/$check_file good!';
					} else {
						say \"!!!! ERROR in work/$exercise/$check_file: '\$output'\";
						say \"!!!! EXPECTED: '\$expected'\" if defined \$expected;
					}
				" if $check_flags{e};
				
				dump_file("work/$exercise/$check_file", "#!/usr/bin/env perl
					use strict;
					use warnings;
					use feature 'say';

					my \$program = './work/$exercise/$program_name';
					my \$output;
					my \$expected;

					$prefix
					$contents
					$suffix
				");
				append_file('tools/check_all.sh', "
					perl work/$exercise/$check_file
				");
			}

		} else {

			my ($function_name, $function_proto) = parse_function_ref($function);
			
			warn "\npreparing $exercise/$function_name\n";

			unless (-e -d "$project_directory/$exercise") {
				warn "missing directory $project_directory/$exercise, skipping...";
				next;
			}
			unless (-e -f "$project_directory/$exercise/$function_name.c") {
				warn "missing project file $project_directory/$exercise/$function_name.c, skipping...";
				next;
			}
			my $exercise_contents = slurp_file("$project_directory/$exercise/$function_name.c");
			my $import_proto = get_given_function_prototype($function_name, $exercise_contents);
			unless (defined $import_proto) {
				warn "missing prototype $function_name, skipping...";
				next;
			}
			
			mkdir "work/$exercise";
			
			warn "mirroring into work/$exercise/$function_name.c\n";
			mirror_file("$project_directory/$exercise/$function_name.c", "work/$exercise/$function_name.c");

			append_file('tools/verify.sh', " work/$exercise/$function_name.c");

			while (@config and $config[0] =~ /\A(main\w*)(?: (-\w(?:=\S+)?(?: -\w(?:=\S+)?)*))? (=.*=)\Z/) {
				shift @config;
				my $main_file = $1;
				my %main_flags;
				%main_flags = parse_flags($2) if defined $2;
				my $contents = read_file_from_config(\@config, $3);
				warn "$main_file at work/$exercise/$main_file.c\n";

				my $prefix = "
					#include <stdio.h>
					#include <stdlib.h>
					#include <string.h>

					#define TEST(EXP, RES) printf(#EXP \" (\" #RES \" vs %d) -> %d\\n\", (EXP), ((EXP)) == (RES))
					#define TEST_STR(EXP, RES) printf(#EXP \" (\" #RES \" vs \\\"%s\\\") -> %d\\n\", (EXP), strcmp(((EXP)), (RES)) == 0)

					$import_proto;
				";

				my $suffix = "\n\n";

				if ($main_flags{p}) {
					$contents = eval "my \$code = ''; $contents; return \$code";
					die "error compiling main -p: $@" if $@;
				}

				if ($main_flags{m}) {
					$prefix .= "\nint main()\n{\n";
					$suffix .= "\nreturn 0;\n}\n";
				}
				dump_file("work/$exercise/$main_file.c", "$prefix$contents$suffix");
				append_file('tools/build.sh', "
					echo building work/$exercise/$main_file
					gcc -Wall -Wextra -Werror stupidity.c work/$exercise/$function_name.c work/$exercise/$main_file.c -o work/$exercise/$main_file
				");
				while (@config and $config[0] =~ /\A(check\w*)(?: (-\w(?:=\S+)?(?: -\w(?:=\S+)?)*))? (=.*=)\Z/)
				{
					shift @config;
					my $check_file = "$1.pl";
					my %check_flags;
					%check_flags = parse_flags($2) if defined $2;
					my $break = $3;
					warn "$check_file at work/$exercise/$check_file\n";
					
					my $prefix = "\n\n";
					my $suffix = "\n\n";
					my $contents = read_file_from_config(\@config, $break);

					$prefix .= "
						\$output = `\$program`;
					" unless $check_flags{t};

					$prefix .= "
						my \$count_lines = 0;
						my \$errors = 0;
						foreach my \$line (grep / -> [01]\\Z/, split /\\n/, \$output) {
							\$count_lines++;
							if (\$line !~ / -> 1\\Z/) {
								say \"!!!! ERROR in work/$exercise/$main_file (line \$count_lines): '\$line'\";
								\$errors++;
							}
							# debug
							# else { say \"passing: '\$line'\"; }
						}
						if (\$count_lines < $check_flags{l}) {
							say \"!!!! ERROR in work/$exercise/$main_file: expected $check_flags{l} lines, got \$count_lines\";
						} elsif (\$errors == 0) {
							say 'work/$exercise/$main_file good!';
						}
					" if $check_flags{l};
					$suffix .= "
						if (\$output eq \$expected) {
							say 'work/$exercise/$main_file good!';
						} else {
							say \"!!!! ERROR in work/$exercise/$main_file: '\$output'\";
							say \"!!!! EXPECTED: '\$expected'\" if defined \$expected;
						}
					" if $check_flags{e};
				$prefix .= "my %tests;\n" if $check_flags{t};
				$suffix .= "
					my \$errors = 0;
					foreach my \$test (sort keys \%tests) {
						\$output = `\$test`;
						\$expected = \$tests{\$test};
						if (\$output ne \$expected) {
							say \"!!!! ERROR in work/$exercise/$check_file test `\$test`: '\$output'\";
							say \"!!!! EXPECTED: '\$expected'\" if defined \$expected;
							\$errors++;
						}
						# else { say \"debug good: \$output\"; }
					}
					if (\$errors == 0) {
						say 'work/$exercise/$check_file good!';
					}
				" if $check_flags{t};
					
					dump_file("work/$exercise/$check_file", "#!/usr/bin/env perl
						use strict;
						use warnings;
						use feature 'say';
						
						my \$program = './work/$exercise/$main_file';
						my \$output;
						my \$expected;
						die \"$exercise/$main_file failed to run: \$?\" if \$?;

						$prefix
						$contents
						$suffix
					");
					append_file('tools/check_all.sh', "
						perl work/$exercise/$check_file
					");
				}
			}
		}
	}

}



caller or main(@ARGV);

