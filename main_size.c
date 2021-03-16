#include <stdio.h>

typedef	struct	s_list
{
	void	*data;
	struct	s_list	*next;
}				t_list;

t_list		*ft_create_elem(void *data);
void		ft_list_push_front(t_list	**begin, void *data);
int			ft_list_size(t_list *list);

int		main()
{
	t_list *list;
	char	*first;
	char	*second;
	char	*third;
	int		ret;

	ret = 0;
	first = "43";
	second = "44";
	third = "42";
	list = ft_create_elem(first);
	list->next = ft_create_elem(second);
	ret = ft_list_size(list);
	printf("%d\n", ret);
	ft_list_push_front(&list, third);
	ret = ft_list_size(list);
	printf("%d\n", ret);
	return (0);
}
