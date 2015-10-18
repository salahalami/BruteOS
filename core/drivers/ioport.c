#ifndef IOPORT_H
#define IOPORT_H

unsigned char inportb(unsigned short portid)
{
	unsigned char ret;
	asm volatile("inb %%dx, %%al":"=a"(ret):"d"(portid));
	return ret;
}

void outportb(unsigned short portid, unsigned char value)
{
	asm volatile("outb %%al, %%dx": :"d" (portid), "a" (value));
}

#endif //IOPORT_H
