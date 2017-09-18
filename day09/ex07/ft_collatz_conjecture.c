/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_collatz_conjecture.c                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/19 16:21:21 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/19 16:21:22 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/*
** The conjecture can be summarized as follows. Take any positive integer n.
** If n is even, divide it by 2 to get n / 2. If n is odd, multiply it
** by 3 and add 1 to obtain 3n + 1. Repeat the process indefinitely.
** The conjecture is that no matter what number you start with,
** you will always eventually reach 1.
** Source: https://en.wikipedia.org/wiki/Collatz_conjecture
**
** https://xkcd.com/710/	   ;)
*/

unsigned int	ft_collatz_conjecture(unsigned int base)
{
	if (base == 1)
		return (0);
	if ((base % 2) != 1)
		base = base / 2;
	else
		base = 3 * base + 1;
	return (ft_collatz_conjecture(base) + 1);
}
