// Visual Studio
// Do linkera trzeba dodac biblioteke ("Netapi32.lib")
// Properties -> Linker -> Input  (I dopisac w rubryce Additional Dependencies





#include <iostream>
#include <Windows.h>
#include <lmaccess.h>
#pragma comment(lib, "urlmon.lib")

using namespace std;




BOOL isDomainController() {
    // Create a long pointer to Wide String for our DC Name to live in
    LPCWSTR dcName;
    // Query the NetGetDCName Win32 API for the Domain Controller Name
    NetGetDCName(NULL, NULL, (LPBYTE*)&dcName);
    // Convert the DCName from a Wide String to a String
    wstring ws(dcName);
    string dcNewName(ws.begin(), ws.end());
    // Search if the UNC path is referenced in the dcNewName variable. If so, there is likely a Domain Controller present in the environment. If this is true, pass the check, else, fail.
    if (dcNewName.find("\\\\")) {
        return TRUE;
    }
    else {
        return FALSE;
    }
}
