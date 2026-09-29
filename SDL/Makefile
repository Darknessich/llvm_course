all: app app-opt

%.ll: %.c
	clang -emit-llvm -S $< -o $@

app-opt.ll: app.c
	clang -emit-llvm -S -O2 $< -o $@

full.bc: start.ll sim.ll app.ll
	llvm-link $^ -o $@

app: app.ll start.c sim.c
	clang $^ -lSDL2 -o $@

app-opt: app-opt.ll start.c sim.c
	clang $^ -lSDL2 -o $@ -O2

clean:
	rm -f app app-opt app.ll start.ll sim.ll full.bc

.PHONY: all clean
