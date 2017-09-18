/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_params.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/17 19:27:38 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/17 19:27:40 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

void	ft_putchar(char c);

int		main(int argc, char *argv[])
{
	int i;
	int j;

	i = 0;
	j = 1;
	while (--argc)
	{
		while (argv[j][i])
			ft_putchar(argv[j][i++]);
		i = 0;
		j += 1;
		ft_putchar('\n');
	}
	return (0);
}
