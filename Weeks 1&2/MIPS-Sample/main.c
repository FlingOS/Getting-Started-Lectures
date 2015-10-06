#define GPIO_F_SET 0xb0010544
#define GPIO_F_CLEAR 0xb0010548

#define GPIO_F_LED_PIN (1 << 15)

static inline void write_l(unsigned int addr, unsigned int val)
{
	volatile unsigned int *ptr = (unsigned int *)(addr);

	*ptr = val;
}

static void delay()
{
	volatile int i;

	for(i=0; i<100; i++)
		;
}

void entrypoint(void)
{
	volatile unsigned int x = 5;
	volatile unsigned int y = 10;
	volatile unsigned int z = 0;
		
	/* Do the purple LED thing */
	while(1) {
		
		z = x + y;
	
		write_l(GPIO_F_CLEAR, GPIO_F_LED_PIN); /* Turn LED blue */
		delay();
		write_l(GPIO_F_SET, GPIO_F_LED_PIN); /* Turn LED red */
		delay();
	}

}

