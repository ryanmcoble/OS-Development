#ifndef __CONSTANTS_H__
#define __CONSTANTS_H__

/**
 * IO ADDRESSES
 */
#define VIDEO_MEMORY    0xB8000 // address to where video memory is read from

/**
 * MISC
 */
#define KERNEL_CODE_SEG 0x08    // offset address where our kernel's .text section start
#define IDT_ENTRIES     256     // number of interrupt descriptor table entries

/**
 * Screen
 */

/* Hardware text mode color constants. */
typedef enum {
	BLACK         = 0,
	BLUE          = 1,
	GREEN         = 2,
	CYAN          = 3,
	RED           = 4,
	MAGENTA       = 5,
	BROWN         = 6,
	LIGHT_GREY    = 7,
	DARK_GREY     = 8,
	LIGHT_BLUE    = 9,
	LIGHT_GREEN   = 10,
	LIGHT_CYAN    = 11,
	LIGHT_RED     = 12,
	LIGHT_MAGENTA = 13,
	LIGHT_BROWN   = 14,
	WHITE         = 15
} VGA_COLOR;

static const int DEFAULT_VGA_COLOR = RED;
static const int VGA_WIDTH  = 80;
static const int VGA_HEIGHT = 25;


#endif