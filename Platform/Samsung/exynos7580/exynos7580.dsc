[Defines]
  PLATFORM_NAME                  = Exynos7580_J7
  PLATFORM_GUID                  = 5a8a68b4-c361-4606-bc7e-2cf864380f2d
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/Exynos7580_J7
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT

[BuildOptions]
  # Hataları görmek için debug modunu açıyoruz
# DEBUG                            = TRUE

[LibraryClasses]
  # EDK2'nin standart SerialPortLib'ini bizim yazdığımızla değiştiriyoruz
  SerialPortLib|Silicon/Samsung/Exynos7580Pkg/Library/Exynos7580SerialPortLib/Exynos7580SerialPortLib.inf

  # Temel Kütüphaneler (MdePkg içinden)
  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  MemoryAllocationLib|MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf
  PeiMemoryAllocationLib|MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf

  # Yeni eklenen zorunlu bağımlılıklar:
  DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf

  # Çekirdek Kütüphaneleri (Doğru Blokta - LibraryClasses Altında)
  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePeCoffGetEntryPointLib.inf
  PeiServicesLib|MdePkg/Library/PeiServicesLib/PeiServicesLib.inf
  PerformanceLib|MdePkg/Library/BasePerformanceLibNull/BasePerformanceLibNull.inf
  ReportStatusCodeLib|MdePkg/Library/BaseReportStatusCodeLibNull/BaseReportStatusCodeLibNull.inf
  OemHookStatusCodeLib|MdeModulePkg/Library/OemHookStatusCodeLibNull/OemHookStatusCodeLibNull.inf
  PeiServicesTablePointerLib|MdePkg/Library/PeiServicesTablePointerLib/PeiServicesTablePointerLib.inf
  # PeiMain İçin Son Zorunlu Çekirdek Bağımlılıkları:
  HobLib|MdePkg/Library/PeiHobLib/PeiHobLib.inf
  MemoryAllocationLib|MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf
  ExtractGuidedSectionLib|MdePkg/Library/BaseExtractGuidedSectionLib/BaseExtractGuidedSectionLib.inf
  # PeiMain Giriş Noktası ve Kripto Bağımlılıkları:
  PeiCoreEntryPoint|MdePkg/Library/PeiCoreEntryPoint/PeiCoreEntryPoint.inf
  BaseCryptLib|CryptoPkg/Library/BaseCryptLibNull/BaseCryptLibNull.inf
  PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
  PeCoffExtraActionLib|MdePkg/Library/BasePeCoffExtraActionLibNull/BasePeCoffExtraActionLibNull.inf
  CacheMaintenanceLib|MdePkg/Library/BaseCacheMaintenanceLib/BaseCacheMaintenanceLib.inf
  ArmLib|ArmPkg/Library/ArmLib/ArmBaseLib.inf
  DebugPrintErrorLevelLib|MdePkg/Library/BaseDebugPrintErrorLevelLib/BaseDebugPrintErrorLevelLib.inf




[PcdsFixedAtBuild]
  # Exynos7580Pkg.dec içindeki sabitleri burada tanımlayabiliriz
  gArmTokenSpaceGuid.gExynos7580UartBase|0x13800000

[Components]
  # Sadece derlenecek ana modüller (Temizlendi)
  Platform/Samsung/exynos7580/PlatformPei/PlatformPei.inf
  MdeModulePkg/Core/Pei/PeiMain.inf
