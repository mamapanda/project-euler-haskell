HS := stack exec -- ghc
HSFLAGS := -O1
SRC := (wildcard *.hs)
OUT := out

bin/%.exe: %.hs
	$(HS) $< -o $@ -outputdir $(OUT)/$(basename $<) $(HSFLAGS)

.PHONY: clean

clean:
	del /s *.exe
	del /s *.hi
	del /s *.o
