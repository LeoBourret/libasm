#include <stdio.h>

typedef	struct	s_list
{
	void	*data;
	struct	s_list	*next;
}				t_list;

t_list		*ft_create_elem(void *data);
void		ft_list_push_front(t_list	**begin, void *data);

int		main()
{
	t_list *list;
	char	*first;
	char	*second;
	char	*third;

	first = "43";
	second = "44";
	third = "42";
	list = ft_create_elem(first);
	list->next = ft_create_elem(second);
	ft_list_push_front(&list, third);
	while (list)
	{
		printf("s = %s\n", (char *)list->data);
		list = list->next;
	}
	return (0);
}
