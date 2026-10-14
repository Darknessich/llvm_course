## Usage:
```
clang++ Pass_trace.cpp -fPIC -shared -I$(llvm-config --includedir) -o libPass.so
clang ../SDL/app.c -c -fpass-plugin=./libPass.so -O2
clang ../SDL/start.c ../SDL/sim.c app.o log.c -lSDL2 -Wl,--wrap=simFlush
./a.out > trace.txt
python3 analyze.py trace.txt > stats.md
```
## Results:
[stats.md](stats.md)
