
find_package(Qt5DBus QUIET)

if(Qt5DBus_FOUND)

    if(WIN32)
        set(GENERATED_FILE_PATH ${CMAKE_CURRENT_BINARY_DIR}/facelift_generated/FaceliftIPCLibDBus)  # There is a weird issue on Windows related to the MOC if the generated files are outside of ${CMAKE_CURRENT_BINARY_DIR}
    else()
        set(GENERATED_FILE_PATH ${CMAKE_BINARY_DIR}/facelift_generated/FaceliftIPCLibDBus)  # Keep generated file folder outside of CMAKE_CURRENT_BINARY_DIR to avoid having the MOC generated file inside the same folder, which would cause unnecessary recompiles
    endif()

    facelift_generate_code(INTERFACE_DEFINITION_FOLDER ${CMAKE_CURRENT_SOURCE_DIR}/interfaces OUTPUT_PATH ${GENERATED_FILE_PATH})
    include_directories(${GENERATED_FILE_PATH}/ipc ${GENERATED_FILE_PATH}/types)
    facelift_add_library(FaceliftIPCLibDBus
        SOURCES ipc-dbus.cpp ipc-dbus-object-registry.cpp
        HEADERS ipc-dbus.h ipc-dbus-object-registry.h
        SOURCES_GLOB_RECURSE ${GENERATED_FILE_PATH}/ipc/*.cpp ${GENERATED_FILE_PATH}/types/*.cpp
        HEADERS_GLOB_RECURSE_NO_INSTALL ${GENERATED_FILE_PATH}/ipc/*.h ${GENERATED_FILE_PATH}/types/*.h
        LINK_LIBRARIES FaceliftIPCLibLocal Qt5::DBus
        PUBLIC_HEADER_BASE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/..
    )
    target_compile_definitions(FaceliftIPCLibDBus PUBLIC DBUS_IPC_ENABLED)
else()
    if(FACELIFT_ENABLE_DBUS_IPC)
        message(FATAL_ERROR "DBus IPC was explicitly enabled, but QtDBus is not available.")
    endif()
endif()
