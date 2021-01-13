// 0x18 (0x38) |  PORTB |  PORTB7 PORTB6 PORTB5 PORTB4 PORTB3 PORTB2 PORTB1 PORTB0
#define PORTB   *((volatile int*) 0x38) 
// 0x17 (0x37) |  DDRB  |  DDB7 DDB6 DDB5 DDB4 DDB3 DDB2 DDB1 DDB0
#define DDRB    *((volatile int*) 0x37) 

// 0x12 (0x32) | PORTD |   --- PORTD6 PORTD5 PORTD4 PORTD3 PORTD2 PORTD1 PORTD0
#define PORTD   *((volatile int*) 0x38) 
// 0x11 (0x31) | DDRD |    --- DDD6 DDD5 DDD4 DDD3 DDD2 DDD1 DDD0
// u8 *dirD = 0x32;
// *dirD = 0b00100000;
#define DDRD    *((volatile int*) 0x37) 

typedef unsigned char u8;


int main(void) 
{
    DDRD = 0b00100000;
    u8 repeater = 255;
    while(1){

        repeater = 255;
        for (u8 i = 0; i < 255; i++)
        {
            PORTB = 0b00100000;
            repeater--;
            if(repeater == 0)
                break;

        }


        repeater = 255;
        for (u8 i = 0; i < 255; i++)
        {
            PORTB = 0b00000000;
            repeater--;
            if(repeater == 0)
                break;

        }
        
    }
    
   
}