CC = clang
CFLAGS = -Wall -Os -fobjc-arc
FRAME = -framework Cocoa
OBJ = main.o FunctionCtrl.o QuadraticView.o QuadraticView+Draw.o
WRAP = Quadratic.app

app: Quadratic
	-/bin/rm -rf $(WRAP)
	mkdir $(WRAP)
	mkdir $(WRAP)/Contents
	mkdir $(WRAP)/Contents/Resources/
	mkdir $(WRAP)/Contents/Resources/English.lproj
	mkdir $(WRAP)/Contents/Resources/Japanese.lproj
	mkdir $(WRAP)/Contents/MacOS
	cp -p Quadratic $(WRAP)/Contents/MacOS/Quadratic
	cp -p Info.plist $(WRAP)/Contents

Quadratic: $(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAME)

FunctionCtrl.o: FunctionCtrl.h QuadraticView.h
QuadraticView.o: QuadraticView.h QuadraticView+Draw.h
main.o: FunctionCtrl.h

clean:
	-/bin/rm -rf $(WRAP) *.o Quadratic
