exampleC/func.o:
	@echo "building func.o";
	emcc -c exampleC/func.c -o exampleC/func.o -I./exampleC -O3

exampleCSimplePrint/main.wasm exampleCSimplePrint/main.js: 
	@echo "buidling main.wasm";
	emcc -o exampleCSimplePrint/main.js exampleCSimplePrint/main.c exampleC/func.o -I./exampleC \
		-O3 -s WASM=1 --shell-file html_template/shell_minimal.html -s NO_EXIT_RUNTIME=1 -s "EXPORTED_FUNCTIONS=['_main', '_fact']"  -s "EXTRA_EXPORTED_RUNTIME_METHODS=['ccall', 'callMain']"

exampleC/foo.wasm exampleC/foo.js:
	@echo "building foo.wasm";
	emcc -o  exampleC/foo.js exampleC/foo.c exampleC/func.c -I./exampleC -O3 \
		-s WASM=1 -s NO_EXIT_RUNTIME=1  -s "EXPORTED_FUNCTIONS=['_main', '_fact']" -s "EXTRA_EXPORTED_RUNTIME_METHODS=['ccall', 'callMain']"

.PHONY : all
all: exampleC/func.o exampleCSimplePrint/main.wasm exampleC/foo.wasm

.PHONY : clean
clean:
	$(RM) exampleC/*.wasm exampleC/*.js exampleC/*.o exampleCSimplePrint/*.wasm exampleCSimplePrint/*.js