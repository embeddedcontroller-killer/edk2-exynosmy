#include <PiPei.h>
#include <Platform/Exynos7580.h>

// Ekranı doğrudan gerçek hafıza odasından masmavi (0xFF0000FF) yapan fonksiyon
VOID SadeceMaviBoyas() {
    UINT32 ToplamPiksel = 720 * 1280;
    
    // dtsi dosyasından söktüğümüz kesinleşen gerçek ION Video (Display) adresi!
    UINT32 *FrameBuffer = (UINT32 *)0x9C000000; 

    for (UINT32 i = 0; i < ToplamPiksel; i++) {
        FrameBuffer[i] = 0xFF0000FF; // Masmavi piksel enjekte et
    }
}

// Modülün ana giriş noktası
EFI_STATUS
EFIAPI
PlatformPeiEntry (
  IN       EFI_PEI_FILE_HANDLE  FileHandle,
  IN CONST EFI_PEI_SERVICES     **PeiServices
  )
{
    // Doğrudan piksellere müdahale et!
    SadeceMaviBoyas();

    // Sistemi burada kilitle ki mavi ekran sabit kalsın
    while(1); 

    return EFI_SUCCESS;
}
