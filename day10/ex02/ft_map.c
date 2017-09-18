/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_map.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/23 16:59:45 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/23 16:59:50 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

int		*ft_map(int *tab, int length, int (*f)(int))
{
	int		i;
	int		*new_tab;

	i = -1;
	if (!(new_tab = (int *)malloc(sizeof(int) * length + 1)))
		return (NULL);
	while (++i < length)
		new_tab[i] = f(tab[i]);
	return (new_tab);
}
