ex00
int match(char* s1, char* s2)
main -m ====

TEST(match("asdf", "asdf"), 1);
TEST(match("", ""), 1);
TEST(match("a", "a"), 1);
TEST(match("aa", "aa"), 1);
TEST(match("aaa", "aaa"), 1);

TEST(match("", "asdf"), 0);
TEST(match("asdf", ""), 0);
TEST(match("asdf", "a"), 0);
TEST(match("a", "asdf"), 0);
TEST(match("asdf", "asde"), 0);

TEST(match("asde", "asdf"), 0);
TEST(match("asdf", "asdff"), 0);
TEST(match("asdff", "asdf"), 0);
TEST(match("aasdf", "asdf"), 0);
TEST(match("asdf", "aasdf"), 0);

TEST(match("", "*"), 1);
TEST(match("a", "*"), 1);
TEST(match("aa", "*"), 1);
TEST(match("asdf", "*"), 1);
TEST(match("asdfasdf", "*"), 1);

TEST(match("asdf", "a*"), 1);
TEST(match("asdfasdf", "a*"), 1);
TEST(match("a", "a*"), 1);
TEST(match("aa", "a*"), 1);
TEST(match("aasdf", "a*"), 1);

TEST(match("", "a*"), 0);
TEST(match("f", "a*"), 0);
TEST(match("fdsa", "a*"), 0);
TEST(match("faaaa", "a*"), 0);
TEST(match("faaasdf", "a*"), 0);

TEST(match("fdsa", "*a"), 1);
TEST(match("a", "*a"), 1);
TEST(match("aa", "*a"), 1);
TEST(match("fdsaaaaaaafdsa", "*a"), 1);
TEST(match("dfsaaaaaaaaaaaa", "*a"), 1);

TEST(match("", "*a"), 0);
TEST(match("f", "*a"), 0);
TEST(match("asdf", "*a"), 0);
TEST(match("aaaaaf", "*a"), 0);
TEST(match("fdsaaaaf", "*a"), 0);

TEST(match("abc", "abc*"), 1);
TEST(match("abcdef", "abc*"), 1);
TEST(match("abccccccc", "abc*"), 1);
TEST(match("abcabc", "abc*"), 1);
TEST(match("abcdabcdabc", "abc*"), 1);

TEST(match("", "abc*"), 0);
TEST(match("f", "abc*"), 0);
TEST(match("abbc", "abc*"), 0);
TEST(match("ab", "abc*"), 0);
TEST(match("abb", "abc*"), 0);
// 50

TEST(match("abc", "*abc"), 1);
TEST(match("defabc", "*abc"), 1);
TEST(match("aaaaaaabc", "*abc"), 1);
TEST(match("abcabc", "*abc"), 1);
TEST(match("abcdabcdabc", "*abc"), 1);

TEST(match("", "*abc"), 0);
TEST(match("f", "*abc"), 0);
TEST(match("abbc", "*abc"), 0);
TEST(match("ab", "*abc"), 0);
TEST(match("abb", "*abc"), 0);

TEST(match("a", "*a*"), 1);
TEST(match("aaa", "*a*"), 1);
TEST(match("aaaaaaabc", "*a*"), 1);
TEST(match("bcabc", "*a*"), 1);
TEST(match("sdfa", "*a*"), 1);

TEST(match("", "*a*"), 0);
TEST(match("f", "*a*"), 0);
TEST(match("bcd", "*a*"), 0);
TEST(match("bb", "*a*"), 0);
TEST(match("ASDF", "*a*"), 0);

TEST(match("ab", "*ab*"), 1);
TEST(match("abcd", "*ab*"), 1);
TEST(match("efabcd", "*ab*"), 1);
TEST(match("ababab", "*ab*"), 1);
TEST(match("bab", "*ab*"), 1);

TEST(match("asdf", "*ab*"), 0);
TEST(match("ba", "*ab*"), 0);
TEST(match("", "*ab*"), 0);
TEST(match("f", "*ab*"), 0);
TEST(match("bbbbbbaaaaa", "*ab*"), 0);

TEST(match("", "**"), 1);
TEST(match("a", "**"), 1);
TEST(match("ab", "**"), 1);
TEST(match("abc", "**"), 1);
TEST(match("abcd", "**"), 1);

TEST(match("a", "a**"), 1);
TEST(match("ab", "a**"), 1);
TEST(match("abc", "a**"), 1);
TEST(match("aaaaaa", "a**"), 1);
TEST(match("asdfaaaaa", "a**"), 1);

TEST(match("", "a**"), 0);
TEST(match("f", "a**"), 0);
TEST(match("fa", "a**"), 0);
TEST(match("faaaaaaa", "a**"), 0);
TEST(match("fafdsafdsa", "a**"), 0);

TEST(match("asdf", "*a**"), 1);
TEST(match("sdfa", "*a**"), 1);
TEST(match("faffff", "*a**"), 1);
TEST(match("fdsaasdf", "*a**"), 1);
TEST(match("aaaaaaa", "*a**"), 1);
// 100

TEST(match("", "*a**"), 0);
TEST(match("qwerqwer", "*a**"), 0);
TEST(match("bbbbbb", "*a**"), 0);
TEST(match("c", "*a**"), 0);
TEST(match("AAAAAAAAAA", "*a**"), 0);

TEST(match("main.c", "*.c"), 1);
TEST(match("main.c.c", "*.c"), 1);
TEST(match("main.h", "*.c"), 0);
TEST(match("main.cc", "*.c"), 0);
TEST(match("main.c", "*.*"), 1);

TEST(match("test.main.c", "test.*.c"), 1);
TEST(match("test..c", "test.*.c"), 1);
TEST(match("test.main.h", "test.*.c"), 0);
TEST(match("main.c", "test.*.c"), 0);
TEST(match("test.c", "test.*.c"), 0);

TEST(match("abcde", "a*c*e"), 1);
TEST(match("abcde", "*b*d*"), 1);
TEST(match("abcde", "a*e*c"), 0);
TEST(match("abcde", "*d*c*"), 0);
TEST(match("abcde", "a*d*d"), 0);

TEST(match("*a", "*"), 1);
TEST(match("**", "*"), 1);
TEST(match("*ab", "*b"), 1);
TEST(match("a*a", "a*"), 1);
TEST(match("**a", "*a"), 1);


==== check -l=125 ====
====







ex01
int nmatch(char* s1, char* s2)
main -m ====

TEST(nmatch("asdf", "asdf"), 1);
TEST(nmatch("", ""), 1);
TEST(nmatch("a", "a"), 1);
TEST(nmatch("aa", "aa"), 1);
TEST(nmatch("aaa", "aaa"), 1);

TEST(nmatch("", "asdf"), 0);
TEST(nmatch("asdf", ""), 0);
TEST(nmatch("asdf", "a"), 0);
TEST(nmatch("a", "asdf"), 0);
TEST(nmatch("asdf", "asde"), 0);

TEST(nmatch("asde", "asdf"), 0);
TEST(nmatch("asdf", "asdff"), 0);
TEST(nmatch("asdff", "asdf"), 0);
TEST(nmatch("aasdf", "asdf"), 0);
TEST(nmatch("asdf", "aasdf"), 0);

TEST(nmatch("", "*"), 1);
TEST(nmatch("a", "*"), 1);
TEST(nmatch("aa", "*"), 1);
TEST(nmatch("asdf", "*"), 1);
TEST(nmatch("asdfasdf", "*"), 1);

TEST(nmatch("asdf", "a*"), 1);
TEST(nmatch("asdfasdf", "a*"), 1);
TEST(nmatch("a", "a*"), 1);
TEST(nmatch("aa", "a*"), 1);
TEST(nmatch("aasdf", "a*"), 1);

TEST(nmatch("", "a*"), 0);
TEST(nmatch("f", "a*"), 0);
TEST(nmatch("fdsa", "a*"), 0);
TEST(nmatch("faaaa", "a*"), 0);
TEST(nmatch("faaasdf", "a*"), 0);

TEST(nmatch("fdsa", "*a"), 1);
TEST(nmatch("a", "*a"), 1);
TEST(nmatch("aa", "*a"), 1);
TEST(nmatch("fdsaaaaaaafdsa", "*a"), 1);
TEST(nmatch("dfsaaaaaaaaaaaa", "*a"), 1);

TEST(nmatch("", "*a"), 0);
TEST(nmatch("f", "*a"), 0);
TEST(nmatch("asdf", "*a"), 0);
TEST(nmatch("aaaaaf", "*a"), 0);
TEST(nmatch("fdsaaaaf", "*a"), 0);

TEST(nmatch("abc", "abc*"), 1);
TEST(nmatch("abcdef", "abc*"), 1);
TEST(nmatch("abccccccc", "abc*"), 1);
TEST(nmatch("abcabc", "abc*"), 1);
TEST(nmatch("abcdabcdabc", "abc*"), 1);

TEST(nmatch("", "abc*"), 0);
TEST(nmatch("f", "abc*"), 0);
TEST(nmatch("abbc", "abc*"), 0);
TEST(nmatch("ab", "abc*"), 0);
TEST(nmatch("abb", "abc*"), 0);
// 50

TEST(nmatch("abc", "*abc"), 1);
TEST(nmatch("defabc", "*abc"), 1);
TEST(nmatch("aaaaaaabc", "*abc"), 1);
TEST(nmatch("abcabc", "*abc"), 1);
TEST(nmatch("abcdabcdabc", "*abc"), 1);

TEST(nmatch("", "*abc"), 0);
TEST(nmatch("f", "*abc"), 0);
TEST(nmatch("abbc", "*abc"), 0);
TEST(nmatch("ab", "*abc"), 0);
TEST(nmatch("abb", "*abc"), 0);

TEST(nmatch("a", "*a*"), 1);
TEST(nmatch("aaa", "*a*"), 3);
TEST(nmatch("aaabc", "*a*"), 3);
TEST(nmatch("bcabc", "*a*"), 1);
TEST(nmatch("sdfa", "*a*"), 1);

TEST(nmatch("", "*a*"), 0);
TEST(nmatch("f", "*a*"), 0);
TEST(nmatch("bcd", "*a*"), 0);
TEST(nmatch("bb", "*a*"), 0);
TEST(nmatch("ASDF", "*a*"), 0);

TEST(nmatch("ab", "*ab*"), 1);
TEST(nmatch("abcd", "*ab*"), 1);
TEST(nmatch("efabcd", "*ab*"), 1);
TEST(nmatch("ababab", "*ab*"), 3);
TEST(nmatch("bab", "*ab*"), 1);

TEST(nmatch("asdf", "*ab*"), 0);
TEST(nmatch("ba", "*ab*"), 0);
TEST(nmatch("", "*ab*"), 0);
TEST(nmatch("f", "*ab*"), 0);
TEST(nmatch("bbbbbbaaaaa", "*ab*"), 0);

TEST(nmatch("", "**"), 1);
TEST(nmatch("a", "**"), 2);
TEST(nmatch("ab", "**"), 3);
TEST(nmatch("abc", "**"), 4);
TEST(nmatch("abcd", "**"), 5);

TEST(nmatch("a", "a**"), 1);
TEST(nmatch("ab", "a**"), 2);
TEST(nmatch("abc", "a**"), 3);
TEST(nmatch("aaaa", "a**"), 4);
TEST(nmatch("asdfa", "a**"), 5);

TEST(nmatch("", "a**"), 0);
TEST(nmatch("f", "a**"), 0);
TEST(nmatch("fa", "a**"), 0);
TEST(nmatch("faaaaaaa", "a**"), 0);
TEST(nmatch("fafdsafdsa", "a**"), 0);

TEST(nmatch("asdf", "*a**"), 4);
TEST(nmatch("sdfa", "*a**"), 1);
TEST(nmatch("faffff", "*a**"), 5);
TEST(nmatch("fdsaasdf", "*a**"), 9);
TEST(nmatch("aaaaaaa", "*a**"), 28);
// 100

TEST(nmatch("", "*a**"), 0);
TEST(nmatch("qwerqwer", "*a**"), 0);
TEST(nmatch("bbbbbb", "*a**"), 0);
TEST(nmatch("c", "*a**"), 0);
TEST(nmatch("AAAAAAAAAA", "*a**"), 0);

TEST(nmatch("main.c", "*.c"), 1);
TEST(nmatch("main.c.c", "*.c"), 1);
TEST(nmatch("main.h", "*.c"), 0);
TEST(nmatch("main.cc", "*.c"), 0);
TEST(nmatch("main.c", "*.*"), 1);

TEST(nmatch("test.main.c", "test.*.c"), 1);
TEST(nmatch("test..c", "test.*.c"), 1);
TEST(nmatch("test.main.h", "test.*.c"), 0);
TEST(nmatch("main.c", "test.*.c"), 0);
TEST(nmatch("test.c", "test.*.c"), 0);

TEST(nmatch("abcde", "a*c*e"), 1);
TEST(nmatch("abcde", "*b*d*"), 1);
TEST(nmatch("abcde", "a*e*c"), 0);
TEST(nmatch("abcde", "*d*c*"), 0);
TEST(nmatch("abcde", "a*d*d"), 0);

TEST(nmatch("abcbd", "*b*"), 2);
TEST(nmatch("abc", "a**"), 3);
TEST(nmatch("test.asdf.c.bak", "*.*.*"), 3);
TEST(nmatch("test.bak", "*.*.*"), 0);
TEST(nmatch("", "************************"), 1);

TEST(nmatch("*a", "*"), 1);
TEST(nmatch("**", "*"), 1);
TEST(nmatch("*ab", "*b"), 1);
TEST(nmatch("a*a", "a*"), 1);
TEST(nmatch("**a", "*a"), 1);


==== check -l=130 ====
====




