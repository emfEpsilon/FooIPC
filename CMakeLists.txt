cmake_minimum_required(VERSION 3.10)

# Project name and version
project(FooIPC VERSION 0.1.0)

# Set C standard
set(CMAKE_C_STANDARD 99)

# Options to build client and server
option(BUILD_SERVER "Build the server" ON)
option(BUILD_CLIENT "Build the client" ON)

# Include directories for the common files
include_directories(include/common)

# Add executable for the server if enabled
if(BUILD_SERVER)
    # Collect all source files for the server
    file(GLOB SERVER_SOURCES "src/server/*.c")
    add_executable(server ${SERVER_SOURCES})
    
    # Include directories for the server
    target_include_directories(server PRIVATE include/server)
    
    # Add compilation flags for the server
    #target_compile_options(server PRIVATE -Wall -pedantic -Werror -Wextra -Wconversion -std=gnu11)
endif()

# Add executable for the client if enabled
if(BUILD_CLIENT)
    # Collect all source files for the client
    file(GLOB CLIENT_SOURCES "src/client/*.c")
    add_executable(client ${CLIENT_SOURCES})
    
    # Include directories for the client
    target_include_directories(client PRIVATE include/client)
    
    # Add compilation flags for the client
    #target_compile_options(client PRIVATE -Wall -pedantic -Werror -Wextra -Wconversion -std=gnu11)
endif()

if (RUN_TESTS EQUAL 1 OR RUN_COVERAGE EQUAL 1)
    add_subdirectory(tests)
endif()