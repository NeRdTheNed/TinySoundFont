cmake_minimum_required (VERSION 3.8)
project (tsf)

set(CMAKE_C_STANDARD 17)

list(APPEND TSF_SOURCES tsf.c tml.c)

add_library(tsf STATIC ${TSF_SOURCES})

# target_compile_definitions(tsf PUBLIC ...)
target_include_directories(tsf PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_definitions(tsf
    PUBLIC
        # If the debug configuration pass the DEBUG define to the compiler
        $<$<CONFIG:Debug>:DEBUG>
)

add_executable(example1 examples/example1.c examples/minisdl_audio.c)
set_target_properties(example1 PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/examples
)

if (APPLE)
  find_library(COCOA_LIBRARY Cocoa)
  find_library(CORE_AUDIO CoreAudio REQUIRED)
  #find_library(APPKIT_LIB AppKit)
  find_library(AUDIO_UNIT AudioUnit REQUIRED)
  target_link_libraries(example1 ${COCOA_LIBRARY} ${CORE_AUDIO} ${AUDIO_UNIT})
endif()