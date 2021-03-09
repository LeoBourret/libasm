#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>

ssize_t  ft_write(int fd, const void *buf, size_t nbyte);
ssize_t  ft_read(int fd, void *buf, size_t nbyte);
ssize_t  ft_strlen(const void *s);
char *ft_strdup(const char *s);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
int			ft_atoi_base(const char *nb, const char *base);

void	test_strcmp()
{
	printf("'salut' 'salut' = %d\n", ft_strcmp("salut", "salut"));
	printf("'salut' 'salutes' = %d\n", ft_strcmp("salut", "salutes"));
	printf("'salutes' 'salut' = %d\n", ft_strcmp("salutes", "salut"));
	printf("'salut' '' = %d\n", ft_strcmp("salut", ""));
	printf("'' 'salut' = %d\n", ft_strcmp("", "salut"));
	printf("'' '' = %d\n", ft_strcmp("", ""));
}

void	test_strlen()
{
	printf("'je suis une banane' = %lu\n", ft_strlen("je suis une banane"));
	printf("'' = %lu\n", ft_strlen(""));
	printf("'hello\\0hello' = %lu\n", ft_strlen("hello\0hello"));
}

void	test_strcpy()
{
	char *ptr;

	if (!(ptr = malloc(sizeof(char) * 50)))
	{
		printf("error malloc\n");
		return ;
	}
	ptr = ft_strcpy(ptr, "hello");
	printf("src = hello dest = %s\n", ptr);
	ptr = ft_strcpy(ptr, "");
	printf("src = '' dest = '%s'\n", ptr);
	ptr = ft_strcpy(ptr, "je suis une banane");
	printf("src = 'je suis une banane' dest = '%s'\n", ptr);
	free(ptr);
}

void	test_strdup()
{
	char *ptr;

	ptr = ft_strdup("hello");
	printf("src = 'hello' dest = '%s'\n", ptr);
	free(ptr);
	ptr = ft_strdup("");
	printf("src = '' dest = '%s'\n", ptr);
	free(ptr);
	ptr = ft_strdup("je suis une banane");
	printf("src = 'je suis une banane' dest = '%s'\n", ptr);
	free(ptr);
}

void	test_write()
{
	write(1, "Coucou libasm\n", 14);
	ft_write(1, "Coucou libasm\n", 14);
	printf("test: \\n\n");
	write(1, "\n", 1);
	ft_write(1, "\n", 1);
	printf("test empty\n");
	write(1, "", 0);
	ft_write(1, "", 0);
}

void	test_read(char *file)
{
	int fd;
	int fd1;
	char buf[50];
	char buf1[50];
	int ret;
	int ret1;

	fd = open(file, O_RDONLY);
	fd1 = open(file, O_RDONLY);
	ret = ft_read(fd, buf, 50);
	ret1 = read(fd1, buf1, 50);
	buf[ret] = '\0';
	buf1[ret1] = '\0';
	printf("ft_read\tret = %d; string = %s\n", ret, buf);
	printf("read\tret = %d; string = %s\n", ret1, buf1);
	close(fd);
	close(fd1);
}

void	test_atoi()
{
	printf("nb: '42' base: 0123456789abcdef = %d\n", ft_atoi_base("42", "0123456789abcdef"));
	printf("nb: '    --42' base: 0123456789abcdef = %d\n", ft_atoi_base("    -42", "0123456789abcdef"));
	printf("nb: '    -+10111234' base: 01 = %d\n", ft_atoi_base("    -+1234", "01"));
	printf("nb: '    -+11111234' base: 01 = %d\n", ft_atoi_base("    -+1234", "01"));
	printf("nb: '    -+asdfasdf' base: 01 = %d\n", ft_atoi_base("    -+asdfasdf", "01"));
}

int		main(int ac, char **av)
{
	char *ptr;

	if (strcmp(av[1], "ft_strcmp") == 0)
		test_strcmp();
	else if (strcmp(av[1], "ft_strlen") == 0)
		test_strlen();
	else if (strcmp(av[1], "ft_strcpy") == 0)
		test_strcpy();
	else if (strcmp(av[1], "ft_strdup") == 0)
		test_strdup();
	else if (strcmp(av[1], "ft_write") == 0)
		test_write();
	else if (strcmp(av[1], "ft_read") == 0)
		test_read(av[2]);
	else if (strcmp(av[1], "ft_atoi_base") == 0)
		test_atoi();
	else if (ac == 2)
	{
		printf("FT_STRLEN:\n\n");
		test_strlen();
		printf("\n\n\nFT_STRCPY:\n\n");
		test_strcpy();
		printf("\n\n\nFT_STRCMP:\n");
		test_strcmp();
		printf("\n\n\nFT_WRITE:\n\n");
		test_write();
		printf("\n\n\nFT_READ:\n\n");
		test_read(av[1]);
		printf("\n\n\nFT_STRDUP:\n");
		test_strdup();
	}
	return (0);
}
