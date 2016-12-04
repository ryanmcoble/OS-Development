void kmain();

// entrypoint - trampoline into main kernel function
void entry() {
	kmain();
}

/**
 * Includes must go after entry function, as it will be loaded first
 */
#include "lib/constants.h"
#include "lib/utils/screen.h"
#include "lib/utils/cursor.h"
//#include "lib/isr.h"


void kmain(void) {

	k_move_cursor(20, 20);

	// install interrupt table
	//isr_install();

	// clear the screen
	//k_clear_screen();

	//int i = 5 / 0;
	//k_print_string("Welcome to my OS!\nPlease enter a command\n");


	// loop forever, to keep CPU busy
	while(1) {}
	//print_string("RCOS> ");
}