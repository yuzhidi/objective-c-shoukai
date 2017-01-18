#
CC = clang
CFLAGS = -Wall -Os -fobjc-arc
#CFLAGS = -Wall -g -fobjc-arc
SRC = MyViewerCtrl.m BrowsingViewerCtrl.m WinCtrl.m \
    BrowsingWinCtrl.m DrawOperation.m main.m MyViewerCtrl+Connection.m
OBJ = MyViewerCtrl.o BrowsingViewerCtrl.o WinCtrl.o \
    BrowsingWinCtrl.o DrawOperation.o main.o MyViewerCtrl+Connection.o
HDR = MyViewerCtrl.h BrowsingViewerCtrl.h WinCtrl.h \
    BrowsingWinCtrl.h DrawOperation.h MyInspector.h MyViewerCtrl+Connection.h
WRAP = BrowsingViewer.app
BNDL = Inspector.bundle

all: app client

client: client.m ShowImage.h
	$(CC) $(CFLAGS) -o client client.m -framework Foundation

app: BrowsingViewer $(BNDL)
	-/bin/rm -rf $(WRAP)
	mkdir $(WRAP)
	mkdir $(WRAP)/Contents
	mkdir $(WRAP)/Contents/MacOS
	mkdir $(WRAP)/Contents/Resources
	cp -p BrowsingViewer $(WRAP)/Contents/MacOS/BrowsingViewer
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

BrowsingViewer: $(OBJ)
	$(CC) -o $@ $(OBJ) -framework Cocoa

MyInspector: MyInspector.o BrowsingViewer
	$(CC) -bundle -bundle_loader ./BrowsingViewer -o $@ MyInspector.o -framework Cocoa

BrowsingViewerCtrl.o: BrowsingViewerCtrl.h MyViewerCtrl.h BrowsingWinCtrl.h
MyViewerCtrl.o: MyViewerCtrl.h WinCtrl.h MyInspector.h
MyViewerCtrl+Connection.o: MyViewerCtrl+Connection.h MyViewerCtrl.h \
	WinCtrl.h ShowImage.h
WinCtrl.o: WinCtrl.h
DrawOperation.o: DrawOperation.h WinCtrl.h
BrowsingWinCtrl.o: BrowsingWinCtrl.h DrawOperation.h
MyInspector.o: MyInspector.h
main.o: MyViewerCtrl.h

clean:
	-/bin/rm -rf *.app *.bundle *.dSYM
	-/bin/rm -rf *.o BrowsingViewer MyInspector client
