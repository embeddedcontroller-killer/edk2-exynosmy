#include <Library/BaseMemoryLib.h>
#include "Platform/Exynos7580.h"

// 1. Saatleri Aç: Donanıma elektrik/sinyal ver
VOID Exynos7580InitUartClock (VOID) {
    UINT32 *PclkReg = (UINT32 *)(EXYNOS7580_CMU_PERI_BASE + EXYNOS7580_EN_PCLK_PERIC);
    UINT32 *SclkReg = (UINT32 *)(EXYNOS7580_CMU_PERI_BASE + EXYNOS7580_EN_SCLK_PERIC);

    *PclkReg |= (1 << 15); // UART0 PCLK aktif
    *SclkReg |= (1 << 0);  // UART0 SCLK aktif
}

// 2. UART donanımını konfigüre et (8N1)
VOID Exynos7580InitUartHardware (VOID) {
    UINT32 *UartBase = (UINT32 *)EXYNOS7580_UART0_BASE;
    
    *(UartBase + (UART_LCR / 4)) = 0x03; // 8-bit, no parity, 1 stop bit
    *(UartBase + (UART_FCR / 4)) = 0x07; // Enable FIFO, clear RX/TX
}

// 3. Tek bir karakter gönder
VOID Exynos7580UartPutChar (CHAR8 Char) {
    UINT32 *UartBase = (UINT32 *)EXYNOS7580_UART0_BASE;
    
    // LSR register'ından "Transmit Holding Register Empty" bitini kontrol et (Bit 5)
    while (!(*(UartBase + (UART_LSR / 4)) & (1 << 5))); 
    
    *(UartBase + (UART_DR / 4)) = (UINT32)Char;
}

// 4. Metin gönder
VOID Exynos7580UartPutS (CHAR8 *String) {
    while (*String != 0) {
        Exynos7580UartPutChar(*String);
        String++;
    }
}

// EDK2'nin standart SerialPortLib fonksiyonlarını burada override ediyoruz
VOID 
EFIAPI 
SerialPortWrite (
  IN UINTN          BufferSize,
  IN CONST VOID     *Buffer
  )
{
    CHAR8 *Str = (CHAR8 *)Buffer;
    for (UINTN i = 0; i < BufferSize; i++) {
        Exynos7580UartPutChar(Str[i]);
    }
}

VOID 
EFIAPI 
SerialPortInit (
  IN UINT32 BaudRate
  )
{
    Exynos7580InitUartClock();
    Exynos7580InitUartHardware();
}
