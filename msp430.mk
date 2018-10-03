# msp430.mk -- make macros for MSP430
# Copyright 2018 Kevin Zheng <kevinz@berkeley.edu>
#
# In your environment:
#
#   export MSP430_TOOLCHAIN=/path/to/gcc-msp430/toolchain
#
# In your Makefile:
#
# 	DEVICE=msp430f5529
# 	MAIN=blink
# 	SRCS=blink.c
# 	include msp430.mk

MSP430_SUPPORT_DIR?=$(MSP430_TOOLCHAIN)/include
MSP430_TOOLCHAIN?=/usr/local/gcc-msp430-ti-toolchain-5.01.02.00
MSPDEBUG?=mspdebug tilib
RM?=rm -f

CC=msp430-elf-gcc -mmcu=$(DEVICE)
CFLAGS=-I $(MSP430_SUPPORT_DIR)
LDFLAGS=-L $(MSP430_SUPPORT_DIR)

OBJS=$(SRCS:.c=.o)

$(MAIN): $(OBJS)

.SUFFIX: s

.c.s:
	$(CC) -S $(CFLAGS) $<

.PHONY: clean prog verify

clean:
	$(RM) $(MAIN) $(OBJS)

prog: $(MAIN)
	$(MSPDEBUG) 'prog $(MAIN)'

verify: $(MAIN)
	$(MSPDEBUG) 'verify $(MAIN)'
