#include <msp430.h>

int main() {
    WDTCTL = WDTPW | WDTHOLD;
    P1DIR = 0xff;
    while (1) {
        P1OUT ^= BIT0;
        __delay_cycles(500000);
    }
}
