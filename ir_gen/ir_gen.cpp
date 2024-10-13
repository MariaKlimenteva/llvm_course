#include "../sim.h" // Предположительно, заголовочный файл с функциями симуляции
                    // графики (simPutPixel, simFlush)
#include "llvm/ExecutionEngine/ExecutionEngine.h" // Для запуска сгенерированного кода
#include "llvm/ExecutionEngine/GenericValue.h"   // Для работы с возвращаемыми значениями
#include "llvm/IR/IRBuilder.h"                    // Для построения IR
#include "llvm/IR/LLVMContext.h"                 // Контекст LLVM
#include "llvm/IR/Module.h"                      // Модуль LLVM (единица компиляции)
#include "llvm/Support/TargetSelect.h"           // Для выбора целевой платформы
#include "llvm/Support/raw_ostream.h"             // Для вывода информации

