# Search for system libraries on non-iOS platforms. On iOS, we skip most
# external packages because they are not available in the SDK and we use
# bundled or stub implementations.

# CURL is not needed on iOS
if(NOT IOS)
    find_package(CURL)
endif()

# PCAP is not needed on iOS
if(NOT IOS)
    find_package(PCAP)
endif()

# Always try to find ZLIB (it was found on iOS)
find_package(ZLIB)

# The following packages are generally NOT available on iOS; make them
# non-REQUIRED so configuration does not fail.
if(NOT IOS)
    # These are listed as REQUIRED for non-iOS builds
    find_package(PNG REQUIRED)
    find_package(JPEG REQUIRED)
    find_package(Zstd REQUIRED)
    find_package(LZ4 REQUIRED)
    find_package(WebP REQUIRED)
    find_package(SDL3 REQUIRED)
    find_package(Freetype REQUIRED)
    find_package(plutovg CONFIG REQUIRED)
    find_package(plutosvg CONFIG REQUIRED)
    find_package(ryml CONFIG REQUIRED)
else()
    message(STATUS "iOS build: system UI/graphics libraries may not be found (using bundled or built-in)")
    # On iOS, we still look for these packages but do not require them
    find_package(PNG QUIET)
    find_package(JPEG QUIET)
    find_package(Zstd QUIET)
    find_package(LZ4 QUIET)
    find_package(WebP QUIET)
    find_package(SDL3 QUIET)
    find_package(Freetype QUIET)
    find_package(plutovg CONFIG QUIET)
    find_package(plutosvg CONFIG QUIET)
    find_package(ryml CONFIG QUIET)
endif()
