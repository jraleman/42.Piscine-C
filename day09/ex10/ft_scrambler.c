/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_scrambler.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/19 15:50:35 by jaleman           #+#    #+#             */
/*   Updated: 2016/08/19 15:50:35 by jaleman          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

void	ft_scrambler(int ***a, int *b, int *******c, int ****d)
{
	int	tmp_a;
	int	tmp_b;
	int	tmp_c;
	int	tmp_d;

	tmp_a = ***a;
	tmp_b = *b;
	tmp_c = *******c;
	tmp_d = ****d;
	***a = tmp_b;
	*b = tmp_d;
	*******c = tmp_a;
	****d = tmp_c;
}
