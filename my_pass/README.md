### How to test files in this module

```clang++ ../my_pass/MyPass.cpp -fPIC -shared -I`llvm-config --includedir` -o libPass.so```

```clang -Xclang -load -Xclang ./libPass.so app.c -emit-llvm -S -O2 app.ll > ../my_pass/info.txt```

To run my script (cout statistics): 
```python3 pattern_analyzer.py```