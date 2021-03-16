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

int		ft_strcmp(void *v1, void *v2)
{
	unsigned char	*s1;
	unsigned char	*s2;
	int				i;

	i = 0;
	s1 = (unsigned char*)v1;
	s2 = (unsigned char*)v2;
	while (s1[i] && s2[i] && s1[i] == s2[i])
		i++;
	return (s1[i] - s2[i]);
}

int		main()
{
	t_list *list;
	char	*first;
	char	*second;
	char	*third;
	int		ret;

	ret = 0;
	first = "14";
	second = "41";
	third = "47";
	list = ft_create_elem(first);
	list->next = ft_create_elem("45");
	list->next->next = ft_create_elem(second);
	ret = ft_list_size(list);
	ft_list_push_front(&list, third);
	ft_list_sort(&list, &ft_strcmp);
	printf("%d\n", ret);
	return (0);
}
