#include "perif.h"


void some_delay(){
    u8 repeater = 255;

    for (u8 i = 0; i < 255; i++){
            repeater--;
            if(repeater == 0)
                break;
        }
}

int main(void) {

    DDRD = 0b00100000; // PD5
    // u8 PORTD =   *((volatile int*) 0x32 ;
    
    while(1){

        PORTD = 0b00100000;
        some_delay(); // some delay needed 

        PORTD = 0b00000000;
        some_delay(); // some delay needed
    }

}