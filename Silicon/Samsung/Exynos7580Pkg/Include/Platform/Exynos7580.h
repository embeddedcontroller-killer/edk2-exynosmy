#ifndef _EXYNOS7580_H_
#define _EXYNOS7580_H_

// --- UART0 (Debug Console) ---
#define EXYNOS7580_UART0_BASE        0x13800000
#define UART_DR                      0x00  // Data Register
#define UART_LSR                     0x14  // Line Status Register
#define UART_LCR                      0x0C  // Line Control Register
#define UART_FCR                      0x10  // FIFO Control Register

// --- CMU (Clock Management Unit) ---
#define EXYNOS7580_CMU_PERI_BASE     0x139F0000
#define EXYNOS7580_EN_PCLK_PERIC     0x0904 // UART0 PCLK Register
#define EXYNOS7580_EN_SCLK_PERIC     0x0A04 // UART0 SCLK Register

// --- GIC (Interrupt Controller) ---
#define EXYNOS7580_GIC_DIST_BASE     0x10C01000
#define EXYNOS7580_GIC_CPU_BASE      0x10C02000

#endif
