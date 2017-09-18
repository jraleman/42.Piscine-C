/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_range.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/18 04:29:03 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/18 04:29:04 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

int		*ft_range(int min, int max)
{
	int i;
	int *arr;

	i = 0;
	if (max < min || !(arr = (int *)malloc(sizeof(int) * (max - min) + 1)))
		return (0);
	while (min <= max)
		arr[i++] = min++;
	return (arr);
}
