#ifndef __STRING_H__
#define __STRING_H__

void strlen(char *str) {

}

/**
 * Measure the length of a string
 */
int strlen(char *str) {
	int len = 0;
	while(*str++ != '\0') {
		len++;
	}
	return len;
}

#endif