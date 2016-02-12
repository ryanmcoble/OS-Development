#include <stdbool.h> /* C doesn't have booleans by default. */

#include <stddef.h>
#include <stdint.h>


#include "_inc/constants.h"
//#include "_inc/drivers/terminal/write.c"



void kernel_main();


// entrypoint
void entry() {

	/* Initialize terminal interface */
	//terminal_initialize();

	/* Since there is no support for newlines in terminal_putchar
     * yet, '\n' will produce some VGA specific character instead.
     * This is normal.
     */
	//terminal_writestring("Hello, kernel World test!\n");


	kmain();
}

void print(char *message) {
	char *p_video_buffer = (char*) VIDEO_MEMORY;

	char *p_next_char = message;

	while(*p_next_char) {
		*p_video_buffer = *p_next_char;
		p_next_char++;
		p_video_buffer += 2;
	}
}

void kernel_main() {
	print("Executing our C kernel");

	// loop forever, to keep CPU busy
	while(1) {}
}