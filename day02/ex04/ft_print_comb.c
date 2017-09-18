/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_comb.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/11 11:47:07 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/11 11:47:09 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int		ft_putchar(char c);

void	ft_print_comb(void)
{
	char	nbr1;
	char	nbr2;
	char	nbr3;

	nbr1 = '0' - 1;
	while (++nbr1 <= '9')
	{
		nbr2 = nbr1;
		while (++nbr2 <= '9')
		{
			nbr3 = nbr2;
			while (++nbr3 <= '9')
			{
				if (nbr1 != '0' || nbr2 != '1' || nbr3 != '2')
					ft_putchar(',');
				if (nbr1 != '0' || nbr2 != '1' || nbr3 != '2')
					ft_putchar(' ');
				ft_putchar(nbr1);
				ft_putchar(nbr2);
				ft_putchar(nbr3);
			}
		}
	}
	ft_putchar('\n');
}
