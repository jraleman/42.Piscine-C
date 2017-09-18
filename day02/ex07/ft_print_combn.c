/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_combn.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/11 11:47:07 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/11 23:39:41 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int			ft_putchar(char c);

static void	ft_me_cago_en_norminette(int *arr, int col, int n)
{
	int		i;

	while (col)
	{
		while (arr[col] == (9 + col - (n - 1)) && col >= 0)
			col -= 1;
		if (col < 0)
			break ;
		arr[col] += 1;
		i = (col + 1) - 1;
		while (i++ < n)
			arr[i] = arr[i - 1] + 1;
		col = n - 1;
		ft_putchar(',');
		ft_putchar(' ');
		i = 0;
		while (i < n)
			ft_putchar(arr[i++] + '0');
	}
}

void		ft_print_combn(int n)
{
	int		arr[n];
	int		i;
	int		col;

	col = n - 1;
	if (n > 10)
		return ;
	i = -1;
	while (i++ < n)
		arr[i] = i;
	i = 0;
	while (i < n)
		ft_putchar(arr[i++] + '0');
	ft_me_cago_en_norminette(arr, col, n);
	ft_putchar('\n');
}
