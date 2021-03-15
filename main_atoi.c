#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>

int			ft_atoi_base(const char *nb, const char *base);

int		main()
{
	int nb;

	nb = ft_atoi_base("        ---+-4d2g24", "0123456789abcdef");
	printf("%d\n", nb);
//	printf("nb: '    --42' base: 0123456789abcdef = %d\n", ft_atoi_base("    -42", "0123456789abcdef"));
//	printf("nb: '    -+10111234' base: 01 = %d\n", ft_atoi_base("    -+1234", "01"));
//	printf("nb: '    -+11111234' base: 01 = %d\n", ft_atoi_base("    -+1234", "01"));
//	printf("nb: '    -+asdfasdf' base: 01 = %d\n", ft_atoi_base("    -+asdfasdf", "01"));
	return (0);
}
