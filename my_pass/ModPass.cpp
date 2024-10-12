#include "llvm/IR/IRBuilder.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
using namespace llvm;

struct MyModPass : public PassInfoMixin<MyModPass> {
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
    if(M.getName() == "../app/app.c") {
      for (auto &F : M) {
        LLVMContext &Ctx = F.getContext();
        // Тип аргумента Logger (char*)
        Type *loggerArgType = Type::getInt8PtrTy(Ctx);
        // Тип функции Logger (void(char*))
        FunctionType *loggerFuncType =
            FunctionType::get(Type::getVoidTy(Ctx), loggerArgType, false);
        // Получаем (или создаем) функцию Logger
        FunctionCallee loggerFunc = M.getOrInsertFunction("Logger", loggerFuncType);

        for (auto &B : F) {
          for (auto &I : B) {
            if (isa<PHINode>(I)) { // игнорирую PHI
              continue;
            }
            IRBuilder<> builder(&I);
            std::string opcodeStr = I.getOpcodeName();
            std::string userName;

            for (auto &U : I.uses()) { // получаю users 
              User* user = U.getUser();
              Instruction* inst = cast<Instruction>(user);
              unsigned opcode = inst->getOpcode();
              userName = inst->getOpcodeName(opcode);
            }

            std::string logMessage = opcodeStr + " -> " + userName; 
            Constant *logMessageConst = builder.CreateGlobalStringPtr(logMessage); 

            builder.CreateCall(loggerFunc, logMessageConst); // вызываю LOGGER перед каждой инструкцией
        }
      }
      }
    }
    return PreservedAnalyses::none();
  };
};

PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder &PB) {
    PB.registerPipelineStartEPCallback([&](ModulePassManager &MPM, auto) {
      MPM.addPass(MyModPass{});
      return true;
    });
  };

  return {LLVM_PLUGIN_API_VERSION, "MyPlugin", "0.0.1", callback};
};

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}
