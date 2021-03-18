NAME = libasm.a

SRC = 	./ft_strlen.s \
		./ft_strcpy.s \
		./ft_strcmp.s \
		./ft_write.s  \
		./ft_read.s   \
		./ft_strdup.s \
		./ft_atoi_base_bonus.s \
		./ft_create_elem_bonus.s \
		./ft_list_push_front_bonus.s \
		./ft_list_size_bonus.s \
		./ft_list_sort_bonus.s \
		./ft_list_remove_if_bonus.s

SRC_BONUS = ./ft_atoi_base_bonus.s \
			./ft_create_elem_bonus.s \
			./ft_push_front_bonus.s

NA = nasm
NA_FLAGS = -f elf64

OBJS = $(SRC:.s=.o)

all: $(NAME)

%.o: %.s
	$(NA) $(NA_FLAGS) -o $@ -s $<

${NAME}:		${OBJS}
	ar rcs ${NAME} ${OBJS}

clean:    
	${RM}	${OBJS}

fclean:	clean
	${RM} ${NAME}

re:	fclean all

.PHONY:    all clean fclean re
