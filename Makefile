# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ksinistr <ksinistr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/22 19:26:41 by ksinistr          #+#    #+#              #
#    Updated: 2020/09/28 11:07:45 by ksinistr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_LIB =	libasm.a
SRC_ASM =	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s
OBJ_ASM =	$(patsubst %.s, %.o, $(SRC_ASM))
NAME_TEST =	test
SRC_TEST =	main.c
OBJ_TEST =	main.o
NASM =		nasm -f macho64
CC =		gcc -Wall -Wextra -Werror

all: $(NAME_LIB) $(NAME_TEST)

$(NAME_LIB): $(OBJ_ASM)
	ar rcs $@ $(OBJ_ASM)

$(NAME_TEST): $(OBJ_TEST) $(NAME_LIB)
	$(CC) -o $@ $< -L. -lasm

$(OBJ_TEST): %.o : %.c
	$(CC) -c $<

$(OBJ_ASM): %.o: %.s
	$(NASM) $<

clean:
	rm -f $(OBJ_TEST)
	rm -f $(OBJ_ASM)

fclean: clean
	rm -f $(NAME_LIB)
	rm -f $(NAME_TEST)

re: fclean $(NAME_LIB)

.PHONY: all clean fclean re
