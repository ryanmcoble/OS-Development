#ifndef __MEMORY__
#define __MEMORY__


/**
 * Memory management
 */


/**
 * Copy memory from source to destination
 */
unsigned char *memcpy(const void *src, unsigned char *dest, int len) {
	// cast source and destination address to char *
	unsigned const char *src_ptr  = (unsigned const char *)src;
	unsigned char *dest_ptr       = (unsigned char *)dest;

	// copy contents of src to dest
	for(;len>0; len--)
		*dest_ptr++ = *src_ptr++;
	return dest;
}

/**
 * Move memory from source to destination
 */
//void memmove(void *dest, const void *src, int len) {
// 	// cast source and destination address to char *
// 	char *cSrc  = (char *)src;
// 	char *cDest = (char *)dest;

// 	// create temporary array to hold data of src
// 	char temp [len];

// 	// copy data from src to temp
// 	for(int i = 0; i < len; i++)
// 		temp[i] = cSrc[i];

// 	// copy data from temp to dest
// 	for(int i = 0; i < len; i++)
// 		cDest[i] = temp[i];

// 	//delete [] temp;
// }

/**
 * Set memory destination to a value
 */
unsigned char *memset(unsigned char *dest,  unsigned char val, int len) {
	unsigned char *dest_ptr = (unsigned char *)dest;

	for(;len>0;len--)
		*dest_ptr++ = val;
	return dest;
}

/**
 * Get the number of characters in a string
 */
// int strlen(const char* str) {
// 	int ret = 0;
// 	while ( str[ret] != 0 )
// 		ret++;
// 	return ret;
// }


/**
 * String compare
 */
// uint8 str_cmp(string str1, string str2) {
// 	uint8 result = 1;
// 	uint8 size   = strlen(str1);

// 	if(size != strlen(str2)) {
// 		result = 0;
// 	}
// 	else {
// 		uint8 i = 0;

// 		for(; i <= size; i++)
// 			if(str1[i] != str2[i])
// 				result = 0;
// 	}

// 	return result;
// }


#endif