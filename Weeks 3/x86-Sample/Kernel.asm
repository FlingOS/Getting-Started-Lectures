; 
; FlingOS™ Getting Started tutorials
; Copyright (C) 2015  Edward Nutting
; 
; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.
; 
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
; 
; You should have received a copy of the GNU General Public License along
; with this program; if not, write to the Free Software Foundation, Inc.,
; 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
; 

; Tell NASM we want 32-bit not 16-bit machine code
BITS 32

; Make the _Kernel_Start label accessible outside of this file
;   - This lets the linker (Ld) see the label so it can mark our OS entry point properly
;   - The OS entry point is like the "main" method of a normal programs
GLOBAL _Kernel_Start:function

; Programs can have different sections which can be loaded into different areas 
SECTION .text

; BEGIN - Multiboot Header
MultibootSignature dd 464367618
MultibootFlags dd 3
MultibootChecksum dd -464367621
MultibootGraphicsRuntime_VbeModeInfoAddr dd 2147483647
MultibootGraphicsRuntime_VbeControlInfoAddr dd 2147483647
MultibootGraphicsRuntime_VbeMode dd 2147483647
MultibootInfo_Memory_High dd 0
MultibootInfo_Memory_Low dd 0
; END - Multiboot Header

MultibootInfo_Structure dd 0

; START - Kernel stack space allocation
Kernel_Stack_Bottom: 
    TIMES 65535 db 0
Kernel_Stack_Top:
; END - Kernel stack space allocation

_Kernel_Start:

    ; Multiboot compliant bootloader provides info in registers:
	; EBX = MultiBoot Info Structure Pointer
	; EAX = 0x2BADB002
    
    ; Test for the mutliboot signature value (0x2BADB002)
    ;   - We want to preserve the value in EBX for later, 
    ;     and we are comparing to EAX, so use the ECX or EDX registers
    mov dword ECX, 0x2BADB002   ; Load value to compare to
    cmp EAX, ECX                ; Compare them (could also use test instruction since we will be testing for equality)
    jne HandleNoMultiboot       ; Jump to separate code if the value in EAX (i.e. what we expect to be the signature) doesn't match
    
    ; Access the 2nd and 3rd fields of the information structure provided by the bootloader
    ;   - EBX contains the address of (i.e. a pointer to) the start of the structure
    ;   - The fields are 4 bytes in size
    mov dword [MultibootInfo_Structure], EBX    ; Store a copy of the original pointer
    add EBX, 4                                  ; Move the pointer to the second field
    mov EAX, [EBX]                              ; Load the value of the field into EAX
    mov [MultibootInfo_Memory_Low], EAX         ; Store the value of the field in our allocated location
    add EBX, 4                                  ; Repeat for third field
    mov EAX, [EBX]
    mov [MultibootInfo_Memory_High], EAX

    ; Switch to protected mode 
    mov dword EAX, CR0  ; Copy the existing value of CR0 to EAX because 
                        ;   - we want to preserve other bits of CR0
                        ;   - we can only access CR0 using the mov instruction
    OR EAX, 1           ; Set bit 1 of value (Protected Mode Enabled flag)
    mov dword CR0, EAX  ; Move new value into CR0
    
    ; Set up the stack
    ;   - Top of stack is a high address
    mov dword ESP, Kernel_Stack_Top ; Very simple: Just need to move the address into ESP.
    
    ; Enter an infinite loop.
    ;   - Note this has changed from last time because we don't want to repeat the code above.
    .InfiniteLoop:
        jmp .InfiniteLoop	; Infinite loop
    
; Short code section for handling what happens if the OS wasn't started by a standards compliant bootloader
HandleNoMultiboot:
    ; Disable maskable interrupts
    ;   - Only a Non-Maskable Interrupt (NMI) will be able to wake the processor
    ;     which is caused by a serious hardware fault.
    cli
    ; Halt the processor. 
    ;   - Stops it dead. Will only restartt due to an interrupt 
    ;     (but we disabled maskable ones (i.e. interrupts from devices) so only an NMI can wake it now)
    hlt
    ; Just in case we do wake up, loop back into the halted state
    jmp HandleNoMultiboot