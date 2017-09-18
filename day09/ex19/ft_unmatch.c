/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_unmatch.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/03/30 21:27:38 by jaleman           #+#    #+#             */
/*   Updated: 2017/03/30 21:27:39 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int		ft_unmatch(int *tab, int length)
{
	int i;
	int cur;
	int fnd;

	cur = 0;
	while (cur < length)
	{
		i = 0;
		fnd = 0;
		while (i < length && !fnd)
		{
			if (i != cur)
				fnd = (tab[i] == tab[cur]) ? 1 : 0;
			i += 1;
		}
		if (!fnd)
			return (tab[cur]);
		cur += 1;
	}
	return (tab[cur]);
}
