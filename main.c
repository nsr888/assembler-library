/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ksinistr <ksinistr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/22 22:06:49 by ksinistr          #+#    #+#             */
/*   Updated: 2020/09/28 12:20:31 by ksinistr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>

size_t				ft_strlen(const char *s);
char				*ft_strcpy(char *dst, const char *src);
int					ft_strcmp(const char *s1, const char *s2);
ssize_t				ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t				ft_read(int fildes, const void *buf, size_t nbyte);
char				*ft_strdup(const char *s1);

void				test_strcmp(char *s1, char *s2)
{
	printf("\n== ft_strcmp ========================================\n");
	printf("\tstring1\t\t: \"%s\"\n", s1);
	printf("\tstring2\t\t: \"%s\"\n", s2);
	printf("\tstrcmp\t\t: %d\n", strcmp(s1, s2));
	printf("\tft_strcmp\t: %d\n", ft_strcmp(s1, s2));
}

void				test_strcpy(char *new_string)
{
	char		dst1[100];
	char		dst2[100];

	printf("\n== ft_strcpy ========================================\n");
	printf("\tstring\t\t: \"%s\"\n", new_string);
	memset(dst1, '\0', sizeof(dst1));
	strcpy(dst1, new_string);
	printf("\tstrcpy\t\t: \"%s\"\n", dst1);
	memset(dst2, '\0', sizeof(dst2));
	ft_strcpy(dst2, new_string);
	printf("\tft_strcpy\t: \"%s\"\n", dst2);
}

void				test_write(int fd, char *s, int buf)
{
	ssize_t ret;

	printf("\n== ft_write ========================================\n");
	ret = write(fd, s, buf);
	printf("\twrite\t\t: errno %d, ret %zd\n", errno, ret);
	ret = ft_write(fd, s, buf);
	printf("\tft_write\t: errno %d, ret %zd\n", errno, ret);
}

void				test_read(int fd)
{
	ssize_t ret;
	char	buf[11];
	int		len;

	len = 10;
	printf("\n== ft_read ========================================\n");
	ret = read(fd, buf, len);
	printf("\tread\t\t: errno %d, ret %zd\n", errno, ret);
	ret = ft_read(fd, buf, len);
	printf("\tft_read\t\t: errno %d, ret %zd\n", errno, ret);
}

void				test_strdup(char *s)
{
	printf("\n== ft_strdup ========================================\n");
	printf("\tstrdup\t\t: %s\n", strdup(s));
	printf("\tft_strdup\t: %s\n", ft_strdup(s));
}

int					main(void)
{
	char			*string;
	size_t			len;

	string = "1234567";
	len = ft_strlen((const char *)string);
	printf("\n== ft_strlen ========================================\n");
	printf("\tstring\t\t: \"%s\"\n", string);
	printf("\tstrlen\t\t: %zu\n", strlen(string));
	printf("\tft_strlen\t: %zu\n", ft_strlen(string));
	test_strcpy("0");
	test_strcpy("435345");
	test_strcmp("1234567", "1234567890");
	test_strcmp("1234568", "1234568");
	test_strcmp("\xff", "\xff\xff");
	test_strcmp("94", "92");
	test_write(1, " ", 1);
	test_write(42, "bbb", 1);
	test_read(open("Makefile", O_RDONLY));
	test_read(42);
	test_strdup("test");
	return (0);
}
