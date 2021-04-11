

# UPLOAD CONFIGS
FLASH_TOOL = avrdude
# FLASH_TOOL = docker run --rm --privileged -v $(pwd):/build lpodkalicki/avr-toolchain avrdude
MU_CONTROLLER = t2313
PROGRAMMER_TTY = /dev/ttyACM0
PROGRAMMER_TYPE = avrisp
UPLOAD_BAUDRATE = 19200


# the compiler: gcc for C program, define as g++ for C++
CC = avr-gcc

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
#  -mmcu sets the instructions set: https://gcc.gnu.org/onlinedocs/gcc/AVR-Options.html
#		atiny2313 => avr25
CFLAGS  = -g -Wall

# the build target executable:
BUILDDIR = ./bin
OBJDIR = ./obj
TARGET = ledblink

SRC += src/main.c

default: build

all: build

build:
	$(CC) $(CFLAGS) -mmcu=attiny2313 -o $(BUILDDIR)/$(TARGET).bin $(SRC)
	avr-objcopy -j .text -j .data -O ihex $(BUILDDIR)/$(TARGET).bin  $(BUILDDIR)/$(TARGET).hex
clean:
	$(RM) $(OBJDIR)/*
	$(RM) $(BUILDDIR)/*

check:
	$(FLASH_TOOL) -v  -c $(PROGRAMMER_TYPE) -p $(MU_CONTROLLER) -b $(UPLOAD_BAUDRATE) -P $(PROGRAMMER_TTY) 
    # read high and low fuse bit: avrdude  -U lfuse:r:-:i -U hfuse:r:-:i
flash: 
	 $(FLASH_TOOL) -v -c $(PROGRAMMER_TYPE) -p $(MU_CONTROLLER) -b $(UPLOAD_BAUDRATE) -U flash:w:$(BUILDDIR)/${TARGET}.hex:i -P $(PROGRAMMER_TTY)
