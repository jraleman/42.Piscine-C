ex00
ft_putstr(char *str)
main -m ====
ft_putstr("asdf");
ft_putstr(" qwerty\n");
ft_putstr("zxcv");
==== check -e ====
$expected = "asdf qwerty\nzxcv";
====


ex01
ft_putnbr(int nb)
main_basic -m ====
ft_putnbr(123456);
==== check_basic -e ====
$expected = '123456';
==== main_negative -m ====
ft_putnbr(-987654321);
==== check_negative -e ====
$expected = '-987654321';
==== main_zero -m ====
ft_putnbr(0);
==== check_zero -e ====
$expected = '0';
==== main_intmax -m ====
ft_putnbr(2147483647);
==== check_intmax -e ====
$expected = '2147483647';
==== main_intnmax -m ====
ft_putnbr(-2147483648);
==== check_intnmax -e ====
$expected = '-2147483648';
====


ex02
int ft_atoi(char *str)
main_basic -p -m ====
$code = 'int res; int exp;';
my @tests = qw/ 0 15 -25 12345 987654321 -34567 2147483647 -2147483648 /;
foreach (@tests) {
	$code .= "res = ft_atoi(\"$_\"), exp = $_;\n";
	$code .= "printf(\"ft_atoi('$_') ($_ vs %d) -> %d\\n\", res, res == exp);\n";
}
==== check_basic -l=6 ====
==== main_junk -m ====
TEST(ft_atoi("\t\n\v\f\r +256"), 256);
TEST(ft_atoi("256a99999"), 256);
==== check_jump -l=2 ====
====


ex03
char* ft_strcpy(char* dest, char* src)
main -m ====
char test1[256] = "asdf";
printf("%s", ft_strcpy(test1, "qwerty\n"));
printf("%s", ft_strcpy(test1, ""));
printf("%s", ft_strcpy(test1, "hell0\n"));
==== check -e ====
$expected = "qwerty\nhell0\n";
====


ex04
char* ft_strncpy(char* dest, unsigned int n)
main -m ====
char test1[256] = "asdf";
printf("%s\n", ft_strncpy(test1, "uiop", 5));
printf("%s\n", ft_strncpy(test1, "qwerty", 4));
printf("%s\n", ft_strncpy(test1, "z", 1));
==== check -e ====
$expected = "uiop\nqwer\nzwer\n";
====


ex05
char* ft_strstr(char* str, char* to_find)
main -m ====
printf("%s\n", ft_strstr("asdf qwerty", "wer"));
printf("%s\n", ft_strstr("asdf qwerty qwerty", "wer"));
printf("%s\n", ft_strstr("asdf qwerty", "qwerty1"));
printf("%s\n", ft_strstr("", "wer"));
printf("%s\n", ft_strstr("asdf qwerty", "zxcv"));
printf("%s\n", ft_strstr("asdf qwerty", ""));
==== check -e ====
$expected = "werty\nwerty qwerty\n(null)\n(null)\n(null)\nasdf qwerty\n";
====


ex06
int ft_strcmp(char* s1, char* s2)
main -p -m ====
my %tests = (
	asdf_asdf => 0,
	asde_asdf => -1,
	asdg_asdf => 1,
	_ => 0,
	A_ => 0x41,
	_A => -0x41,
);

$code = 'int exp, res;';
foreach (sort keys %tests) {
	my ($left, $right) = split '_', $_;
	$code .= "res = ft_strcmp(\"$left\", \"$right\"), exp = $tests{$_};\n";
	$code .= "printf(\"ft_strcmp('$left', '$right') (%d vs %d) -> %d\\n\", exp, res, res == exp);\n";
}
==== check -l=6 ====
====


ex07
int ft_strncmp(char* s1, char* s2, unsigned int n)
main -p -m ====
my %tests = (
	asdf_asdf_4 => 0,
	asde_asdf_4 => -1,
	asdg_asdf_4 => 1,
	asdf_asdf_3 => 0,
	asde_asdf_3 => 0,
	__0 => 0,
);
$code = 'int res, exp;';
foreach (sort keys %tests) {
	my ($left, $right, $len) = split _ => $_;
	$code .= "res = ft_strncmp(\"$left\", \"$right\", $len), exp = $tests{$_};\n";
	$code .= "printf(\"ft_strncmp('$left', '$right', $len) (%d vs %d) -> %d\\n\", exp, res, res == exp);\n";
}
==== check -l=6 ====
====


ex08
char* ft_strupcase(char* str)
main -m ====
char str[] = "asdf qWeRtY ZXCV";
printf("%s", ft_strupcase(str));
==== check -e ====
$expected = 'ASDF QWERTY ZXCV';
====


ex09
char* ft_strlowcase(char* str)
main -m ====
char str[] = "asdf qWeRtY ZXCV";
printf("%s", ft_strlowcase(str));
==== check -e ====
$expected = 'asdf qwerty zxcv';
====

ex10
char* ft_strcapitalize(char* str)
main -m ====
char str[] = "asdf qWeRtY ZXCV 100TIS";
printf("%s", ft_strcapitalize(str));
==== check -e ====
$expected = 'Asdf Qwerty Zxcv 100tis';
====

ex11
int ft_str_is_alpha(char* str)
main -p -m ====
my %tests = (
	asdf => 1,
	QWERTY => 1,
	asdf1234 => 0,
	'999' => 0,
	'' => 1,
);
$code = join '', map "TEST(ft_str_is_alpha(\"$_\"), $tests{$_});\n", sort keys %tests;
==== check -l=5 ====
====


ex12
int ft_str_is_numeric(char* str)
main -p -m ====
my %tests = (
	123456 => 1,
	asdf1234 => 0,
	0 => 1,
	'' => 1,
	'12345asdf' => 0,
);
$code = join '', map "TEST(ft_str_is_numeric(\"$_\"), $tests{$_});\n", sort keys %tests;
==== check -l=5 ====
====


ex13
int ft_str_is_lowercase(char* str)
main -p -m ====
my %tests = (
	asdf => 1,
	asdF => 0,
	ASDF => 0,
	1234 => 0,
	'' => 1,
);
$code = join '', map "TEST(ft_str_is_lowercase(\"$_\"), $tests{$_});\n", sort keys %tests;
==== check -l=5 ====
====


ex14
int ft_str_is_uppercase(char* str)
main -p -m ====
my %tests = (
	ASDF => 1,
	ASDf => 0,
	asdf => 0,
	1234 => 0,
	'' => 1,
);
$code = join '', map "TEST(ft_str_is_uppercase(\"$_\"), $tests{$_});\n", sort keys %tests;
==== check -l=5 ====
====


ex15
int ft_str_is_printable(char* str)
main -p -m ====
my %tests = (
	asdf => 1,
	1234 => 1,
	ASDF => 1,
	'!@#$^&*()_+-=[]{}:;,./<>?' => 1,
	"\\xf0" => 0,
	"\\x7f" => 0,
	"\\n" => 0,
	'' => 1,
);
$code = join '', map "TEST(ft_str_is_printable(\"$_\"), $tests{$_});\n", sort keys %tests;
==== check -l=8 ====
====


ex16
char* ft_strcat(char* dest, char* src)
main -m ====
char test[256] = "";
printf("%s\n", ft_strcat(test, "asdf"));
printf("%s\n", ft_strcat(test, ""));
printf("%s\n", ft_strcat(test, "zxcv"));
==== check -e ====
$expected = "asdf\nasdf\nasdfzxcv\n";
====


ex17
char* ft_strncat(char* dest, char* src, int nb)
main -m ====
char test[256] = "\0zxcvzxcvzxcvxzcvzxcvzxcv";
printf("%s\n", ft_strncat(test, "asdf", 16));
printf("%s\n", ft_strncat(test, "", 16));
printf("%s\n", ft_strncat(test, "qwerty", 0));
printf("%s\n", ft_strncat(test, "asdf", 3));
==== check -e ====
$expected = "asdf\nasdf\nasdf\nasdfasd\n";
====


ex18
unsigned int ft_strlcat(char* dest, char* src, unsigned int size)
main -m ====
char test[256] = "\0zxcvzxcvzxcvxzcvzxcv";
printf("%d-", ft_strlcat(test, "asdf", 16));
printf("%s\n", test);
printf("%d-", ft_strlcat(test, "asdf", 6));
printf("%s\n", test);
printf("%d-", ft_strlcat(test, "asdf", 4));
printf("%s\n", test);
printf("%d-", ft_strlcat(test, "", 16));
printf("%s\n", test);
printf("%d-", ft_strlcat(test, "asdf", 0));
printf("%s\n", test);
==== check -e ====
$expected = "4-asdf\n8-asdfa\n8-asdfa\n5-asdfa\n4-asdfa\n";
====


ex19
unsigned int ft_strlcpy(char* dest, char* src, unsigned int size)
main -m ====
char test[256] = "\0zxcvzxcvzxcvxzcvzxcv";
printf("%d-", ft_strlcpy(test, "asdf", 16));
printf("%s\n", test);
printf("%d-", ft_strlcpy(test, "uiop", 0));
printf("%s\n", test);
printf("%d-", ft_strlcpy(test, "qwerty", 4));
printf("%s\n", test);
printf("%d-", ft_strlcpy(test, "", 4));
printf("%s\n", test);

==== check -e ====
$expected = "4-asdf\n4-asdf\n6-qwe\n0-\n";
====



ex20
ft_putnbr_base(int nbr, char* base)
main_basic -m ====
ft_putnbr_base(40, "0123456789abcdef");
==== check_basic -e ====
$expected = "28";
==== main_basic2 -m ====
ft_putnbr_base(31, "0123456789abcdef");
==== check_basic2 -e ====
$expected = "1f";
==== main_binary -m ====
ft_putnbr_base(15, "01");
==== check_binary -e ====
$expected = '1111';
==== main_negative -m ====
ft_putnbr_base(-15, "0123456789");
ft_putnbr_base(-16, "01");
==== check_negative -e ====
$expected = '-15-10000';
==== main_intmax -m ====
ft_putnbr_base(2147483647, "0123456789abcdef");
ft_putnbr_base(-2147483648, "0123456789abcdef");
==== check_intmax -e ====
$expected = '7fffffff-80000000';
====


ex21
int ft_atoi_base(char* str, char* base)
main -p -m ====
my %tests = (
	_15_0123456789 => 15,
	_3f_0123456789abcdef => 63,
	_a_0a => 1,
	'_-15_0123456789' => -15,
	'_-111_01' => -7,

	_a_0 => 0,
	_1_012341234 => 0,
	'_1_01234+' => 0,
	_5_01234 => 0,
	__01234 => 0,
);
foreach (sort keys %tests) {
	my (undef, $str, $base) = split '_';
	$code .= "TEST(ft_atoi_base(\"$str\", \"$base\"), $tests{$_});\n";
}
==== check -l=10 ====
====


ex22
ft_putstr_non_printable(char* str)
main -m ====
ft_putstr_non_printable("asdf\x7f\x1fhi\x01\xfflol");
==== check -e ====
$expected = 'asdf\\7f\\1fhi\\01\\fflol';
====


ex23
void* ft_print_memory(void* addr, unsigned int size)
main -m ====
ft_print_memory("asdfasdfqwertytyzxcvzxcv\0\0\xff\x7f\x01", 29);
==== check -e ====
$expected = 
'00000000: 6173 6466 6173 6466 7177 6572 7479 7479 asdfasdfqwertyty
00000010: 7a78 6376 7a78 6376 0000 ff7f 01        zxcvzxcv.....
';
====





