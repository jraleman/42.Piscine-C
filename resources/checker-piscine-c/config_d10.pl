

ex01
ft_foreach(int* tab, int length, void (*f)(int))
main ====

void putnbr(int n)
{
	printf("%d,", n);
}

int main()
{
	int test1[] = {1,2,3,4,5};
	int test2[] = {-25,0,20,45};
	int test3[] = {5};
	
	ft_foreach(test1, 5, putnbr);
	printf("\n");
	ft_foreach(test2, 3, putnbr);
	printf("\n");
	ft_foreach(test3, 0, putnbr);
	printf("\n");
}


==== check -e ====
$expected = "1,2,3,4,5,\n-25,0,20,\n\n";
====


ex02
int* ft_map(int* tab, int length, int(*f)(int))
main ====

int inc_num(int n)
{
	return n + 5;
}

int main()
{
	int test1[] = {1,2,3,4,5};

	int* res = ft_map(test1, 5, inc_num);
	for (int i = 0; i < 5; i++)
		printf("%d,", res[i]);
	printf("\n");

	free(res);

	int test2[] = {-25,0,20,45};

	res = ft_map(test2, 3, inc_num);
	for (int i = 0; i < 3; i++)
		printf("%d,", res[i]);
	printf("\n");

	free(res);

	int test3[] = {5};

	res = ft_map(test3, 0, inc_num);
	for (int i = 0; i < 0; i++)
		printf("%d,", res[i]);
	printf("\n");
	
	free(res);

}
==== check -e ====
$expected = "6,7,8,9,10,\n-20,5,25,\n\n";
====


ex03
int ft_any(char** tab, int (*f)(char*))
main ====

int starts_with_z(char* str)
{
	return str[0] == 'z';
}

int main(int argc, char** argv)
{
	printf("%d", ft_any(argv + 1, starts_with_z));
	if (argc < 2)
		return 1;
}
==== check -t ====
%tests = (
	"$program" => 0,
	"$program asdf" => 0,
	"$program z" => 1,
	"$program asdf zxcv" => 1,
	"$program asdf qwer zxcv uiop hjkl" => 1,
	"$program asdf qwer xcv uiop hjkl" => 0,
	"$program '' '' z '' ''" => 1,
	"$program '' '' a '' ''" => 0,
	"$program zxcv asdf" => 1,
	"$program zxcv asdf z zz zxcv" => 1,
	"$program a a a a a a a a a a a a a a a" => 0,
);
====


ex04
int ft_count_if(char** tab, int (*f)(char*))
main ====

int starts_with_z(char* str)
{
	return str[0] == 'z';
}

int main(int argc, char** argv)
{
	printf("%d", ft_count_if(argv + 1, starts_with_z));
	if (argc < 2)
		return 0;
}
==== check -t ====
%tests = (
	"$program" => 0,
	"$program asdf" => 0,
	"$program z" => 1,
	"$program asdf zxcv" => 1,
	"$program asdf qwer zxcv uiop hjkl" => 1,
	"$program asdf qwer xcv uiop hjkl" => 0,
	"$program '' '' z '' ''" => 1,
	"$program '' '' a '' ''" => 0,
	"$program zxcv asdf" => 1,
	"$program zxcv asdf zxcv" => 2,
	"$program z z z z z" => 5,
	"$program asdf qwer io uiop zxcxcvzzzzzz" => 1,
);
====


ex05
int ft_is_sort(int* tab, int length, int (*f)(int, int))
main ====

int cmpnbr(int a, int b)
{
	return a - b;
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 0;
	int test[argc - 1];
	for (int i = 1; i < argc; i++)
		test[i - 1] = atoi(argv[i]);
	
	printf("%d", ft_is_sort(test, argc - 1, cmpnbr));
}
==== check -t ====
%tests = (
	"$program" => 1,
	"$program 5" => 1,
	"$program 1 5" => 1,
	"$program 5 1" => 0,
	"$program -1 5" => 1,
	"$program 1 -5" => 0,
	"$program 1 1" => 1,
	"$program 1 2 3 4 5" => 1,
	"$program 1 2 3 4 5 6 7 8 9" => 1,
	"$program 1 2 3 4 5 6 7 8 7" => 0,
	"$program 1 2 3 4 5 8 7 8 9" => 0,
	"$program 3 2 3 4 5 6 7 8 9" => 0,
);
====


ex07
ft_sort_wordtab(char** tab)
main ====
int main(int argc, char** argv)
{
	if (argc < 1)
		return 0;
	ft_sort_wordtab(argv + 1);
	for (char** iter = argv + 1; *iter != 0; iter++)
		printf("%s,", *iter);
}
==== check -t ====
%tests = (
	"$program" => '',
	"$program a" => 'a,',
	"$program c b a" => 'a,b,c,',
	"$program b c a" => 'a,b,c,',
	"$program a c b" => 'a,b,c,',
	"$program c b a d" => 'a,b,c,d,',
	"$program a b" => 'a,b,',
	"$program b a" => 'a,b,',
	"$program asdf asde asdd" => 'asdd,asde,asdf,',
);
====




ex08
ft_advanced_sort_wordtab(char** tab, int(*cmp)(char*, char*))
main ====

int my_reverse_strcmp(char* s1, char* s2)
{
	while (*s1 == *s2 && *s1 != 0)
	{
		s1++;
		s2++;
	}
	return *s2 - *s1;
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 1;
	ft_advanced_sort_wordtab(argv + 1, my_reverse_strcmp);
	
	for (char** iter = argv + 1; *iter != 0; iter++)
		printf("%s,", *iter);
}
==== check -t ====
%tests = (
	"$program" => '',
	"$program a" => 'a,',
	"$program c b a" => 'c,b,a,',
	"$program b c a" => 'c,b,a,',
	"$program a c b" => 'c,b,a,',
	"$program c b a d" => 'd,c,b,a,',
	"$program a b" => 'b,a,',
	"$program b a" => 'b,a,',
	"$program asdf asde asdd" => 'asdf,asde,asdd,',
);
====












