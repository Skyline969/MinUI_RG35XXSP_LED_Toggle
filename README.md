# MinUI_RG35XXSP_LED_Toggle
A toggle for the power LED on MinUI for the RG35XXSP. In theory this should work for any of the RG35XXPlus family of devices, but it has only been tested on the RG35XXSP.

### Warning
This tool interacts with the core system of MinUI (namely MinUI.pak) to allow the tool to inject a script to turn on and keep on the power LED. The tool has been throughly tested and should be reasonably safe, but if your console fails to boot after using this tool simply redownload the latest MinUI build and copy `MinUI.zip` to your SD card, then power your console back on. This will undo all changes made by this tool.

## Installation
Download the latest .zip and extract `Toggle Power LED.pak` to the `Tools/rg35xxplus/` folder on your SD card.

## Usage
Simply run `Toggle Power LED` from the Tools category in MinUI. Please note that you will likely need to run this tool again after a MinUI update.
