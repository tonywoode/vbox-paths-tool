What do I do?
Virtualbox Images can run from any host OS, but the paths in the VirtualBox .vbox setup file (for shared folders principely but also for image locations) need to change when you change OS. We can make indivdual vboxmanage calls to unmount and then remount the specific drives, but Oracle's description of the .vbox files suggests that as long as we change the text in them when no virtualbox process is running, they won't get overridden with the incorrect path. So that's what we do, for windows and OSX. We do this when we runup virtual box not at system boot time because one of the os's may be run up virtualised while the other is running, which would always cause our paths to break. Given that you CAN'T run virtual images inside a virtualised VM, the opposite situation is unlikely to happen, so is deemed much safer

Installation and decryption
Change your paths in vboxPath.cfg (doesn’t matter if you edit it on osx or windows)

Windows
Run MyVirtual.exe, its a compiled (with B2E) version of MyVirtualBox.bat, which does nothing but run the real code in v_box_paths_win.bat. That file reads the paths to box the vbox exe and the image repository from vboxPath.cfg. The recursive text replacement is done using FindAndReplaceText.exe

Mac
Run MyVirtualBox.app, I used Platypus to make this app from platypus_thisDir_runner script (I tried symlinking the script but relative paths a problem), it points to runner which cds up the platypus tree three times (to get out of app/osx/resources and into the parent dir. Runner then calls the real script at vbox_paths_to_osx
Compile with Platypus options are No Ouptut, DON’T tick ‘development version’ (relative path problem), a png of virtual box ico, UNCHECK ‘remain running after initial execution’