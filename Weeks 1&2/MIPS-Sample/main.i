# 1 "main.c"
# 1 "<command-line>"
# 1 "c:\\users\\ed\\documents\\coding\\c\\2015\\mips\\compiler\\mips-linux-gnu\\libc\\usr\\include\\stdc-predef.h" 1 3 4
# 30 "c:\\users\\ed\\documents\\coding\\c\\2015\\mips\\compiler\\mips-linux-gnu\\libc\\usr\\include\\stdc-predef.h" 3 4
# 1 "c:\\users\\ed\\documents\\coding\\c\\2015\\mips\\compiler\\mips-linux-gnu\\libc\\usr\\include\\bits\\predefs.h" 1 3 4
# 31 "c:\\users\\ed\\documents\\coding\\c\\2015\\mips\\compiler\\mips-linux-gnu\\libc\\usr\\include\\stdc-predef.h" 2 3 4
# 1 "<command-line>" 2
# 1 "main.c"





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


 while(1) {

  z = x + y;

  write_l(0xb0010548, (1 << 15));
  delay();
  write_l(0xb0010544, (1 << 15));
  delay();
 }

}
