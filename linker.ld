/* The bootloader will look at this image and start execution at the symbol
   designated as the entry point. */
ENTRY(_start)
 
/* Tell where the various sections of the object files will be put in the final
   kernel image. */
SECTIONS
{
 /* Begin putting sections at 1 KiB, a conventional place for kernels to be
    loaded at by the bootloader. */
 . = 0x1000;
 
 /* First put the multiboot header, as it is required to be put very early
    early in the image or the bootloader won't recognize the file format.
    Next we'll put the .text section. */
 .text BLOCK(0x100) : ALIGN(0x100)
 {
  *(.multiboot)
  *(.text)
 }
 
 /* Read-write data (initialized) */
 .data BLOCK(0x100) : ALIGN(0x100)
 {
  *(.data)
 }
 
 /* Read-only data. */
 .rdata BLOCK(0x100) : ALIGN(0x100)
 {
  *(.rdata)
 }
 
 /* Read-write data (uninitialized) and stack */
 .bss BLOCK(0x100) : ALIGN(0x100)
 {
  *(COMMON)
  *(.bss)
  *(.bootstrap_stack)
 }
 
 /* The compiler may produce other sections, by default it will put them in
    a segment with the same name. Simply add stuff here as needed. */
}
