// Visual Studio
// Do linkera trzeba dodac biblioteke ("Netapi32.lib")
// Properties -> Linker -> Input  (I dopisac w rubryce Additional Dependencies





#include <iostream>
#include <Windows.h>
#include <lmaccess.h>
#pragma comment(lib, "urlmon.lib")

using namespace std;


BOOL memoryCheck() {
    // This function will check and see if the system has 5+GB of RAM
    // Declare the MEMORYSTATUSEX Struct    
    MEMORYSTATUSEX statex;
    // Set the length of the struct to the size of the struct    
    statex.dwLength = sizeof(statex);
    // Invoke the GlobalMemoryStatusEx Windows API to get the current memory info    
    GlobalMemoryStatusEx(&statex);
    // Checks if the System Memory is greater than 5.00GB    
    if (statex.ullTotalPhys / 1024 / 1024 / 1024 >= 5.00) {
        return TRUE;
    }
    else {
        return FALSE;
    }
}

