

# FLASH AVRDUDE CONFIGS
FLASH_TOOL = avrdude
# FLASH_TOOL = docker run --rm --privileged -v $(pwd):/build lpodkalicki/avr-toolchain avrdude
MU_CONTROLLER = t2313
PROGRAMMER_TTY = /dev/ttyACM0
PROGRAMMER_TYPE = avrisp
UPLOAD_BAUDRATE = 19200




# Program name
TARGET = ledblink
# the compiler: gcc for C program, define as g++ for C++
CC = avr-gcc
#  -mmcu sets the instructions set: https://gcc.gnu.org/onlinedocs/gcc/AVR-Options.html
#		atiny2313 => avr25
INSTR_SET = avr25 # attiny2313
# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall
LDFLAGS =  # Which libraries to use

# the build target executable:
BUILDDIR = ./bin
# Contains object files (small complied parts of the full program)
OBJDIR = ./obj

# Sourcecode
SRC += src/main.c
OBJFILES = main.o # used to not rebuild entire project


# RULESETS

default: build

all: build

build:
	$(CC) $(CFLAGS) -mmcu=$(INSTR_SET) -o $(BUILDDIR)/$(TARGET).bin $(SRC) $(LDFLAGS) 
	avr-objcopy -j .text -j .data -O ihex $(BUILDDIR)/$(TARGET).bin  $(BUILDDIR)/$(TARGET).hex
clean:
	$(RM) $(OBJDIR)/*
	$(RM) $(BUILDDIR)/*

check:
	$(FLASH_TOOL) -v  -c $(PROGRAMMER_TYPE) -p $(MU_CONTROLLER) -b $(UPLOAD_BAUDRATE) -P $(PROGRAMMER_TTY) 
    # read high and low fuse bit: avrdude  -U lfuse:r:-:i -U hfuse:r:-:i
flash: 
	 $(FLASH_TOOL) -v -c $(PROGRAMMER_TYPE) -p $(MU_CONTROLLER) -b $(UPLOAD_BAUDRATE) -U flash:w:$(BUILDDIR)/${TARGET}.hex:i -P $(PROGRAMMER_TTY)
