#
CC = clang
CFLAGS = -Wall -Os -fobjc-arc
#CFLAGS = -Wall -g -fobjc-arc
SRC = MyViewerCtrl.m WinCtrl.m main.m
OBJ = MyViewerCtrl.o WinCtrl.o main.o
HDR = MyViewerCtrl.h WinCtrl.h MyInspector.h
WRAP = MyViewer.app
BNDL = Inspector.bundle

app: MyViewer $(BNDL)
	-/bin/rm -rf $(WRAP)
	mkdir $(WRAP)
	mkdir $(WRAP)/Contents
	mkdir $(WRAP)/Contents/MacOS
	mkdir $(WRAP)/Contents/Resources
	cp -p MyViewer $(WRAP)/Contents/MacOS/MyViewer
	cp -p Info.plist $(WRAP)/Contents
	mv $(BNDL) $(WRAP)/Contents/Resources/
	mkdir $(WRAP)/Contents/Resources/en.lproj
	mkdir $(WRAP)/Contents/Resources/ja.lproj
	cp Localizable-E.strings $(WRAP)/Contents/Resources/en.lproj/Localizable.strings
	cp Localizable-J.strings $(WRAP)/Contents/Resources/ja.lproj/Localizable.strings
	cp Menu-E.plist $(WRAP)/Contents/Resources/en.lproj/Menu.plist
	cp Menu-J.plist $(WRAP)/Contents/Resources/ja.lproj/Menu.plist

$(BNDL): MyInspector
	-/bin/rm -rf $(BNDL)
	mkdir $(BNDL)
	mkdir $(BNDL)/Contents
	mkdir $(BNDL)/Contents/MacOS
	cp -p MyInspector $(BNDL)/Contents/MacOS/Inspector
	cp -p Ins-Info.plist $(BNDL)/Contents/Info.plist
	mkdir $(BNDL)/Contents/Resources
	mkdir $(BNDL)/Contents/Resources/en.lproj
	mkdir $(BNDL)/Contents/Resources/ja.lproj
	cp Ins-Localizable-E.strings $(BNDL)/Contents/Resources/en.lproj/Localizable.strings
	cp Ins-Localizable-J.strings $(BNDL)/Contents/Resources/ja.lproj/Localizable.strings

MyViewer: $(OBJ)
	$(CC) -o $@ $(OBJ) -framework Cocoa

MyInspector: MyInspector.o MyViewer
	$(CC) -bundle -bundle_loader ./MyViewer -o $@ MyInspector.o -framework Cocoa

MyViewerCtrl.o: MyViewerCtrl.h WinCtrl.h MyInspector.h
WinCtrl.o: WinCtrl.h
MyInspector.o: MyInspector.h
main.o: MyViewerCtrl.h

clean:
	-/bin/rm -rf *.app *.bundle *.dSYM
	-/bin/rm -rf *.o MyViewer MyInspector
