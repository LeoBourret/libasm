NAME = libasm.a

SRC = 	./ft_strlen.s \
		./ft_strcpy.s \
		./ft_strcmp.s \
		./ft_write.s  \
		./ft_read.s   \
		./ft_strdup.s

NA = nasm
NA_FLAGS = -f macho64

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
