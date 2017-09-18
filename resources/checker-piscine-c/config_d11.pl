
ex00 -N -f1=ft_create_elem.c -f2=ft_list.h
lol hi
main -f=ft_create_elem.c ====
#include "ft_list.h"

t_list *ft_create_elem(void *data);

int main()
{
	t_list* item = ft_create_elem("asdf");
	printf("%s\n", (char*)item->data);
	printf("%p\n", item->next);
}
==== check -e ====
$expected = "asdf\n0x0\n";
====




ex01 -N -f1=ft_list_push_back.c -f2=ft_list.h
lol hi
main -f=ft_list_push_back.c ====
#include "ft_list.h"

void ft_list_push_back(t_list **begin_list, void *data);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main()
{
	t_list* list = 0;
	ft_list_push_back(&list, "asdf");
	crap_a_list(list);
	ft_list_push_back(&list, "qwer");
	ft_list_push_back(&list, "zxcv");
	crap_a_list(list);
	list = 0;
	ft_list_push_back(&list, "uiop");
	ft_list_push_back(&list, "hjkl");
	crap_a_list(list);
}
==== check -e ====
$expected = "asdf,\nasdf,qwer,zxcv,\nuiop,hjkl,\n";
====



ex02 -N -f1=ft_list_push_front.c -f2=ft_list.h
lol hi
main -f=ft_list_push_front.c ====
#include "ft_list.h"

void ft_list_push_front(t_list **begin_list, void *data);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main()
{
	t_list* list = 0;
	ft_list_push_front(&list, "asdf");
	crap_a_list(list);
	ft_list_push_front(&list, "qwer");
	ft_list_push_front(&list, "zxcv");
	crap_a_list(list);
	list = 0;
	ft_list_push_front(&list, "uiop");
	ft_list_push_front(&list, "hjkl");
	crap_a_list(list);
}
==== check -e ====
$expected = "asdf,\nzxcv,qwer,asdf,\nhjkl,uiop,\n";
====





ex03 -N -f1=ft_list_size.c -f2=ft_list.h
lol hi
main -f=ft_list_size.c ====
#include "ft_list.h"

int ft_list_size(t_list *begin_list);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

#define CE(data) ft_create_elem(data)

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main()
{
	t_list* list = 0;
	printf("%d\n", ft_list_size(list));
	list = CE("asdf");
	printf("%d\n", ft_list_size(list));
	list->next = CE("qwer");
	list->next->next = CE("zxcv");
	printf("%d\n", ft_list_size(list));
	list = CE("asdf");
	list->next = CE("asdf");
	list->next->next = CE("asdf");
	list->next->next->next = CE("asdf");
	printf("%d\n", ft_list_size(list));
	list->next->next->next->next = CE("asdf");
	printf("%d\n", ft_list_size(list));
}
==== check -e ====
$expected = "0\n1\n3\n4\n5\n";
====


ex04 -N -f1=ft_list_last.c -f2=ft_list.h
lol hi
main -f=ft_list_last.c ====
#include "ft_list.h"

t_list *ft_list_last(t_list *begin_list);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main()
{
	t_list* list = 0;
	printf("%p\n", ft_list_last(list));
	list = CE("asdf");
	printf("%s\n", (char*)(ft_list_last(list)->data));
	list->next = CE("qwer");
	list->next->next = CE("zxcv");
	printf("%s\n", (char*)(ft_list_last(list)->data));
	list = CE("asdf");
	list->next = CE("qwer");
	list->next->next = CE("zxcv");
	list->next->next->next = CE("uiop");
	printf("%s\n", (char*)(ft_list_last(list)->data));
	list->next->next->next->next = CE("hjkl");
	printf("%s\n", (char*)(ft_list_last(list)->data));
}
==== check -e ====
$expected = "0x0\nasdf\nzxcv\nuiop\nhjkl\n";
====



ex05 -N -f1=ft_list_push_params.c -f2=ft_list.h
lol hi
main -f=ft_list_push_params.c ====
#include "ft_list.h"

t_list *ft_list_push_params(int ac, char **av);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main(int argc, char** argv)
{
	t_list* list = ft_list_push_params(argc, argv);
	CL(list);
}
==== check -t ====
%tests = (
	"$program" => "\n",
	"$program asdf" => "asdf,\n",
	"$program asdf qwer" => "qwer,asdf,\n",
	"$program asdf qwer zxcv" => "zxcv,qwer,asdf,\n",
	"$program ''" => ",\n",
	"$program 15 '' 25" => "25,,15,\n",
	"$program wat" => "wat,\n",
);
====



ex06 -N -f1=ft_list_clear.c -f2=ft_list.h
lol hi
main -f=ft_list_clear.c ====
#include "ft_list.h"

void ft_list_clear(t_list **begin_list);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int compare_ints(const int* v1, const int* v2)
{
	return *v1 - *v2;
}

int main()
{
	t_list* l = CE("asdf");
	l->next = CE("qwer");
	l->next->next = CE("zxcv");
	t_list* addresses[] = {l, l->next, l->next->next};
	qsort(addresses, 3, sizeof(t_list*), (int(*)(const void*, const void*))compare_ints);
	
	ft_list_clear(&l);
	// verify that this is set to a null pointer now
	printf("is null? %p\n", l);

	// verify that you freed the addresses by checking with malloc
	// if you freed them correctly, malloc will reuse them for this second batch
	l = CE("asdf");
	l->next = CE("qwer");
	l->next->next = CE("zxcv");
	t_list* addresses2[] = {l, l->next, l->next->next};
	qsort(addresses2, 3, sizeof(t_list*), (int(*)(const void*, const void*))compare_ints);
	printf("address good? %d,%d,%d\n", addresses[0] == addresses[0], addresses[1] == addresses[1], addresses[2] == addresses[2]);
}
==== check -e ====
$expected = "is null? 0x0\naddress good? 1,1,1\n";
====



ex07 -N -f1=ft_list_at.c -f2=ft_list.h
lol hi
main -f=ft_list_at.c ====
#include "ft_list.h"

t_list *ft_list_at(t_list *begin_list, unsigned int nbr);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main()
{
	t_list* list = 0;
	printf("%p\n", ft_list_at(list, 0));
	printf("%p\n", ft_list_at(list, 1));
	printf("%p\n", ft_list_at(list, 100));
	list = CE("asdf");
	printf("%s\n", (char*)(ft_list_at(list, 0)->data));
	printf("%p\n", ft_list_at(list, 1));
	list->next = CE("qwer");
	list->next->next = CE("zxcv");
	list->next->next->next = CE("uiop");
	list->next->next->next->next = CE("hjkl");
	printf("%s\n", (char*)(ft_list_at(list, 0)->data));
	printf("%s\n", (char*)(ft_list_at(list, 1)->data));
	printf("%s\n", (char*)(ft_list_at(list, 2)->data));
	printf("%s\n", (char*)(ft_list_at(list, 3)->data));
	printf("%s\n", (char*)(ft_list_at(list, 4)->data));
	printf("%p\n", ft_list_at(list, 5));
	printf("%p\n", ft_list_at(list, 100));
}
==== check -e ====
$expected = "0x0\n0x0\n0x0\nasdf\n0x0\nasdf\nqwer\nzxcv\nuiop\nhjkl\n0x0\n0x0\n";
====


ex08 -N -f1=ft_list_reverse.c -f2=ft_list.h
lol hi
main -f=ft_list_reverse.c ====
#include "ft_list.h"

void ft_list_reverse(t_list **begin_list);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}
#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

// pronounced with an exclaimation point at the end
void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

// pronounced with an exclaimation point at the end
t_list* crap_the_argv(char** argv)
{
	t_list* res = 0;
	t_list* tail = 0;
	argv++;
	while (*argv != 0)
	{
		if (tail == 0)
			res = tail = CE(*argv++);
		else
		{
			tail->next = CE(*argv++);
			tail = tail->next;
		}
	}
	return res;
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 1;
	t_list* list = crap_the_argv(argv);
	ft_list_reverse(&list);
	crap_a_list(list);
}
==== check -t ====
%tests = (
	"$program" => "\n",
	"$program asdf" => "asdf,\n",
	"$program asdf qwer" => "qwer,asdf,\n",
	"$program asdf qwer zxcv" => "zxcv,qwer,asdf,\n",
	"$program ''" => ",\n",
	"$program 15 '' 25" => "25,,15,\n",
	"$program wat" => "wat,\n",
);
====



ex09 -N -f1=ft_list_foreach.c -f2=ft_list.h
lol hi
main -f=ft_list_foreach.c ====
#include "ft_list.h"

void ft_list_foreach(t_list *begin_list, void (*f)(void *));

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}
#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

// pronounced with an exclaimation point at the end
void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

// pronounced with an exclaimation point at the end
t_list* crap_the_argv(char** argv)
{
	t_list* res = 0;
	t_list* tail = 0;
	argv++;
	while (*argv != 0)
	{
		if (tail == 0)
			res = tail = CE(*argv++);
		else
		{
			tail->next = CE(*argv++);
			tail = tail->next;
		}
	}
	return res;
}

void print_str(char* str)
{
	printf("%s\n", str);
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 1;
	t_list* list = crap_the_argv(argv);
	ft_list_foreach(list, (void(*)(void*))print_str);
}
==== check -t ====
%tests = (
	"$program" => "",
	"$program asdf" => "asdf\n",
	"$program asdf qwer" => "asdf\nqwer\n",
	"$program asdf qwer zxcv" => "asdf\nqwer\nzxcv\n",
	"$program ''" => "\n",
	"$program 15 '' 25" => "15\n\n25\n",
	"$program wat" => "wat\n",
);
====



ex10 -N -f1=ft_list_foreach_if.c -f2=ft_list.h
lol hi
main -f=ft_list_foreach_if.c ====
#include "ft_list.h"

void ft_list_foreach_if(t_list *begin_list, void (*f)(void *), void *data_ref, int (*cmp)());

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}
#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

// pronounced with an exclaimation point at the end
void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

// pronounced with an exclaimation point at the end
t_list* crap_the_argv(char** argv)
{
	t_list* res = 0;
	t_list* tail = 0;
	argv++;
	while (*argv != 0)
	{
		if (tail == 0)
			res = tail = CE(*argv++);
		else
		{
			tail->next = CE(*argv++);
			tail = tail->next;
		}
	}
	return res;
}

void print_str(char* str)
{
	printf("%s\n", str);
}

int starts_with(char* str, char* ref)
{
	return str[0] - ref[0];
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 1;
	t_list* list = crap_the_argv(argv);
	ft_list_foreach_if(list, (void(*)(void*))print_str, "a", (int(*)())starts_with);
}
==== check -t ====
%tests = (
	"$program" => "",
	"$program asdf" => "asdf\n",
	"$program asdf qwer" => "asdf\n",
	"$program asdf qwer zxcv" => "asdf\n",
	"$program ''" => "",
	"$program uiop aaaaa qwer alpha zxcv asdf hjkl" => "aaaaa\nalpha\nasdf\n",
	"$program wat atw taw awt twa" => "atw\nawt\n",
);
====


ex11 -N -f1=ft_list_find.c -f2=ft_list.h
lol hi
main -f=ft_list_find.c ====
#include "ft_list.h"

t_list *ft_list_find(t_list *begin_list, void *data_ref, int (*cmp)());

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}
#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

// pronounced with an exclaimation point at the end
void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

// pronounced with an exclaimation point at the end
t_list* crap_the_argv(char** argv)
{
	t_list* res = 0;
	t_list* tail = 0;
	argv++;
	while (*argv != 0)
	{
		if (tail == 0)
			res = tail = CE(*argv++);
		else
		{
			tail->next = CE(*argv++);
			tail = tail->next;
		}
	}
	return res;
}

void print_str(char* str)
{
	printf("%s\n", str);
}

int starts_with(char* str, char* ref)
{
	return str[0] - ref[0];
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 1;
	t_list* list = crap_the_argv(argv);
	t_list* res = ft_list_find(list, "a", (int(*)())starts_with);
	if (res == 0)
		printf("(NULL)");
	else
		printf("%s", (char*)res->data);
}
==== check -t ====
%tests = (
	"$program" => "(NULL)",
	"$program asdf" => "asdf",
	"$program qwer" => "(NULL)",
	"$program qwer asdf zxcv" => "asdf",
	"$program ''" => "(NULL)",
	"$program uiop aaaaa qwer alpha zxcv asdf hjkl" => "aaaaa",
	"$program wat atw taw awt twa" => "atw",
);
====






ex12 -N -f1=ft_list_remove_if.c -f2=ft_list.h
lol hi
main -f=ft_list_remove_if.c ====
#include "ft_list.h"

void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}
#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

// pronounced with an exclaimation point at the end
void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

// pronounced with an exclaimation point at the end
t_list* crap_the_argv(char** argv)
{
	t_list* res = 0;
	t_list* tail = 0;
	argv++;
	while (*argv != 0)
	{
		if (tail == 0)
			res = tail = CE(*argv++);
		else
		{
			tail->next = CE(*argv++);
			tail = tail->next;
		}
	}
	return res;
}

void print_str(char* str)
{
	printf("%s\n", str);
}

int starts_with(char* str, char* ref)
{
	return str[0] - ref[0];
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 1;
	t_list* list = crap_the_argv(argv);
	ft_list_remove_if(&list, "a", (int(*)())starts_with);
	crap_a_list(list);
}
==== check -t ====
%tests = (
	"$program" => "\n",
	"$program asdf" => "\n",
	"$program qwer" => "qwer,\n",
	"$program qwer asdf zxcv" => "qwer,zxcv,\n",
	"$program ''" => ",\n",
	"$program uiop aaaaa qwer alpha zxcv asdf hjkl" => "uiop,qwer,zxcv,hjkl,\n",
	"$program wat atw taw awt twa" => "wat,taw,twa,\n",
);
====



ex13 -N -f1=ft_list_merge.c -f2=ft_list.h
lol hi
main -f=ft_list_merge.c ====
#include "ft_list.h"

void ft_list_merge(t_list **begin_list1, t_list *begin_list2);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}
#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

// pronounced with an exclaimation point at the end
void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

// pronounced with an exclaimation point at the end
t_list* crap_the_argv(char** argv)
{
	t_list* res = 0;
	t_list* tail = 0;
	argv++;
	while (*argv != 0)
	{
		if (tail == 0)
			res = tail = CE(*argv++);
		else
		{
			tail->next = CE(*argv++);
			tail = tail->next;
		}
	}
	return res;
}

void print_str(char* str)
{
	printf("%s\n", str);
}

int starts_with(char* str, char* ref)
{
	return str[0] - ref[0];
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 1;
	t_list* initial_list = 0;
	t_list* list = crap_the_argv(argv);
	ft_list_merge(&initial_list, list);
	crap_a_list(initial_list);


	initial_list = CE("first");
	initial_list->next = CE("second");
	list = crap_the_argv(argv);
	ft_list_merge(&initial_list, list);
	crap_a_list(initial_list);
}
==== check -t ====
%tests = (
	"$program" => "\nfirst,second,\n",
	"$program asdf" => "asdf,\nfirst,second,asdf,\n",
	"$program qwer asdf zxcv" => "qwer,asdf,zxcv,\nfirst,second,qwer,asdf,zxcv,\n",
);
====



ex14 -N -f1=ft_list_sort.c -f2=ft_list.h
lol hi
main -f=ft_list_sort.c ====
#include "ft_list.h"

void ft_list_sort(t_list **begin_list, int (*cmp)());

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}
#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

// pronounced with an exclaimation point at the end
void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

// pronounced with an exclaimation point at the end
t_list* crap_the_argv(char** argv)
{
	t_list* res = 0;
	t_list* tail = 0;
	argv++;
	while (*argv != 0)
	{
		if (tail == 0)
			res = tail = CE(*argv++);
		else
		{
			tail->next = CE(*argv++);
			tail = tail->next;
		}
	}
	return res;
}

void print_str(char* str)
{
	printf("%s\n", str);
}

int starts_with(char* str, char* ref)
{
	return str[0] - ref[0];
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 1;
	t_list* list = crap_the_argv(argv);
	ft_list_sort(&list, (int(*)())strcmp);
	crap_a_list(list);
}
==== check -t ====
%tests = (
	"$program" => "\n",
	"$program asdf" => "asdf,\n",
	"$program asdf zxcv" => "asdf,zxcv,\n",
	"$program zxcv asdf" => "asdf,zxcv,\n",
	"$program qwer asdf zxcv" => "asdf,qwer,zxcv,\n",
	"$program zxcv asdf qwer" => "asdf,qwer,zxcv,\n",
	"$program zxcv qwer asdf" => "asdf,qwer,zxcv,\n",
	"$program qwer zxcv asdf" => "asdf,qwer,zxcv,\n",
	"$program asdf qwer zxcv" => "asdf,qwer,zxcv,\n",
	"$program zxcv doop qwer asdf uiop hjkl vbnm" => "asdf,doop,hjkl,qwer,uiop,vbnm,zxcv,\n",
);
====



ex15 -N -f1=ft_list_reverse_fun.c -f2=ft_list.h
lol hi
main -f=ft_list_reverse_fun.c ====
#include "ft_list.h"

void ft_list_reverse_fun(t_list *begin_list);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}
#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

// pronounced with an exclaimation point at the end
void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

// pronounced with an exclaimation point at the end
t_list* crap_the_argv(char** argv)
{
	t_list* res = 0;
	t_list* tail = 0;
	argv++;
	while (*argv != 0)
	{
		if (tail == 0)
			res = tail = CE(*argv++);
		else
		{
			tail->next = CE(*argv++);
			tail = tail->next;
		}
	}
	return res;
}

void print_str(char* str)
{
	printf("%s\n", str);
}

int starts_with(char* str, char* ref)
{
	return str[0] - ref[0];
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 1;
	t_list* list = crap_the_argv(argv);
	ft_list_reverse_fun(list);
	crap_a_list(list);
}
==== check -t ====
%tests = (
	"$program" => "\n",
	"$program asdf" => "asdf,\n",
	"$program asdf zxcv" => "zxcv,asdf,\n",
	"$program zxcv asdf" => "asdf,zxcv,\n",
	"$program asdf qwer zxcv" => "zxcv,qwer,asdf,\n",
	"$program zxcv doop qwer asdf uiop hjkl vbnm" => "vbnm,hjkl,uiop,asdf,qwer,doop,zxcv,\n",
);
====




















