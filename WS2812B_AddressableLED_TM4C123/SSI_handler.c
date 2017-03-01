#include <stdint.h>
#include "SSI_handler.h"
// *************************** Screen dimensions ***************************
/*
#define DC                      (*((volatile uint32_t *)0x40004100))
#define DC_COMMAND              0
#define DC_DATA                 0x40
#define RESET                   (*((volatile uint32_t *)0x40004200))
#define RESET_LOW               0
#define RESET_HIGH              0x80
#define GPIO_PORTA_DIR_R        (*((volatile uint32_t *)0x40004400))
#define GPIO_PORTA_AFSEL_R      (*((volatile uint32_t *)0x40004420))
#define GPIO_PORTA_DEN_R        (*((volatile uint32_t *)0x4000451C))
#define GPIO_PORTA_AMSEL_R      (*((volatile uint32_t *)0x40004528))
#define GPIO_PORTA_PCTL_R       (*((volatile uint32_t *)0x4000452C))
#define SSI0_CR0_R              (*((volatile uint32_t *)0x40008000))
#define SSI0_CR1_R              (*((volatile uint32_t *)0x40008004))
#define SSI0_DR_R               (*((volatile uint32_t *)0x40008008))
#define SSI0_SR_R               (*((volatile uint32_t *)0x4000800C))
#define SSI0_CPSR_R             (*((volatile uint32_t *)0x40008010))
#define SSI0_CC_R               (*((volatile uint32_t *)0x40008FC8))
#define SSI_CR0_SCR_M           0x0000FF00  // SSI Serial Clock Rate
#define SSI_CR0_SPH             0x00000080  // SSI Serial Clock Phase
#define SSI_CR0_SPO             0x00000040  // SSI Serial Clock Polarity
#define SSI_CR0_FRF_M           0x00000030  // SSI Frame Format Select
#define SSI_CR0_FRF_MOTO        0x00000000  // Freescale SPI Frame Format
#define SSI_CR0_DSS_M           0x0000000F  // SSI Data Size Select
#define SSI_CR0_DSS_8           0x00000007  // 8-bit data
#define SSI_CR1_MS              0x00000004  // SSI Master/Slave Select
#define SSI_CR1_SSE             0x00000002  // SSI Synchronous Serial Port
                                            // Enable
#define SSI_SR_BSY              0x00000010  // SSI Busy Bit
#define SSI_SR_TNF              0x00000002  // SSI Transmit FIFO Not Full
#define SSI_CPSR_CPSDVSR_M      0x000000FF  // SSI Clock Prescale Divisor
#define SSI_CC_CS_M             0x0000000F  // SSI Baud Clock Source
#define SSI_CC_CS_SYSPLL        0x00000000  // Either the system clock (if the
                                            // PLL bypass is in effect) or the
                                            // PLL output (default)
#define SYSCTL_RCGC1_R          (*((volatile uint32_t *)0x400FE104))
#define SYSCTL_RCGC2_R          (*((volatile uint32_t *)0x400FE108))
#define SYSCTL_RCGCGPIO_R       (*((volatile uint32_t *)0x400FE608))
#define SYSCTL_RCGCSSI_R        (*((volatile uint32_t *)0x400FE61C))
#define SYSCTL_RCGC1_SSI0       0x00000010  // SSI0 Clock Gating Control
#define SYSCTL_RCGC2_GPIOA      0x00000001  // port A Clock Gating Control
*/
// The Data/Command pin must be valid when the eighth bit is
// sent.  The SSI module has hardware input and output FIFOs
// that are 8 locations deep.  Based on the observation that
// the LCD interface tends to send a few commands and then a
// lot of data, the FIFOs are not used when writing
// commands, and they are used when writing data.  This
// ensures that the Data/Command pin status matches the byte
// that is actually being transmitted.
// The write command operation waits until all data has been
// sent, configures the Data/Command pin for commands, sends
// the command, and then waits for the transmission to
// finish.
// The write data operation waits until there is room in the
// transmit FIFO, configures the Data/Command pin for data,
// and then adds the data to the transmit FIFO.

// This is a helper function that sends an 8-bit message to the LCD.
// inputs: type     COMMAND or DATA
//         message  8-bit code to transmit
// outputs: none
// assumes: SSI0 and port A have already been initialized and enabled

void SSI0_DataOut(uint8_t data){
  while((SSI0_SR_R&0x00000002)==0){}; // wait until transmit FIFO not full
  SSI0_DR_R = data;                // data out
}

//********Nokia5110_Init*****************
// Initialize Nokia 5110 48x84 LCD by sending the proper
// commands to the PCD8544 driver.  One new feature of the
// LM4F120 is that its SSIs can get their baud clock from
// either the system clock or from the 16 MHz precision
// internal oscillator.
// inputs: none
// outputs: none
// assumes: system clock rate of 80 MHz
void SSI0_Init(void){
  volatile uint32_t delay;
  SYSCTL_RCGCSSI_R |= 0x01;             // activate SSI0
  SYSCTL_RCGCGPIO_R |= 0x01;            // activate port A
  delay = SYSCTL_RCGC2_R;               // allow time to finish activating

  GPIO_PORTA_AFSEL_R |= 0x24;           // enable alt funct on PA2,5
  //GPIO_PORTA_AFSEL_R &= ~0xC0;          // disable alt funct on PA6,7
  GPIO_PORTA_DEN_R |= 0x24;             // enable digital I/O on PA2, 5
                                        // configure PA2,5 as SSI
  GPIO_PORTA_PCTL_R = (GPIO_PORTA_PCTL_R&0xFF0FF0FF)+0x00200200;
                                        // configure PA6,7 as GPIO
  //GPIO_PORTA_PCTL_R = (GPIO_PORTA_PCTL_R&0x00FFFFFF)+0x00000000;
  GPIO_PORTA_AMSEL_R &= ~0x24;          // disable analog functionality on PA2, 5
  SSI0_CR1_R &= ~SSI_CR1_SSE;           // disable SSI
  SSI0_CR1_R &= ~SSI_CR1_MS;            // master mode
                                        // configure for system clock/PLL baud clock source
  SSI0_CC_R = (SSI0_CC_R&~SSI_CC_CS_M)+SSI_CC_CS_SYSPLL;
                                        // clock divider for 3.33 MHz SSIClk (80 MHz PLL/24)
                                        // SysClk/(CPSDVSR*(1+SCR))
                                        // 80/(24*(1+0)) = 3.33 MHz (slower than 4 MHz)
  SSI0_CPSR_R = (SSI0_CPSR_R&~SSI_CPSR_CPSDVSR_M)+12; // must be even number
  SSI0_CR0_R &= ~(SSI_CR0_SCR_M |       // SCR = 0 (3.33 Mbps data rate)
                  SSI_CR0_SPH |         // SPH = 0
                  SSI_CR0_SPO);         // SPO = 0
                                        // FRF = Freescale format
  SSI0_CR0_R = (SSI0_CR0_R&~SSI_CR0_FRF_M)+SSI_CR0_FRF_MOTO;
                                        // DSS = 8-bit data
  SSI0_CR0_R = (SSI0_CR0_R&~SSI_CR0_DSS_M)+SSI_CR0_DSS_8;
  SSI0_CR1_R |= SSI_CR1_SSE;            // enable SSI

  for(delay=0; delay<10; delay=delay+1);// delay minimum 100 ns
}
