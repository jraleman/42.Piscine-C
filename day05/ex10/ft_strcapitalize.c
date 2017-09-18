/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcapitalize.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/16 21:35:21 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/16 21:35:22 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

static int	ft_isspace(int c)
{
	if (c == '\t' || c == '\v' || c == '\n' || c == '\r' || c == '\f' \
		|| c == ' ')
		return (1);
	return (0);
}

static int	ft_ispunct(int c)
{
	if ((c >= 33 && 47 >= c) || (c >= 58 && 64 >= c) || (c >= 91 && 96 >= c) \
		|| (c >= 123 && 126 >= c))
		return (1);
	return (0);
}

char		*ft_strcapitalize(char *str)
{
	int i;

	i = 0;
	if (str[0] >= 'a' && 'a' >= str[0])
		str[0] -= 32;
	while (str[i++])
		if (ft_isspace(str[i]) || ft_ispunct(str[i]))
			if (str[i] >= 'a' && 'a' >= str[i])
				str[i + 1] -= 32;
	return (str);
}
