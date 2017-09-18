
ex01 -p
ft_print_program_name
check -t ====
%tests = (
	"$program" => "$program\n",
	"$program a b c" => "$program\n",
);
====


ex02 -p
ft_print_params
check -t ====
%tests = (
	"$program" => "",
	"$program a" => "a\n",
	"$program a b" => "a\nb\n",
	"$program asdf beta char" => "asdf\nbeta\nchar\n",
	"$program 'hello world' !" => "hello world\n!\n",
	"$program '' lol" => "\nlol\n",
);
====


ex03 -p
ft_rev_params
check -t ====
%tests = (
	"$program" => "",
	"$program a" => "a\n",
	"$program a b" => "b\na\n",
	"$program asdf beta char" => "char\nbeta\nasdf\n",
	"$program 'lol hi' test" => "test\nlol hi\n",
	"$program '' !" => "!\n\n",
);
====


ex04 -p
ft_sort_params
check -t ====
%tests = (
	"$program" => "",
	"$program asdf beta char" => "asdf\nbeta\nchar\n",
	"$program abcd abc ab a" => "a\nab\nabc\nabcd\n",
	"$program zxcv '' qwer 1234 asdf" => "\n1234\nasdf\nqwer\nzxcv\n",
);
====

