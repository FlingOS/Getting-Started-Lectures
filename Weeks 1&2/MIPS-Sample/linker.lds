OUTPUT_ARCH(mips)

ENTRY(_start)

SECTIONS
{
	/* Our base address */
	. = 0xa8000000;

	/* Code */
	.text : {
		*(.text)
	}

	/* Static data */
	.rodata : {
		*(.rodata)
		*(.rodata.*)
	}
	
	/* non-static data */
	.data : {
		*(.data*)
	}
}

