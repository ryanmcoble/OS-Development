#ifndef __IDT_H__
#define __IDT_H__

#include "types.h"
#include "constants.h"


/**
 * Interrupt descriptor table
 */


// 64 bits
typedef struct {
	uint16 low_offset;
	uint16 sel;
	uint8 always0; // Ring 0
	uint8 flags;   // Flags
	uint16 high_offset;
} __attribute__((packed)) idt_gate_type; // tell compiler to generate this code verbatum.

// 48 bits
typedef struct {
	uint16 limit; // size
	uint32 base;  // base address
} __attribute__((packed)) idt_register_type;


idt_gate_type idt[IDT_ENTRIES];
idt_register_type idt_reg;


void set_idt_gate(int n, uint32 handler) {
	idt[n].low_offset  = low_16(handler);
	idt[n].sel         = KERNEL_CODE_SEG;
	idt[n].always0     = 0;
	idt[n].flags       = 0x8E;
	idt[n].high_offset = high_16(handler);
}
void set_idt() {
	idt_reg.base  = (uint32) &idt;
	idt_reg.limit = IDT_ENTRIES * sizeof(idt_gate_type) - 1;
	__asm__ __volatile__("lidtl (%0)" : : "r" (&idt_reg));
}


#endif