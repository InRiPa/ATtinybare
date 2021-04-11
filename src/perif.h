# include "types.h"

#define DDRD    *((volatile u8*) 0x31) 
// 0x12 (0x32) | PORTD |   --- PORTD6 PORTD5 PORTD4 PORTD3 PORTD2 PORTD1 PORTD0
#define PORTD   *((volatile u8*) 0x32)

// 0x18 (0x38) |  PORTB |  PORTB7 PORTB6 PORTB5 PORTB4 PORTB3 PORTB2 PORTB1 PORTB0
#define PORTB   *((volatile u8*) 0x38) 
// 0x17 (0x37) |  DDRB  |  DDB7 DDB6 DDB5 DDB4 DDB3 DDB2 DDB1 DDB0
#define DDRB    *((volatile u8*) 0x37) 


// typedef struct {
//     int b0:1;
//     int b1:1;
//     int b2:1;
//     int b3:1;
//     int b4:1;
//     int b5:1;
//     int b6:1;
//     int b7:1;
// } bits_t;

// typedef union {
//     unsigned char byte;
//     bits_t bits;
// } both_t;


/*
int main(void) {
    DDRB->byte = 0x55;
    DDRB->bits.b3 = 1;
}
*/