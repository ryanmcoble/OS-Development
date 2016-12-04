#ifndef __SCREEN_H__
#define __SCREEN_H__

#include "../constants.h"
#include "memory.h"
#include "stdio.h"
#include "cursor.h"
#include "string.h"


/**
 * Screen management
 */

/**
 * Scroll screen
 */
// void k_scroll_screen() {
// 	short unsigned int blank = 0x20 | (0x07 << 8);
// 	if(cursor_y < VGA_HEIGHT) return;

// 	unsigned char *p_video_buffer_ptr = (unsigned char *)VIDEO_MEMORY;
// 	// same as 25 - (cursor_y - 25 + 1) * 80 * 2
// 	int bottom = cursor_y - (VGA_HEIGHT - 1);
// 	int count  = (VGA_HEIGHT - bottom) * VGA_WIDTH * 2;

// 	memcpy(p_video_buffer_ptr + bottom * VGA_WIDTH, p_video_buffer_ptr, count);
// 	memset(p_video_buffer_ptr + (VGA_HEIGHT - bottom) * VGA_WIDTH, blank, VGA_WIDTH);

// 	cursor_y = VGA_HEIGHT - 1;
// 	k_move_cursor(cursor_x, cursor_y);
// }

/**
 * Clear the screen of all characters
 */
// void k_clear_screen() {
// 	char *p_video_buffer_ptr = (char *)VIDEO_MEMORY;
// 	int j = 0;
// 	/* this loops clears the screen
// 	 * there are 25 lines each of 80 columns; each element takes 2 bytes */
// 	while(j < VGA_WIDTH * VGA_HEIGHT * 2) {
// 		/* blank character */
// 		p_video_buffer_ptr[j] = ' ';
// 		// attribute-byte - light grey on black screen 
// 		p_video_buffer_ptr[j+1] = DEFAULT_VGA_COLOR; 		
// 		j = j + 2;
// 	}
// }

/**
 * Print a single character to the screen
 */
// void k_print_char(char c) {
// 	if(c == 0x08) { // backspace
// 		// decrease cursor_x by one; if end of line, go to previous line; if first line, dont do anything
// 		if(cursor_x == 0 && cursor_y != 0) {
// 			cursor_x = VGA_WIDTH - 1;
// 			cursor_y--;
// 		}
// 		else if(cursor_x > 0) {
// 			cursor_x--;
// 		}
// 	}
// 	else if(c == 0x09) { // tab
// 		// increase to a mulitple of four i.e. the next tab stop
// 		// wondering how it works? dont ask me, ask the guy who wrote bkerndev
// 		cursor_x = (cursor_x + 4) & ~(4 - 1);
// 	}
// 	else if(c == '\n') { // carriage return
// 		cursor_x = 0; // go to the start of the line
// 	}
// 	else if(c == '\n') { // newline
// 		cursor_x = 0; // go to the start of the line
// 		cursor_y++;   // go to the next line
// 	}
// 	else if(c >= 0x20) { // space or higherl valid character
// 		unsigned short *p_video_buffer_ptr = (unsigned short *)VIDEO_MEMORY;
// 		// navigate to cursor position
// 		p_video_buffer_ptr += cursor_x + cursor_y * VGA_WIDTH;
// 		*p_video_buffer_ptr++ = c | 0x07 << 8;
// 		cursor_x++;
// 	}

// 	if(cursor_x >= VGA_WIDTH) { // go to the next line if we've written past this one
// 		cursor_x = 0;
// 		cursor_y++;
// 	}

// 	k_move_cursor(cursor_x, cursor_y);
// 	k_scroll_screen();
// }

/**
 * Print a string to the screen
 */
// void k_print_string(const char *str) {
// 	for(int i = 0; i < /*strlen(str)*/1; i++) {
// 		k_print_char(str[i]);
// 	}
// }


#endif