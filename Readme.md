VBox Paths Tool v0.1
====================

### What does it do?
VirtualBox Images can run from any host OS as long as you have r/w on their folder, but the paths in .vbox setup file (for shared folders and image locations) need to change when you change OS. 

We can make individual vboxmanage calls to unmount and then remount the specific drives and folders every time we change OS, but Oracle's description of the .vbox files suggests that as long as we change the text in them when no virtualbox process is running, they won't get overwritten. So that's what we do, for windows and OSX. 

### What’s the best time to change the .vbox text?
We do this only when we runup VirtualBox not at system boot time (because one of the OSs may be run up virtualised while the other is running, which would always cause our paths to break. Given that you CAN'T run virtual images inside a virtualised VM, the opposite situation is deemed much safer)

### Installation and desciption
Change your paths in vboxPath.cfg (doesn’t matter if you edit it on osx or windows). Change your regexs in the .bat or the vbox_paths_to_osx files. Then:

Windows
=======
Run MyVirtualBox.exe
(its a compiled (with B2E) version of MyVirtualBox.bat, which does nothing but run the real code in v_box_paths_win.bat. That file reads the paths to box the vbox exe and the image repository from vboxPath.cfg. The recursive text replacement is done using FindAndReplaceText.exe)

Mac
===
Run MyVirtualBox.app
(I used Platypus to make this app from platypus_thisDir_runner script (I tried symlinking the script but relative paths a problem), it points to runner which cds up the platypus tree three times (to get out of app/osx/resources and into the parent dir. Runner then calls the real script at vbox_paths_to_osx. Compile with Platypus options are No Ouptut, DON’T tick ‘development version’ (relative path problem), a png of virtual box ico, UNCHECK ‘remain running after initial execution’)

### Anything else to think about
Nothing will work if you don’t have r/w access to the partition the images are in from both OSs. Any interest in a linux runner just let me know….