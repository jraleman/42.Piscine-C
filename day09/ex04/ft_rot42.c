/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_rot42.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/19 15:48:37 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/19 15:48:39 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/*
** Instead of rotating 13, as ROT13 does (because there is 26 characters
** in the latin alphabet), we do a 42 rotation to make ROT42. This way, we
** substract 26 (all the letters in the alphabet) to 42, to make the actual
** rotation, which is 16 (the first value, from the starting point, which is
** A). Now, we need to find the number that completes the alphabet, from 16,
** which is 10 (26 - 16 = 10). This way, we can rotate successfully. :D
** This link helped me a lot:
** http://stackoverflow.com/questions/13520067/about-rot13-implementation
*/

char	*ft_rot42(char *str)
{
	int i;

	i = 0;
	while (str[i] != '\0')
	{
		if ((str[i] >= 'A' && str[i] <= 'J') ||
		(str[i] >= 'a' && str[i] <= 'j'))
			str[i] = str[i] + 16;
		else if ((str[i] >= 'K' && str[i] <= 'Z') ||
		(str[i] >= 'k' && str[i] <= 'z'))
			str[i] = str[i] - 10;
		else
			str[i];
		i += 1;
	}
	str[i] = '\0';
	return (str);
}
