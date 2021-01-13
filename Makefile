

# UPLOAD CONFIGS
UPLOAD_TOOL = avrdude
MU_CONTROLLER = t2313
PROGRAMMER_TTY = /dev/ttyACM0
PROGRAMMER_TYPE = avrisp
UPLOAD_BAUDRATE = 19200


# the compiler: gcc for C program, define as g++ for C++
CC = avr-gcc

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall

# the build target executable:
BUILDDIR = ./bin
OBJDIR = ./obj
TARGET = ledblink

SRC += src/main.c

default: build

all: build

build:
	$(CC) $(CFLAGS) -o $(BUILDDIR)/$(TARGET) $(SRC)
clean:
	$(RM) $(OBJDIR)/*
	$(RM) $(BUILDDIR)/$(TARGET)

ucheck:
	$(UPLOAD_TOOL) -p $(MU_CONTROLLER) -P $(PROGRAMMER_TTY) -b $(UPLOAD_BAUDRATE) -c $(PROGRAMMER_TYPE)

uupload: 
	# tbd
