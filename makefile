CXX := g++
CXXFLAGS := -O -Wall -Werror -Wno-unused-result
SRC := (wildcard *.cpp)

bin/%.exe: %.cpp
	$(CXX) $< -o $@ $(CXXFLAGS)

.PHONY: clean

clean:
	del /s *.exe
