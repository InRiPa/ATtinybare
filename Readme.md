# ATTINY2313


# Microcontroller Configuration

## Instruction Set Microcontroller
  * avr-gcc -> "avr25" -> "attiny2313"


## Setting Fuse Bits (p. 160)
Defaults:
  * Low Fuse :      0110 0100 = 0x64
  * High Fuse:      1101 1111 = 0xDF
  * Extended Fuse:  1111 1111 = 0xFF

## Device Clocking Options (p.23)
The device is shipped with **CKSEL = “0100”**, **SUT = “10”**, and **CKDIV8** programmed.

CKSEL Options:
  * 0000 External Clock  
  * 0010 Calibrated Internal RC Oscillator 4MHz 
  * 0100 Calibrated internal RC Oscillator 8MHz 
  * 0110 Watchdog Oscillator 128kHz 
  * 1000 - 1111 External Crystal/Ceramic Resonator 


# Toolchain Setup

## Directly on Host

## Using Docker

https://blog.podkalicki.com/avr-dockerized-toolchain/


# MISC

* Access I/O Memory (64 Addresses), or as the Data Space locations  **0x20 - 0x5F**
* General Purpose working registers (Fig4/ P.10) Register **0x00 - 0x1F**
  * Register(R)0 - 0x00
  * R2 - 0x01
  * ...
  * R26 - 0x1A X-register Low Byte
  * R27 - 0x1B X-register High Byte
  * R28 - 0x1C Y-register Low Byte
  * R29 - 0x1D Y-register High Byte
  * R30 - 0x1E Z-register Low Byte
  * R31 - 0x1F Z-register High Byte
* Stack pointer must be set to a point above **0x60**
* When addressing I/O Registers as data space using ***LD*** and ***ST*** instructions, **0x20** must be added to these addresses.
* General Purpose I/O Registers within the address range 0x00 - 0x1F are directly bit- accessible using the SBI, CBI, SBIS, and SBIC instructions

* Prgram Memory Map **0x0000 - 0x03FF**
* Data Memory Map **0x0000 - 0x001F**
    * 32 Registers 0x0000 - 0x001F
    * 64 I/O Registers 0x0020 - 0x005F
    * Internal SRAM 128x8 0x0060 - 0x00DF


* REGISTER SUMMAARY TABLE AT **p. 212**