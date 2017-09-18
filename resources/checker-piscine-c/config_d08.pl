
ex00
char** ft_split_whitespaces(char* str)
main_basic -m ====
char** res;
for (res = ft_split_whitespaces("asdf qwerty zxcv"); *res != 0; res++)
	printf("'%s',", *res);
printf("\n");
for (res = ft_split_whitespaces("s1   s2 \t\n\t\ns3"); *res != 0; res++)
	printf("'%s',", *res);
printf("\n");
==== check_basic -e ====
$expected = "'asdf','qwerty','zxcv',
's1','s2','s3',
";
==== main_junk -m ====
char** res;
for (res = ft_split_whitespaces("   \t\nlol hi    \t\n"); *res != 0; res++)
	printf("'%s',", *res);
==== check_junk -e ====
$expected = "'lol','hi',";
==== main_less -m ====
char** res;
for (res = ft_split_whitespaces("   \t\n"); *res != 0; res++)
	printf("'%s',", *res);
printf("\n");
for (res = ft_split_whitespaces(""); *res != 0; res++)
	printf("'%s',", *res);
printf("\n");
==== check_less -e ====
$expected = "\n\n";
====


ex01 -N -f=ft.h
ft
source_mock_stuff ====
#include <stdio.h>

// this is already in stupidity.c
/*void ft_putchar(char c)
{
	c++;
	printf("ft_putchar\n");
}*/
void ft_putstr(char* str)
{
	str++;
	printf("ft_putstr\n");
}
int ft_strcmp(char* s1, char* s2)
{
	s1++;
	s2++;
	printf("ft_strcmp\n");
	return 0;
}

int ft_strlen(char* str)
{
	str++;
	printf("ft_strlen\n");
	return 0;
}

void ft_swap(int* a, int* b)
{
	a++;
	b++;
	printf("ft_swap\n");
}



==== main -f=mock_stuff.c ====
#include "ft.h"
#include <stdio.h>
int main()
{
	ft_putchar('\n');
	ft_putstr(NULL);
	ft_strcmp(NULL,NULL);
	ft_strlen(NULL);
	ft_swap(NULL,NULL);
}
==== check -e ====
$expected = '
ft_putstr
ft_strcmp
ft_strlen
ft_swap
';
====


ex02 -N -f=ft_boolean.h
ft_boolean
main ====
#include "ft_boolean.h"
void ft_putstr(char *str)
{
	while (*str)
		write(1, str++, 1);
}

t_bool ft_is_even(int nbr)
{
	return ((EVEN(nbr)) ? TRUE : FALSE);
}

int main(int argc, char **argv)
{
	(void)argv;
	if (ft_is_even(argc - 1) == TRUE)
		ft_putstr(EVEN_MSG);
	else
		ft_putstr(ODD_MSG);
	return (SUCCESS);
}
==== check -t ====
%tests = (
	"$program" => "I have an even number of arguments.\n",
	"$program asdf" => "I have an odd number of arguments.\n",
	"$program asdf qwerty" => "I have an even number of arguments.\n",
);
====


ex03 -N -f=ft_abs.h
abs
main ====
#include "ft_abs.h"
#include <stdio.h>
int main()
{
	TEST(ABS(15), 15);
	TEST(ABS(0), 0);
	TEST(ABS(-25), 25);
	TEST(ABS(1234567), 1234567);
	TEST(ABS(-1234567), 1234567);
	TEST(ABS(2147483647), 2147483647);
	// im not sure about this one actually... use your head
	TEST(ABS((int)-2147483648), 0);
}
==== check -l=7 ====
====


ex04 -N -f=ft_point.h
point
main ====
#include "ft_point.h"
#include <stdio.h>
void set_point(t_point *point)
{
	point->x = 42;
	point->y = 21;
}
int main(void)
{
	t_point point;
	set_point(&point);
	printf("%d,%d", point.x, point.y);
}
==== check -e ====
$expected = ((('42,21')));
====


ex05 -N -f1=ft_param_to_tab.c -f2=ft_stock_par.h
param
source_split_whitespaces ====
#include <stdlib.h>
int		my_isspace(char c)
{
	return (c == ' ' || c == '\n' || c == '\t');
}

int		my_spaced_strlen(char *str)
{
	int len;

	len = 0;
	while (*str != 0 && !my_isspace(*str))
	{
		len++;
		str++;
	}
	return (len);
}

char	*my_strndup(char *source, int n)
{
	char	*res;
	int		i;

	res = malloc(n + 1);
	if (res == 0)
		return (0);
	i = 0;
	while (i < n)
		res[i++] = *source++;
	res[i] = 0;
	return (res);
}

char	**ft_split_whitespaces(char *str)
{
	char	**res;
	int		i;
	char	*iter;
	char	**dest;

	i = 0;
	iter = str;
	while (*iter != 0)
	{
		i += 0 != my_spaced_strlen(iter);
		iter += my_spaced_strlen(iter);
		iter += *iter != 0;
	}
	res = malloc((i + 1) * sizeof(char*));
	iter = str;
	dest = res;
	while (*iter != 0)
	{
		if (my_spaced_strlen(iter) > 0)
			*dest++ = my_strndup(iter, my_spaced_strlen(iter));
		iter += my_spaced_strlen(iter);
		iter += *iter != 0;
	}
	*dest = 0;
	return (res);
}
==== main -f1=ft_param_to_tab.c -f2=split_whitespaces.c ====
#include "ft_stock_par.h"
struct s_stock_par *ft_param_to_tab(int ac, char **av);
int main(int argc, char** argv)
{
	if (argc == 0)
		return 1;
	struct s_stock_par* params = ft_param_to_tab(argc, argv);
	while (params->str != 0)
	{
		printf("%d,%s,%s, is_duped? %d\n", params->size_param, params->str, params->copy, params->str != params->copy);
		char** words = params->tab;
		while (*words != 0)
		{
			printf("'%s',", *words);
			words++;
		}
		printf("\n");
		params++;
	}
}
==== check -t ====
%tests = (
	"$program" => length($program) . ",$program,$program, is_duped? 1\n'$program',\n",
	"$program 'asdf qwer'" => length($program) . ",$program,$program, is_duped? 1\n'$program',
9,asdf qwer,asdf qwer, is_duped? 1\n'asdf','qwer',\n",
	"$program ' asdf qwer ' ''" => length($program) . ",$program,$program, is_duped? 1\n'$program',
11, asdf qwer , asdf qwer , is_duped? 1\n'asdf','qwer',
0,,, is_duped? 1\n\n",
);
====


ex06 -N -f1=ft_show_tab.c -f2=ft_stock_par.h
show_tab
main_basic -f=ft_show_tab.c ====
#include "ft_stock_par.h"
void ft_show_tab(struct s_stock_par* par);
int main()
{
	t_stock_par stuff[2];
	char* words[] = {"lol","hijack", NULL};
	stuff[0].size_param = 10;
	stuff[0].str = "hello world!";
	stuff[0].copy = "hello world!";
	stuff[0].tab = words;
	
	stuff[1].str = NULL;

	ft_show_tab(stuff);
}
==== check_basic -e ====
$expected = 'hello world!
10
lol
hijack
';
==== main_empty -f=ft_show_tab.c ====
#include "ft_stock_par.h"
void ft_show_tab(struct s_stock_par* par);
int main()
{
	t_stock_par stuff[2];
	char* words[] = {NULL};
	stuff[0].size_param = 0;
	stuff[0].str = "";
	stuff[0].copy = "";
	stuff[0].tab = words;
	
	stuff[1].str = NULL;

	ft_show_tab(stuff);
}
==== check_basic -e ====
$expected = '
0
';
====

















