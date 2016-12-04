#ifndef __STDIO_H__
#define __STDIO_H__

/**
 * Print binary to standard output stream
 */
void k_outb(unsigned short port, unsigned char value) {
  asm volatile ( "outb %0, %1" : : "a"(value), "Nd"(port) );
}

/**
 * Read binary from standard input stream
 */
unsigned char k_inb(unsigned short port) {
   unsigned char ret;
   asm volatile ( "inb %1, %0" : "=a"(ret) : "Nd"(port) );
   return ret;
}

#endif