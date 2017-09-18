/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_sort_integer_table.c                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/12 23:00:48 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/12 23:23:59 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

void	ft_sort_integer_table(int *tab, int size)
{
	int		i;
	int		j;
	int		tmp;

	i = 0;
	while (i++ < size)
	{
		j = i + 1;
		while (j-- > 0)
		{
			if (tab[j] < tab[j - 1])
			{
				tmp = tab[j];
				tab[j] = tab[j - 1];
				tab[j - 1] = tmp;
			}
		}
	}
}
