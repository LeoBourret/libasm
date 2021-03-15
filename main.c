#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>

ssize_t  ft_write(int fd, const void *buf, size_t nbyte);
ssize_t  ft_read(int fd, void *buf, size_t nbyte);
ssize_t  ft_strlen(const void *s);
char *ft_strdup(const char *s);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
int			ft_atoi_base(const char *nb, const char *base);

void	test_write()
{
	printf("test write\n");
	int ret;
	int ft_ret;
	char *string = "Ca c'est une autre string de test definitivement trop longue";
	char *lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed interdum ut magna ac lacinia. Aliquam vel imperdiet augue. Duis tristique magna id quam consequat consectetur. In sed quam ultrices, posuere elit ac, placerat justo. Fusce quis convallis magna. Curabitur scelerisque mi et diam congue dignissim. Cras tempus sem tellus, venenatis molestie sem porta ut. Curabitur sapien tellus, malesuada nec porta quis, facilisis quis magna. Nam vehicula purus sem, sed consequat dolor tempus sed. Cras at rhoncus risus, eu maximus velit. Curabitur non dolor lacus. Quisque semper commodo dictum.\n";
	char *str_courte = "i";
	ret = write(1, "Ceci est un test de la fonction write\n", 38);
	if (ret < 0)
		perror("message d'erreur de write");
	errno = 0;
	ft_ret = ft_write(1, "Ceci est un test de la fonction write\n", 38);
	if (ft_ret < 0)
		perror("message d'erreur d'ft_write");
	errno = 0;
	printf("write : %d | ft_write : %d\n", ret, ft_ret);
	ret = write(1, string, 20);
	if (ret < 0)
		perror("message d'erreur de write");
	errno = 0;
	printf("\n");
	ft_ret = ft_write(1, string, 20);
	if (ft_ret < 0)
		perror("message d'erreur d'ft_write");
	errno = 0;
	printf("\n");
	printf("write : %d | ft_write : %d\n", ret, ft_ret);
	ret = write(1, str_courte, 20);
	if (ret < 0)
		perror("message d'erreur de write");
	errno = 0;
	printf("\n");
	ft_ret = ft_write(1, str_courte, 20);
	if (ft_ret < 0)
		perror("message d'erreur d'ft_write");
	errno = 0;
	printf("\n");
	printf("write : %d | ft_write : %d\n", ret, ft_ret);
	ret = write(1, NULL, 10);
	if (ret < 0)
		perror("message d'erreur de write");
	errno = 0;
	printf("\n");
	ft_ret = ft_write(1, NULL, 10);
	if (ft_ret < 0)
		perror("message d'erreur d'ft_write");
	errno = 0;
	printf("\n");
	printf("write : %d | ft_write : %d\n", ret, ft_ret);
	ret = write(1, lorem , strlen(lorem));
	if (ret < 0)
		perror("message d'erreur de write");
	errno = 0;
	ft_ret = ft_write(1, lorem, strlen(lorem));
	if (ft_ret < 0)
		perror("message d'erreur d'ft_write");
	errno = 0;
	printf("write : %d | ft_write : %d\n", ret, ft_ret);
	ret = write(1, lorem, 0);
	if (ret < 0)
		perror("message d'erreur de write");
	errno = 0;
	printf("\n");
	ft_ret = ft_write(1, lorem, 0);
	if (ft_ret < 0)
		perror("message d'erreur d'ft_write");
	errno = 0;
	printf("\n");
	printf("write : %d | ft_write : %d\n", ret, ft_ret);
	ret = write(42000, lorem, 30);
	if (ret < 0)
		perror("message d'erreur de write");
	errno = 0;
	printf("\n");
	ft_ret = ft_write(42000, lorem, 30);
	if (ft_ret < 0)
		perror("message d'erreur d'ft_write");
	errno = 0;
	printf("\n");
	printf("write : %d | ft_write : %d\n", ret, ft_ret);
}

void	test_read()
{
	printf("test read\n");
	int fd;
	int ret;
	int ft_ret;
	char buf[1000];
	fd = open("./test/file/file1", O_RDONLY);
	buf[0] = 0;
	printf("read: %d : %s\n", ret = read(fd, buf, 10), buf);
	if (ret < 0)
		perror("message d'erreur de read\n");
	errno = 0;
	fd = open("./test/file/file1", O_RDONLY);
	buf[0] = 0;
	printf("ft_read: %d : %s\n", ret = ft_read(fd, buf, 10), buf);
	if (ret < 0)
		perror("message d'erreur de ft_read\n");
	errno = 0;
	fd = open("./test/file/file3", O_RDONLY);
	buf[0] = 0;
	printf("read: %d : %s\n", ret = read(fd, buf, 15), buf);
	if (ret < 0)
		perror("message d'erreur de read\n");
	errno = 0;
	fd = open("./test/file/file3", O_RDONLY);
	buf[0] = 0;
	printf("ft_read: %d : %s\n", ret = ft_read(fd, buf, 15), buf);
	if (ret < 0)
		perror("message d'erreur de ft_read\n");
	errno = 0;
	fd = open("./test/file/file2", O_RDONLY);
	buf[0] = 0;
	printf("read: %d : %s\n", ret = read(fd, buf, 15), buf);
	if (ret < 0)
		perror("message d'erreur de read\n");
	errno = 0;
	fd = open("./test/file/file2", O_RDONLY);
	buf[0] = 0;
	printf("ft_read: %d : %s\n", ret = ft_read(fd, buf, 15), buf);
	if (ret < 0)
		perror("message d'erreur de ft_read\n");
	errno = 0;
	fd = open("./file/test_4", O_RDONLY);
	buf[0] = 0;
	printf("read: %d : %s\n", ret = read(fd, buf, 10), buf);
	if (ret < 0)
		perror("message d'erreur de read\n");
	errno = 0;
	fd = open("./file/test_4", O_RDONLY);
	buf[0] = 0;
	printf("ft_read: %d : %s\n", ret = ft_read(fd, buf, 10), buf);
	if (ret < 0)
		perror("message d'erreur de ft_read\n");
	errno = 0;
	fd = 42000;
	buf[0] = 0;
	printf("read: %d : %s\n", ret = read(fd, buf, 10), buf);
	if (ret < 0)
		perror("message d'erreur de read\n");
	errno = 0;
	fd = 42000;
	buf[0] = 0;
	printf("ft_read: %d : %s\n", ret = ft_read(fd, buf, 10), buf);
	if (ret < 0)
		perror("message d'erreur de ft_read\n");
	errno = 0;
}

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
	if (ac == 1)
	{
	/*	printf("FT_STRLEN:\n\n");
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
		test_strdup();*/
		printf("\n\n\nFT_ATOI_BASE:\n");
		test_atoi();
/*		printf("\n\n\nFT_WRITE:\n");
		test_write();*/
	}
/*	else if (strcmp(av[1], "ft_strcmp") == 0)
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
		test_atoi();*/
	return (0);
}
