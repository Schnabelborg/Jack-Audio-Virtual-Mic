Set WshShell = WScript.CreateObject("WScript.Shell")

' Activate the Sound window
WshShell.AppActivate "Sound"
WScript.Sleep 50 ' Small delay for window focus

' Switch to the Recording tab (2nd tab)
WshShell.SendKeys "^({TAB})"
WScript.Sleep 80 ' Small delay for tab switch completion

' Navigate to the 6th item (ME6S Microphone)
For i = 1 To 7 ' Move down 5 times to reach the 6th microphone
WshShell.SendKeys "{DOWN}"
WScript.Sleep 25 ' Slightly increased to 100ms for reliable navigation
Next
WScript.Sleep 150 ' Ensure the microphone is selected

' Simulate pressing Space to open the Properties
WshShell.SendKeys " "
WScript.Sleep 150 ' Shortened wait for the Properties window to open

' Switch to the Listen tab (2nd tab in Properties)
WshShell.SendKeys "^({TAB})"
WScript.Sleep 75 ' Small delay for the tab switch

' Send a Space key and then double Enter
WshShell.SendKeys " "
WScript.Sleep 100 ' Fast but reasonable delay between Space and Enter
WshShell.SendKeys "{ENTER}"
WScript.Sleep 100 ' Fast delay between the two Enter key presses
WshShell.SendKeys "{ENTER}"
WScript.Sleep 150 ' Small final delay for completion