CSHARP = mcs
MAIN_CLASS = src/c4.cs
PARTIAL_CLASSES = src/connect4.cs
OPT = -optimize+

all:
	$(CSHARP) $(OPT) $(MAIN_CLASS) $(PARTIAL_CLASSES)


run:
	mono src/c4.exe

clean:
	rm src/*.exe