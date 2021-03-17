#include <stdio.h>

typedef	struct	s_list
{
	void	*data;
	struct	s_list	*next;
}				t_list;

t_list		*ft_create_elem(void *data);
void		ft_list_push_front(t_list	**begin, void *data);
int			ft_list_size(t_list *list);
void		ft_list_sort(t_list **begin, int(*cmp)());

int		ft_memcmp(const void *s1, const void *s2)
{
	const char	*ptr1;
	const char	*ptr2;
	size_t		i;

	ptr1 = s1;
	ptr2 = s2;
	i = 0;
	while (ptr1[i] == ptr2[i] && ptr1[i] && ptr2[i])
		i++;
	return ((unsigned char)ptr1[i] - (unsigned char)ptr2[i]);
}

int		main()
{
	t_list *list;
	char	*first;
	char	*second;
	char	*third;
	int		i;

	list = ft_create_elem("3");
	list->next = ft_create_elem("1");
	list->next->next = ft_create_elem("4");
	ft_list_push_front(&list, "2");
	ft_list_sort(&list, &ft_memcmp);
	while (list)
	{
		printf("%s\n", (char *)list->data);
		list = list->next;
	}
	return (0);
}
