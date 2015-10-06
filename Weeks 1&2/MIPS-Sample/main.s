	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.gnu_attribute 4, 1
	.abicalls
	.option	pic0

 # -G value = 0, Arch = mips32r2, ISA = 33
 # GNU C (Sourcery CodeBench Lite 2013.11-36) version 4.8.1 (mips-linux-gnu)
 #	compiled by GNU C version 4.7.2, GMP version 5.0.5, MPFR version 3.1.1-p2, MPC version 1.0.1
 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed:  -fpreprocessed main.i -mel -march=mips32r2 -mhard-float
 # -mllsc -mplt -mno-shared -mabi=32 -auxbase-strip main.o -Os
 # -fverbose-asm
 # options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
 # -fbranch-count-reg -fcaller-saves -fcombine-stack-adjustments -fcommon
 # -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
 # -fdefer-pop -fdelayed-branch -fdelete-null-pointer-checks -fdevirtualize
 # -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
 # -fexpensive-optimizations -fforward-propagate -ffunction-cse -fgcse
 # -fgcse-lm -fgnu-runtime -fguess-branch-probability
 # -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
 # -findirect-inlining -finline -finline-atomics -finline-functions
 # -finline-functions-called-once -finline-small-functions -fipa-cp
 # -fipa-profile -fipa-pure-const -fipa-reference -fipa-sra
 # -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
 # -fivopts -fkeep-static-consts -fleading-underscore -fmath-errno
 # -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
 # -fomit-frame-pointer -foptimize-register-move -foptimize-sibling-calls
 # -fpartial-inlining -fpcc-struct-return -fpeephole -fpeephole2
 # -fprefetch-loop-arrays -fregmove -freorder-blocks -freorder-functions
 # -frerun-cse-after-loop -fsched-critical-path-heuristic
 # -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
 # -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
 # -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns2
 # -fshow-column -fshrink-wrap -fsigned-zeros -fsplit-ivs-in-unroller
 # -fsplit-wide-types -fstrict-aliasing -fstrict-overflow
 # -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
 # -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
 # -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
 # -ftree-copy-prop -ftree-copyrename -ftree-cselim -ftree-dce
 # -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
 # -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
 # -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
 # -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
 # -ftree-slp-vectorize -ftree-slsr -ftree-sra -ftree-switch-conversion
 # -ftree-tail-merge -ftree-ter -ftree-vect-loop-version -ftree-vrp
 # -funit-at-a-time -fuse-caller-save -fverbose-asm
 # -fzero-initialized-in-bss -mabicalls -mbranch-likely
 # -mcheck-zero-division -mdivide-traps -mdouble-float -mel
 # -mexplicit-relocs -mextern-sdata -mfp-exceptions -mfp32 -mfused-madd
 # -mglibc -mgp32 -mgpopt -mhard-float -mimadd -mllsc -mlocal-sdata
 # -mlong32 -mmemcpy -mno-mdmx -mno-mips16 -mno-mips3d -mplt
 # -mrelax-pic-calls -msplit-addresses

	.text
	.align	2
	.set	nomips16
	.set	nomicromips
	.ent	delay
	.type	delay, @function
delay:
	.frame	$sp,16,$31		# vars= 8, regs= 0/0, args= 0, gp= 8
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16	 #,,
	sw	$0,8($sp)	 #, i
$L2:
	lw	$2,8($sp)	 # i.5, i
	slt	$2,$2,100	 # tmp197, i.5,
	beq	$2,$0,$L6
	nop
	 #, tmp197,,
	lw	$2,8($sp)	 # i.3, i
	addiu	$2,$2,1	 # i.4, i.3,
	sw	$2,8($sp)	 # i.4, i
	j	$L2
	nop
	 #
$L6:
	j	$31	 #
	addiu	$sp,$sp,16	 #,,

	.set	macro
	.set	reorder
	.end	delay
	.size	delay, .-delay
	.align	2
	.globl	entrypoint
	.set	nomips16
	.set	nomicromips
	.ent	entrypoint
	.type	entrypoint, @function
entrypoint:
	.frame	$sp,48,$31		# vars= 16, regs= 1/0, args= 16, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48	 #,,
	li	$2,5			# 0x5	 # tmp197,
	li	$3,-1342111744			# 0xffffffffb0010000	 # tmp205,
	sw	$2,32($sp)	 # tmp197, x
	li	$2,10			# 0xa	 # tmp198,
	sw	$2,28($sp)	 # tmp198, y
	sw	$31,44($sp)	 #,
	sw	$0,24($sp)	 #, z
	addiu	$5,$3,1352	 # tmp206, tmp205,
	li	$4,32768			# 0x8000	 # tmp207,
	li	$7,32768			# 0x8000	 # MEM[(volatile unsigned int *)2952856904B],
$L8:
	lw	$2,32($sp)	 # x.0, x
	lw	$6,28($sp)	 # y.1, y
	addu	$2,$6,$2	 # z.2, y.1, x.0
	sw	$2,24($sp)	 # z.2, z
	sw	$7,0($5)	 # MEM[(volatile unsigned int *)2952856904B], MEM[(volatile unsigned int *)2952856904B]
	jal	delay
	nop
	 #
	sw	$4,1348($3)	 # tmp207, MEM[(volatile unsigned int *)2952856900B]
	jal	delay
	nop
	 #
	j	$L8
	nop
	 #
	.set	macro
	.set	reorder
	.end	entrypoint
	.size	entrypoint, .-entrypoint
	.ident	"GCC: (Sourcery CodeBench Lite 2013.11-36) 4.8.1"
