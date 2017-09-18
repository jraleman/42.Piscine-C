/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_program_name.c                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/17 16:56:28 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/17 16:56:29 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

void	ft_putchar(char c);

int		main(int argc, char *argv[])
{
	int i;

	i = 0;
	if (argc == 1)
	{
		while (argv[0][i])
			ft_putchar(argv[0][i++]);
		ft_putchar('\n');
	}
	return (0);
}
