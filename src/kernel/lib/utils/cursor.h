#ifndef __CURSOR_H__
#define __CURSOR_H__

#include "stdio.h"

/**
 * Cursor management
 */
int cursor_x = 0, cursor_y = 0;

/**
 * Move the cursor given x and y coordinates
 */
void k_move_cursor(int x, int y) {
	int pos = x + y * VGA_WIDTH;
	/*
	 * Since we are in protected mode, we cannot use the BIOS interrupt to move the cursor.
	 * Instead, we tell the VGA controller directly.
	 */
	k_outb(0x3D4, 14);
	k_outb(0x3D5, pos >> 8);
	k_outb(0x3D4, 15);
	k_outb(0x3D5, pos);
}

#endif