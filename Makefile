NAME = libftprintf.a

CC = cc

SRC =	ft_printf.c ft_convert_hex.c ft_convert_ptr.c \
		ft_len_calculator.c ft_convert_dec.c ft_convert_str.c ft_convert_udec.c

HEADER =	ft_printf.h

OBJS = $(SRC:.c=.o)

CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

%.c:%.o $(HEADER)
	${CC} ${CFLAGS} -o $@ -c $<


RM = rm -f

$(NAME): $(OBJS)
	cd ./libft && $(MAKE)
	cp libft/libft.a $(NAME)
	ar rcs $(NAME) $(OBJS)

clean:
	cd ./libft && $(MAKE) clean
	$(RM) $(OBJS)

fclean: clean
	cd ./libft && $(MAKE) fclean
	$(RM) $(NAME)

re: fclean all