/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split_whitespaces.c                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/18 06:28:34 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/18 06:28:35 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

static int	ft_wordcount(char *s, char c)
{
	int		i;
	int		w;

	i = 0;
	w = 0;
	while (s[i])
	{
		if (s[i] != '\t' && s[i] != ' ' && s[i] != '\n')
			w += 1;
		while (s[i + 1] && s[i] != '\t' && s[i] != ' ' && s[i] != '\n')
			i += 1;
		i += 1;
	}
	return (w);
}

static int	ft_wordlen(char *s)
{
	int		i;
	int		len;

	i = 0;
	len = 0;
	while (s[i] == '\t' || s[i] == ' ' || s[i] == '\n')
		i += 1;
	while (s[i] && s[i] != '\t' && s[i] != ' ' && s[i++] != '\n')
		len += 1;
	return (len);
}

char		**ft_split_whitespaces(char *str)
{
	int		i;
	int		j;
	int		k;
	char	**w;

	i = 0;
	k = 0;
	if (!str || !(w = (char **)malloc(sizeof(char*) * (ft_wordcount(str) + 1))))
		return (NULL);
	while (i < ft_wordcount(str))
	{
		if (!(w[i] = (char *)malloc(sizeof(char) * (ft_wordlen(&str[k]) + 1))))
			return (NULL);
		j = 0;
		while (str[k] == '\t' || str[k] == ' ' || str[k] == '\n')
			k += 1;
		while (str[k] && str[k] != '\t' && str[k] != ' ' && str[k] != '\n')
			w[i][j++] = str[k++];
		w[i][j] = '\0';
		i += 1;
	}
	w[i] = NULL;
	return (w);
}
