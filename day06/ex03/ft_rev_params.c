/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_rev_params.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/17 21:08:29 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/17 21:08:29 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

void	ft_putchar(char c);

int		main(int argc, char *argv[])
{
	int i;

	i = 0;
	while (--argc)
	{
		while (argv[argc][i])
			ft_putchar(argv[argc][i++]);
		i = 0;
		ft_putchar('\n');
	}
	return (0);
}
