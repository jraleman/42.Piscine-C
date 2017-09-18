ex00
ft_print_alphabet
main ====
int main()
{
	ft_print_alphabet();
}
====
check -e ====
$expected = join '', 'a' .. 'z';
====



ex01
ft_print_reverse_alphabet
main ====
int main()
{
	ft_print_reverse_alphabet();
}
====
check -e ====
$expected = join '', reverse 'a' .. 'z';
====



ex02
ft_print_numbers
main ====
int main()
{
	ft_print_numbers();
}
====
check -e ====
$expected = join '', '0' .. '9';
====



ex03
ft_is_negative(int n)
main_basic ====
int main()
{
	ft_is_negative(15);
	ft_is_negative(-25);
	ft_is_negative(12345678);
}
====
check_basic -e ====
$expected = 'PNP';
====
main_zero ====
int main ()
{
	ft_is_negative(0);
}
====
check_zero -e ====
$expected = 'P';
====



ex04
ft_print_comb
main ====
int main()
{
	ft_print_comb();
}
====
check -e ====
$expected = join ', ',
	grep {
		my ($a, $b, $c) = split '', $_;
		$a < $b and $b < $c;
	}
	'000' .. '999';
====
main_multiple ====
int main ()
{
	ft_print_comb();
	ft_print_comb();
}
====
check_multiple -e ====
$expected = join ', ',
	grep {
		my ($a, $b, $c) = split '', $_;
		$a < $b and $b < $c;
	}
	'000' .. '999';
$expected = "$expected$expected";
====



ex05
ft_print_comb2
main ====
int main ()
{
	ft_print_comb2();
}
====
check -e ====
$expected = join ', ',
	map { "$_->[0] $_->[1]" }
	grep { $_->[0] < $_->[1] }
	map {
		my $first = $_;
		map { [$first, $_] } '00' .. '99'
	}
	'00' .. '99';
====
main_multiple ====
int main ()
{
	ft_print_comb2();
	ft_print_comb2();
}
====
check_multiple -e ====
$expected = join ', ',
	map { "$_->[0] $_->[1]" }
	grep { $_->[0] < $_->[1] }
	map {
		my $first = $_;
		map { [$first, $_] } '00' .. '99'
	}
	'00' .. '99';
$expected = "$expected$expected";
====



ex06
ft_putnbr(int nb)
main_basic ====
int main ()
{
	ft_putnbr(15);
}
====
check_basic -e ====
$expected = '15';
====
main_negative ====
int main ()
{
	ft_putnbr(-25);
}
====
check_negative -e ====
$expected = '-25';
====
main_zero ====
int main ()
{
	ft_putnbr(0);
}
====
check_zero -e ====
$expected = '0';
====
main_intmax ====
int main ()
{
	ft_putnbr(2147483647);
}
====
check_intmax -e ====
$expected = '2147483647';
====
main_nintmax ====
int main ()
{
	ft_putnbr(-2147483648);
}
====
check_nintmax -e ====
$expected = -2147483648;
====



ex07
ft_print_combn(int n)
main_comb1 ====
int main ()
{
	ft_print_combn(1);
}
====
check_comb1 -e ====
$expected = join ', ', '0' .. '9';
====
main_comb2 ====
int main ()
{
	ft_print_combn(2);
}
====
check_comb2 -e ====
$expected = join ', ',
	grep {
		my ($a, $b) = split '', $_;
		$a < $b
	}
	'00' .. '99';
====
main_comb3 ====
int main ()
{
	ft_print_combn(3);
}
====
check_comb3 -e ====
$expected = join ', ',
	grep {
		my ($a, $b, $c) = split '', $_;
		$a < $b and $b < $c
	}
	'000' .. '999';
====
main_comb_multiple ====
int main ()
{
	ft_print_combn(1);
	ft_print_combn(2);
	ft_print_combn(1);
}
====
check_comb_multiple -e ====
$expected = join ', ', '0' .. '9';
$expected .= join ', ',
	grep {
		my ($a, $b) = split '', $_;
		$a < $b
	}
	'00' .. '99';
$expected .= join ', ', '0' .. '9';
====
