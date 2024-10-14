#### How to build
clang -I/usr/include/SDL2 start.c sim.c app.c -lSDL2

#### How to run
./a.out

clang app.c -S -emit-llvm -o app.ll -O2
