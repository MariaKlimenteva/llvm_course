### How to test files in this module

```clang++ ../my_pass/MyPass.cpp -fPIC -shared -I`llvm-config --includedir` -o libPass.so```

```clang -Xclang -load -Xclang ./libPass.so app.c -emit-llvm -S -O2 app.ll > ../my_pass/info.txt```

To run my script (cout statistics): 
```python3 pattern_analyzer.py```

---

I rewrite this task to counting stats in runtime. Ypu can run it with:
```clang++ ModPass.cpp -fPIC -shared -I$(llvm-config --includedir) -o libPass.so```
```clang -fpass-plugin=./libPass.so log.c ../app/sim.c ../app/app.c ../app/start.c -lSDL2 -I/usr/include/SDL2 -O2```
```a.out``` 
And stop the app when you think it's enough statistics.
Then run python script: ```python3 pattern_analyzer.py``` and watch in the graph (opcode_statistics_runtime.png)