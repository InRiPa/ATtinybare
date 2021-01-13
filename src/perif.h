typedef struct {
    int b0:1;
    int b1:1;
    int b2:1;
    int b3:1;
    int b4:1;
    int b5:1;
    int b6:1;
    int b7:1;
} bits_t;

typedef union {
    unsigned char byte;
    bits_t bits;
} both_t;

#define DDRB ((volatile both_t *)0x37)

/*
int main(void) {
    DDRB->byte = 0x55;
    DDRB->bits.b3 = 1;
}
*/
