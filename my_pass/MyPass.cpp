#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
using namespace llvm;

namespace {
struct MyPass : public FunctionPass {
  static char ID;
  MyPass() : FunctionPass(ID) {}

  virtual bool runOnFunction(Function &F) {
    for (auto& B : F) {
      for (auto& I : B) {
        std::string opcode = I.getOpcodeName(); 
        outs() << opcode << " -> ";

        for (auto& U : I.uses()) {
          User* user = U.getUser();
          Instruction* inst = cast<Instruction>(user);
          unsigned opcode = inst->getOpcode();
          std::string opcodeName = inst->getOpcodeName(opcode);
          outs() << opcodeName << "\n";
        } 
      }
    }
    return false;
  }
  
};
} // namespace

char MyPass::ID = 0;

static void registerMyPass(const PassManagerBuilder &,
                           legacy::PassManagerBase &PM) {
  PM.add(new MyPass());
}
static RegisterStandardPasses
    RegisterMyPass(PassManagerBuilder::EP_OptimizerLast, registerMyPass); // only with -O2
