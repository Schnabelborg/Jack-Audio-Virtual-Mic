Add-Type -assembly System.Windows.Forms
Add-Type -assembly System.Drawing
$main_form = New-Object System.Windows.Forms.Form


$main_form.Text = "QJackCTL Virtual Mic Setup"
$main_form.Icon = "C:\Program Files\JACK2\jack.ico"
$main_form.BackColor = "White"
$main_form.StartPosition = 1
$main_form.Width = 220
$main_form.Height = 240
$main_form.FormBorderStyle = "FixedDialog"
$main_form.MaximizeBox = 0
$main_form.MinimizeBox = 0


$check = New-Object System.Windows.Forms.CheckBox
$check.AutoSize = 0
$check.Text = "Listen to HiFi-Cable?"
$check.Font = "Microsoft Sans Serif,9"
$check.Width = $main_form.Width
$check.Location = New-Object System.Drawing.Point(10, (($main_form.Height * (5/6)) - $check.Height))


$main_form.Controls.Add($check)


$title = New-Object System.Windows.Forms.Label
$title.AutoSize = 0
$title.Text = "Choose an audio processor."
$title.Font = [System.Drawing.SystemFonts]::MessageBoxFont
$title.Height = 30
$title.Width = $main_form.Width
$title.TextAlign = "MiddleCenter"

$main_form.Controls.Add($title)


$button1 = New-Object System.Windows.Forms.Button
$button1.Location = New-Object System.Drawing.Point((($main_form.Width / 2) - ($button1.Width / 2)), ($main_form.Height * (1/4) + 20))
$button1.FlatStyle = "System"
$button1.Text = "OK"

$main_form.Controls.Add($button1)

$button1.Add_Click(
{if ($check.Checked){start ~\"Listen to HiFi-Cable.bat" -wait}

start C:\"Program Files"\"Image-Line"\"FL Studio 2024"\FL64.exe
start C:\"Program Files"\JACK2\qjackctl\qjackctl.exe
start C:\"Program Files (x86)"\VB\ASIOBridge\VBCABLE_AsioBridge.exe
$main_form.Close()
}
)


$fl = New-Object System.Windows.Forms.Label
$fl.AutoSize = 0
$fl.Location = New-Object System.Drawing.Point(0, (($main_form.Height * (1/4) - $button1.Height + 20)))
$fl.Text = "Use FL Studio to process the audio?"
$title.Font = [System.Drawing.SystemFonts]::MessageBoxFont
$fl.Height = 30
$fl.Width = $main_form.Width
$fl.TextAlign = "TopCenter"

$main_form.Controls.Add($fl)


$button2 = New-Object System.Windows.Forms.Button
$button2.Location = New-Object System.Drawing.Point((($main_form.Width / 2) - ($button2.Width / 2)), ($main_form.Height * (1/2) + 20))
$button2.FlatStyle = "System"
$button2.Text = "OK"

$main_form.Controls.Add($button2)

$button2.Add_Click(
{if ($check.Checked){start ~\"Listen to HiFi-Cable.bat" -wait}

start C:\"Program Files"\Carla\Carla.exe
start C:\"Program Files"\JACK2\qjackctl\qjackctl.exe
start C:\"Program Files (x86)"\VB\ASIOBridge\VBCABLE_AsioBridge.exe
$main_form.Close()}
)


$carla = New-Object System.Windows.Forms.Label
$carla.AutoSize = 0
$carla.Location = New-Object System.Drawing.Point(0, (($main_form.Height * (1/2) - $button2.Height + 20)))
$carla.Text = "Use Carla to process the audio?"
$title.Font = [System.Drawing.SystemFonts]::DialogFont
$carla.Height = 30
$carla.Width = $main_form.Width
$carla.TextAlign = "TopCenter"

$main_form.Controls.Add($carla)


$result = [System.Windows.Forms.MessageBox]::Show("Start the QJackCTL Virtual Mic Setup?", "QJackCTL Virtual Mic Setup", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.MessageBoxImage]::Question)
if ($result -eq [System.Windows.Forms.DialogResult]::No){$main_form.Close()}
#$main_form.Padding = New-Object System.Windows.Forms.Padding(10)
$main_form.ShowDialog()