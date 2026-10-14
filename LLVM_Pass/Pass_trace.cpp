#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
using namespace llvm;

struct MyModPass : public PassInfoMixin<MyModPass> {
  Type *voidType;
  Type *int8PtrTy;
  Type *int64Ty;

  bool isFuncLogger(StringRef name) { return name == "useLogger"; }

  bool insertUseLog(Module &M, Function &F, IRBuilder<> &builder) {
    Type *useParamTypes[] = {int8PtrTy, int8PtrTy, int8PtrTy, int64Ty};
    FunctionType *useLogFuncType =
        FunctionType::get(voidType, useParamTypes, false);
    FunctionCallee useLogFunc =
        M.getOrInsertFunction("useLogger", useLogFuncType);

    bool Inserted = false;
    for (auto &B : F) {
      for (auto &I : B) {
        Value *valueAddr = ConstantInt::get(int64Ty, (int64_t)(&I));
        if (isa<PHINode>(&I)) {
          continue;
        }
        builder.SetInsertPoint(&I);
        for (auto &U : I.operands()) {
          if (auto *op = dyn_cast<Instruction>(U.get())) {
            Value *userName = builder.CreateGlobalString(I.getOpcodeName());
            Value *opName = builder.CreateGlobalString(op->getOpcodeName());
            Value *funcName = builder.CreateGlobalString(F.getName());
            Value *args[] = {userName, opName, funcName, valueAddr};
            builder.CreateCall(useLogFunc, args);
            Inserted = true;
          }
        }
      }
    }
    return Inserted;
  }

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
    outs() << "[Module] " << M.getName() << '\n';

    LLVMContext &Ctx = M.getContext();
    IRBuilder<> builder(Ctx);
    voidType = Type::getVoidTy(Ctx);
    int8PtrTy = PointerType::get(Ctx, 0);
    int64Ty = Type::getInt64Ty(Ctx);

    for (auto &F : M) {
      outs() << "[Function] " << F.getName() << " (arg_size: " << F.arg_size()
             << ")\n";
      if (isFuncLogger(F.getName()) || F.isDeclaration()) {
        continue;
      }

      if (insertUseLog(M, F, builder)) {
        outs() << "insertUseLog done\n";
      }

      bool verif = verifyFunction(F, &outs());
      outs() << "[VERIFICATION] " << (verif ? "FAIL\n\n" : "OK\n\n");
    }
    return PreservedAnalyses::none();
  };
};

PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder &PB) {
    PB.registerOptimizerLastEPCallback([](ModulePassManager &MPM, auto, auto) {
      MPM.addPass(MyModPass{});
      return true;
    });
  };

  return {LLVM_PLUGIN_API_VERSION, "MyPlugin", "0.0.1", callback};
};

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}
