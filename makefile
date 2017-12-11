CXX := clang-cl
CXXFLAGS := /O1 /Wall /WX
SRC := (wildcard *.cpp)

bin/%.exe: %.cpp
	$(CXX) $< -o $@ $(CXXFLAGS)

.PHONY: clean

clean:
	del /s *.exe
