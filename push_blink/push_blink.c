#include <msp430.h>

int main() {
    WDTCTL = WDTPW | WDTHOLD;
    P1DIR = 0xff;
    // Hint: each of the following correspond to one register assignment
    // TODO: Set correct bit in correct port to input
    // TODO: Enable input pull up/down resistor
    // TODO: Select pull up
    // TODO: Select falling edge interrupt
    // TODO: Enable interrupt
    __enable_interrupt();
    LPM4;
}

void __interrupt_vec(PORT2_VECTOR) isr_p2() {
    switch (__even_in_range(P2IV, P2IV_P2IFG7)) {
    case (P2IV_P2IFG1):
        // TODO: What should you do here?
        break;
    default:
        break;
    }
}
