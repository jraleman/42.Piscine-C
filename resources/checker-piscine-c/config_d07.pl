ex00
char* ft_strdup(char* src)
main -m ====
char* str;
char* res;
str = "asdf", res = ft_strdup(str);
printf("%d, '%s' vs '%s'\n", res != str, res, str);
str = "", res = ft_strdup(str);
printf("%d, '%s' vs '%s'\n", res != str, res, str);
str = "hello world!", res = ft_strdup(str);
printf("%d, '%s' vs '%s'\n", res != str, res, str);
==== check -e ====
$expected = "1, 'asdf' vs 'asdf'
1, '' vs ''
1, 'hello world!' vs 'hello world!'
";
====


ex01
int* ft_range(int min, int max)
main -m ====
int* res;
int i;
res = ft_range(5, 10);
for (i = 0; i < 5; i++)
	printf("%d,", res[i]);
printf("\n");

res = ft_range(-20, -15);
for (i = 0; i < 5; i++)
	printf("%d,", res[i]);
printf("\n");

res = ft_range(100, 101);
for (i = 0; i < 1; i++)
	printf("%d,", res[i]);
printf("\n");

res = ft_range(10, 5);
printf("%x\n", (unsigned int)res);
==== check -e ====
$expected = '5,6,7,8,9,
-20,-19,-18,-17,-16,
100,
0
';
====


ex02
int ft_ultimate_range(int **range, int min, int max)
main -m ====
int* res = NULL;
int i;
int size;

size = ft_ultimate_range(&res, 5, 10);
printf("is_null? %d\n", res == NULL);
for (i = 0; i < 5; i++)
	printf("%d,", res[i]);
printf("\n");

res = NULL;
size = ft_ultimate_range(&res, -20, -17);
printf("is_null? %d\n", res == NULL);
for (i = 0; i < 3; i++)
	printf("%d,", res[i]);
printf("\n");

res = (int*)1;
size = ft_ultimate_range(&res, 10, 5);
printf("is_null? %d\n", res == NULL);
==== check -e ====
$expected = 'is_null? 0
5,6,7,8,9,
is_null? 0
-20,-19,-18,
is_null? 1
';
====


ex03
char* ft_concat_params(int argc, char** argv)
main_basic -m ====
char* arr[5] = {"NO", "YES", "ARG2", "ARG3", NULL};
printf("%s", ft_concat_params(4, arr));
==== check_basic -e ====
$expected = 'YES
ARG2
ARG3';
==== main_short -m ====
char* arr[3] = {"NO", "YES", NULL};
printf("%s", ft_concat_params(2, arr));
==== check_short -e ====
$expected = 'YES';
==== main_empty -m ====
char* arr[2] = {"NO", NULL};
printf("%s", ft_concat_params(1, arr));
==== check_empty -e ====
$expected = '';
====


ex04
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


ex05
void ft_print_words_tables(char **tab)
main_basic -m ====
char* table[] = {"asdf","qwerty","zxcv", NULL};
ft_print_words_tables(table);
==== check_basic -e ====
$expected = 'asdf
qwerty
zxcv
';
==== main_empty -m ====
char* table[] = {NULL};
ft_print_words_tables(table);
==== check_empty -e ====
$expected = '';
====


ex06
char* ft_convert_base(char* nbr, char* base_from, char* base_to)
main -m ====
TEST_STR(ft_convert_base("15", "0123456789", "01"), "1111");
TEST_STR(ft_convert_base("10000", "01", "0123456789"), "16");
TEST_STR(ft_convert_base("-31", "0123456789", "0123456789abcdef"), "-1f");
TEST_STR(ft_convert_base("+1f", "0123456789abcdef", "0123456789"), "31");
TEST_STR(ft_convert_base("0", "0123456789", "0123456789abcdef"), "0");
TEST_STR(ft_convert_base("0.1234567", "0123456789", "0123456789"), "0");
TEST_STR(ft_convert_base("2147483647", "0123456789", "0123456789abcdef"), "7fffffff");
TEST_STR(ft_convert_base("-80000000", "0123456789abcdef", "0123456789"), "-2147483648");
==== check -l=8 ====
====


ex07
char** ft_split(char *str, char *charset)
main_basic -m ====
char** res;
for (res = ft_split("asdf qwerty zxcv", " "); *res != 0; res++)
	printf("'%s',", *res);
printf("\n");
for (res = ft_split("s1_s2___++++___s3", "_+"); *res != 0; res++)
	printf("'%s',", *res);
printf("\n");
==== check_basic -e ====
$expected = "'asdf','qwerty','zxcv',
's1','s2','s3',
";
==== main_junk -m ====
char** res;
for (res = ft_split("++++lol_+_+hi____++++___", "_+"); *res != 0; res++)
	printf("'%s',", *res);
==== check_junk -e ====
$expected = "'lol','hi',";
==== main_less -m ====
char** res;
for (res = ft_split("NOPENOPENOPE", "NOPE"); *res != 0; res++)
	printf("'%s',", *res);
printf("\n");
for (res = ft_split("", "NOPE"); *res != 0; res++)
	printf("'%s',", *res);
printf("\n");
==== check_less -e ====
$expected = "\n\n";
====







