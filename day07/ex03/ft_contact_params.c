/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_contact_params.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/18 14:56:56 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/18 14:56:57 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

char		*ft_contact_params(int argc, char **argv)
{
	int		i;
	int		j;
	int		k;
	char	*str;

	if (!(str = (char *)malloc(sizeof(char) * 9001)))
		return (NULL);
	k = 0;
	while (k < 9001)
		str[k++] = '\0';
	k = 0;
	i = 1;
	while (--argc)
	{
		j = 0;
		while (argv[i][j])
			str[k++] = argv[i][j++];
		str[k++] = '\n';
		i += 1;
	}
	return (str);
}
