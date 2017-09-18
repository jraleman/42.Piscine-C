/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_param_to_tab.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/20 23:27:30 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/20 23:27:30 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_stock_par.h"

static char			*ft_strdup(char *src)
{
	int				i;
	char			*dst;

	i = 0;
	while (src[i])
		i += 1;
	if (!(dst = (char *)malloc(sizeof(char) * (i + 1))))
		return (NULL);
	i = -1;
	while (src[++i])
		dst[i] = src[i];
	dst[i] = '\0';
	return (dst);
}

struct s_stock_par	*ft_param_to_tab(int ac, char **av)
{
	int				i;
	int				j;
	t_stock_par		*stk;

	if (!(stk = (t_stock_par*)malloc(sizeof(t_stock_par) * (ac + 1))))
		return (NULL);
	i = 0;
	while (i < ac)
	{
		j = 0;
		while (av[i][j])
			j++;
		stk[i]->size_param = j;
		stk[i]->str = av[i];
		stk[i]->copy = ft_strdup(av[i]);
		stk[i]->tab = ft_split_whitespaces(av[i]);
		i += 1;
	}
	stk[i]->str = 0;
	return (stk);
}
