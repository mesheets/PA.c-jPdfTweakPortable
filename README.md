# PortableApps.com Packaging for jPDF Tweak
A PortableApps.com package bundler for the jPDF Tweak project that existed at https://jpdftweak.sourceforge.io/

## Packaging Steps
1. Copy icons and icon images to .\App\AppInfo
2. Create a .\Help.html file, with images under .\Other\Help\Images  (initial file is simply a local copy of https://jpdftweak.sourceforge.io/)
3. Copy the app distribution itself to .\App\jPdfTweak
   1. Copy in jmupdf32.dll from the Windows x86 download
   2. Copy in jmupdf64.dll from the Windows x64 download
4. Create the PortableApps.com configuration files
   1. .\App\AppInfo\AppInfo.ini
   2. .\App\AppInfo\Launcher\jPdfTweakPortable.ini
5. Run the PortableApps.com Launcher to create the portable app launcher
6. Run the PortableApps.com Installer to create the portable app installer
