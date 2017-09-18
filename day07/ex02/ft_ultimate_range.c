/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_ultimate_range.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/18 06:28:34 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/18 06:28:35 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

int		ft_ultimate_range(int **range, int min, int max)
{
	int i;

	i = 0;
	if (max > min)
	{
		*range = (int *)malloc(sizeof(int) * (max - min) + 1);
		if (*range[i])
		{
			while (min < max)
				*range[i++] = min++;
		}
		return (i);
	}
	return (0);
}
