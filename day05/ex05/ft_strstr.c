/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strstr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/15 22:47:37 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/15 22:47:39 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

char	*ft_strstr(char *str, char *to_find)
{
	int		i;
	int		j;

	i = 0;
	j = 0;
	if (!to_find[0])
		return (&str[i]);
	while (str[i])
	{
		while ((str[i + j] == to_find[j]) && to_find[j])
			j += 1;
		if (!to_find[j])
			return (&str[i]);
		j = 0;
		i += 1;
	}
	return (NULL);
}
