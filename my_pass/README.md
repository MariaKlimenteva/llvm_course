clang++ ../my_pass/MyPass.cpp -fPIC -shared -I`llvm-config --includedir` -o libPass.so
clang -Xclang -load -Xclang ./libPass.so app.c -emit-llvm -S -O2 app.ll > ../my_pass/info.txt