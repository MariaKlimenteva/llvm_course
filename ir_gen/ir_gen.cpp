#include "../app/sim.h" 

#include "llvm/ExecutionEngine/ExecutionEngine.h" 
#include "llvm/ExecutionEngine/GenericValue.h"   
#include "llvm/IR/IRBuilder.h"                   
#include "llvm/IR/LLVMContext.h"                 
#include "llvm/IR/Module.h"                      
#include "llvm/Support/TargetSelect.h"           
#include "llvm/Support/raw_ostream.h"            

using namespace llvm;

int main() {
    LLVMContext context;

    // ; ModuleID = 'simple_app.ll'
    // source_filename = "simple_app.c"
    Module* module = new Module("simple_app.c", context);
    IRBuilder<> builder(context);

    // declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) 
    // local_unnamed_addr #1
    Type *voidType = Type::getVoidTy(context);
    ArrayRef<Type *> simPutPixelParamTypes = {Type::getInt32Ty(context),
                                                Type::getInt32Ty(context),
                                                Type::getInt32Ty(context)};
    FunctionType *simPutPixelType =
        FunctionType::get(voidType, simPutPixelParamTypes, false);
    FunctionCallee simPutPixelFunc =
        module->getOrInsertFunction("simPutPixel", simPutPixelType);

    // declare void @simFlush(...) local_unnamed_addr #1
    FunctionType *simFlushType = FunctionType::get(voidType, {}, false);
    FunctionCallee simFlushFunc =
        module->getOrInsertFunction("simFlush", simFlushType);

    // declare i32 @simRand(...) local_unnamed_addr #1
    FunctionType* simRandType = FunctionType::get(builder.getInt32Ty(), {}, false);
    FunctionCallee simRandFunc = 
        module->getOrInsertFunction("simRand", simRandType);

    // define dso_local void @DrawCircle(i32 noundef %0, i32 noundef %1, i32 noundef %2,
    // i32 noundef %3, i32 noundef %4, i32 noundef %5) 
    // local_unnamed_addr #0
    FunctionType *drawCircleType =
        FunctionType::get(builder.getVoidTy(),
                        {builder.getInt32Ty(), builder.getInt32Ty(),
                         builder.getInt32Ty(), builder.getInt32Ty(),
                         builder.getInt32Ty(), builder.getInt32Ty()},
                        false);
    Function *drawCircleFunc = Function::Create(
        drawCircleType, GlobalValue::ExternalLinkage, "DrawCircle", module);

    // BasicBlocks:
    BasicBlock *BB0 = BasicBlock::Create(context, "", drawCircleFunc);
    BasicBlock *BB9 = BasicBlock::Create(context, "", drawCircleFunc);
    BasicBlock *BB16 = BasicBlock::Create(context, "", drawCircleFunc);
    BasicBlock *BB22 = BasicBlock::Create(context, "", drawCircleFunc);
    BasicBlock *BB25 = BasicBlock::Create(context, "", drawCircleFunc);
    BasicBlock *BB30 = BasicBlock::Create(context, "", drawCircleFunc);
    BasicBlock *BB35 = BasicBlock::Create(context, "", drawCircleFunc);
    BasicBlock *BB36 = BasicBlock::Create(context, "", drawCircleFunc);
    BasicBlock *loopexit = BasicBlock::Create(context, ".loopexit", drawCircleFunc);

    Function::arg_iterator args = drawCircleFunc->arg_begin();
    Value *arg0 = args++; // x
    Value *arg1 = args++; // y
    Value *arg2 = args++; // radius
    Value *arg3 = args++; // r
    Value *arg4 = args++; // g
    Value *arg5 = args++; // b

    // 0:
    builder.SetInsertPoint(BB0);
    // %7 = sub nsw i32 0, %2
    Value *val7_draw = builder.CreateSub(
        ConstantInt::get(context, APInt(32, 0)), arg2);
    // %8 = icmp sgt i32 %2, 0
    Value *val8_draw = builder.CreateICmpSGT(arg2, 
        ConstantInt::get(context, APInt(32, 0)));
    // br i1 %8, label %9, label %.loopexit
    builder.CreateCondBr(val8_draw, BB9, loopexit);

    // 9:
    builder.SetInsertPoint(BB9);
    // %10 = mul nsw i32 %2, %2
    Value *val10_draw = builder.CreateMul(arg2, arg2);
    // %11 = shl i32 %3, 16
    Value *val11_draw = builder.CreateShl(arg3, ConstantInt::get(context, APInt(32, 16)));
    // %12 = shl i32 %4, 8
    Value *val12_draw = builder.CreateShl(arg4, ConstantInt::get(context, APInt(32, 8)));
    // %13 = or i32 %11, %12
    Value *val13_draw = builder.CreateOr(val11_draw, val12_draw);
    // %14 = or i32 %13, %5
    Value *val14_draw = builder.CreateOr(val13_draw, arg5);
    // %15 = or i32 %14, -16777216
    Value *val15_draw = builder.CreateOr(val14_draw, ConstantInt::get(context, APInt(32, -16777216)));
    // br label %16
    builder.CreateBr(BB16); 

    // 16:
    builder.SetInsertPoint(BB16);
    // %17 = phi i32 [ %7, %9 ], [ %23, %22 ]
    PHINode *val17_draw = builder.CreatePHI(builder.getInt32Ty(), 2);
    val17_draw->addIncoming(val7_draw, BB9);
    // %18 = mul nsw i32 %17, %17
    Value *val18_draw = builder.CreateMul(val17_draw, val17_draw);
    // %19 = add nsw i32 %17, %1
    Value *val19_draw = builder.CreateAdd(val17_draw, arg1);
    // %20 = icmp sgt i32 %19, -1
    Value *val20_draw = builder.CreateICmpSGT(val19_draw, ConstantInt::get(context, APInt(32, -1)));
    // %21 = icmp slt i32 %19, 256
    Value *val21_draw = builder.CreateICmpSLT(val19_draw, ConstantInt::get(context, APInt(32, 256)));
    // br label %25
    builder.CreateBr(BB25);
    
    // loopexit :
    builder.SetInsertPoint(loopexit);
    builder.CreateRetVoid(); //  Выход из функции 

    // 22 (.loopexit):  
    builder.SetInsertPoint(BB22);
    // %23 = add nsw i32 %17, 1
    Value *val23_draw = builder.CreateAdd(val17_draw, ConstantInt::get(context, APInt(32, 1)));
    val17_draw->addIncoming(val23_draw, BB22);
    // %24 = icmp slt i32 %23, %2
    Value *val24_draw = builder.CreateICmpSLT(val23_draw, arg2);
    // br i1 %24, label %16, label %.loopexit, !llvm.loop !5
    builder.CreateCondBr(val24_draw, BB16, loopexit);

    // 25:
    builder.SetInsertPoint(BB25);
    // %26 = phi i32 [ %7, %16 ], [ %37, %36 ]
    PHINode *val26_draw = builder.CreatePHI(builder.getInt32Ty(), 2);
    // %27 = mul nsw i32 %26, %26
    Value *val27_draw = builder.CreateMul(val26_draw, val26_draw);
    // %28 = add nuw nsw i32 %27, %18
    Value *val28_draw = builder.CreateNSWAdd(val27_draw, val18_draw);
    // %29 = icmp ult i32 %28, %10
    Value *val29_draw = builder.CreateICmpULT(val28_draw, val10_draw);
    // br i1 %29, label %30, label %36
    builder.CreateCondBr(val29_draw, BB30, BB36); 

    // 30: 
    builder.SetInsertPoint(BB30);
    // %31 = add nsw i32 %26, %0
    Value *val31_draw = builder.CreateAdd(val26_draw, arg0);
    // %32 = icmp ult i32 %31, 512
    Value *val32_draw = builder.CreateICmpULT(val31_draw, ConstantInt::get(context, APInt(32, 512)));
    // %33 = select i1 %32, i1 %20, i1 false
    Value *val33_draw = builder.CreateSelect(val32_draw, val20_draw, ConstantInt::get(context, APInt(1, 0)));
    // %34 = select i1 %33, i1 %21, i1 false 
    Value *val34_draw = builder.CreateSelect(val33_draw, val21_draw, ConstantInt::get(context, APInt(1, 0)));
    // br i1 %34, label %35, label %36
    builder.CreateCondBr(val34_draw, BB35, BB36); 

    // 35: 
    builder.SetInsertPoint(BB35);
    // tail call void @simPutPixel(i32 noundef %31, i32 noundef %19, i32 noundef %15) #3
    builder.CreateCall(simPutPixelFunc, {val31_draw, val19_draw, val15_draw});
    // br label %36
    builder.CreateBr(BB36); 

    // 36: 
    builder.SetInsertPoint(BB36); 
    // %37 = add nsw i32 %26, 1
    Value *val37_draw = builder.CreateAdd(val26_draw, ConstantInt::get(context, APInt(32, 1)));
    // %38 = icmp slt i32 %37, %2
    Value *val38_draw = builder.CreateICmpSLT(val37_draw, arg2);
    // br i1 %38, label %25, label %22, !llvm.loop !7
    builder.CreateCondBr(val38_draw, BB25, BB22); 

    // define dso_local void @app() local_unnamed_addr #2 {
    FunctionType *appType = FunctionType::get(builder.getVoidTy(), {}, false);
    Function *appFunc = Function::Create(appType, GlobalValue::ExternalLinkage, 
        "app", module);

    // BasicBlocks:
    BasicBlock *BB2 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *BB1 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *BB7 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *BBbackedge = BasicBlock::Create(context, ".backedge", appFunc);
    BasicBlock *BBpreheader = BasicBlock::Create(context, ".preheader", appFunc);
    BasicBlock *BB21 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *BB31 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *BB37 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *BB40 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *BB45 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *BB50 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *BB51 = BasicBlock::Create(context, "", appFunc);
    BasicBlock *BBloopexit = BasicBlock::Create(context, ".loopexit", appFunc);

    // 0:
    builder.SetInsertPoint(BB2);
    // br label %1
    builder.CreateBr(BB1);

    // 1:                                   ; preds = %.backedge, %0
    builder.SetInsertPoint(BB1);                                     
    // %2 = phi i32 [ 0, %0 ], [ %.be, %.backedge ]
    PHINode *phi2 = builder.CreatePHI(builder.getInt32Ty(), 2);
    // %3 = and i32 %2, 511
    Value *val3 = builder.CreateAnd(phi2, builder.getInt32(511));
    // %4 = lshr i32 %2, 9
    Value *val4 = builder.CreateLShr(phi2, builder.getInt32(9));
    // tail call void @simPutPixel(i32 noundef %3, i32 noundef %4, i32 noundef 0) #3
    builder.CreateCall(simPutPixelFunc, {val3, val4, builder.getInt32(0)});
    // %5 = add nuw nsw i32 %2, 1
    Value *val5 = builder.CreateNSWAdd(phi2, builder.getInt32(1));
    // %6 = icmp eq i32 %5, 131072
    Value *val6 = builder.CreateICmpEQ(val5, builder.getInt32(131072));
    // br i1 %6, label %.preheader, label %.backedge
    builder.CreateCondBr(val6, BBpreheader, BBbackedge);

    // 7:                                                ; preds = %.loopexit
    builder.SetInsertPoint(BB7);
    // tail call void (...) @simFlush() #3
    builder.CreateCall(simFlushFunc);
    // br label %.backedge
    builder.CreateBr(BBbackedge);

    // .backedge:                                        ; preds = %7, %1
    builder.SetInsertPoint(BBbackedge);
    // %.be = phi i32 [ %5, %1 ], [ 0, %7 ]
    PHINode *phi_be = builder.CreatePHI(builder.getInt32Ty(), 2, ".be");
    phi_be->addIncoming(val5, BB1);
    phi_be->addIncoming(builder.getInt32(0), BB7);
    // br label %1, !llvm.loop !8
    builder.CreateBr(BB1);

    // .preheader:                                       ; preds = %1, %.loopexit
    builder.SetInsertPoint(BBpreheader);
    // %8 = phi i32 [ %54, %.loopexit ], [ 0, %1 ]
    PHINode *phi8 = builder.CreatePHI(builder.getInt32Ty(), 2);
    phi8->addIncoming(builder.getInt32(0), BB1); 
    // %9 = tail call i32 (...) @simRand() #3
    Value *val9 = builder.CreateCall(simRandFunc, {});
    // %10 = srem i32 %9, 512
    Value *val10 = builder.CreateSRem(val9, builder.getInt32(512));
    // %11 = tail call i32 (...) @simRand() #3
    Value *val11 = builder.CreateCall(simRandFunc, {});
    // %12 = srem i32 %11, 256
    Value *val12 = builder.CreateSRem(val11, builder.getInt32(256));
    // %13 = tail call i32 (...) @simRand() #3
    Value *val13 = builder.CreateCall(simRandFunc, {});
    // %14 = srem i32 %13, 50
    Value *val14 = builder.CreateSRem(val13, builder.getInt32(50));
    // %15 = add nsw i32 %14, 5
    Value *val15 = builder.CreateAdd(val14, builder.getInt32(5));
    // %16 = tail call i32 (...) @simRand() #3
    Value *val16 = builder.CreateCall(simRandFunc, {});
    // %17 = tail call i32 (...) @simRand() #3
    Value *val17 = builder.CreateCall(simRandFunc, {});
    // %18 = tail call i32 (...) @simRand() #3
    Value *val18 = builder.CreateCall(simRandFunc, {});
    // %19 = sub nsw i32 -5, %14
    Value *val19 = builder.CreateSub(ConstantInt::get(context, APInt(32, -5)), val14);
    // %20 = icmp sgt i32 %14, -5
    Value *val20 = builder.CreateICmpSGT(val14, ConstantInt::get(context, APInt(32, -5)));
    // br i1 %20, label %21, label %.loopexit
    builder.CreateCondBr(val20, BB21, BBloopexit);

    // 21:                                               ; preds = %.preheader
    builder.SetInsertPoint(BB21);
    // %22 = srem i32 %18, 256
    Value *val22 = builder.CreateSRem(val18, builder.getInt32(256));
    // %23 = srem i32 %17, 256
    Value *val23 = builder.CreateSRem(val17, builder.getInt32(256));
    // %24 = srem i32 %16, 256
    Value *val24 = builder.CreateSRem(val16, builder.getInt32(256));
    // %25 = mul nuw nsw i32 %15, %15
    Value *val25 = builder.CreateNSWMul(val15, val15);
    // %26 = shl nsw i32 %24, 16
    Value *val26 = builder.CreateShl(val24, builder.getInt32(16));
    // %27 = shl nsw i32 %23, 8
    Value *val27 = builder.CreateShl(val23, builder.getInt32(8));
    // %28 = or i32 %26, %27
    Value *val28 = builder.CreateOr(val26, val27);
    // %29 = or i32 %28, %22
    Value *val29 = builder.CreateOr(val28, val22);
    // %30 = or i32 %29, -16777216
    Value *val30 = builder.CreateOr(val29, ConstantInt::get(context, APInt(32, -16777216)));
    // br label %31
    builder.CreateBr(BB31);

    // 31:                                               ; preds = %37, %21
    builder.SetInsertPoint(BB31);
    // %32 = phi i32 [ %19, %21 ], [ %38, %37 ]
    PHINode *phi32 = builder.CreatePHI(builder.getInt32Ty(), 2);
    phi32->addIncoming(val19, BB21);
    // %33 = mul nsw i32 %32, %32
    Value *val33 = builder.CreateMul(phi32, phi32);
    // %34 = add nsw i32 %32, %12
    Value *val34 = builder.CreateAdd(phi32, val12);
    // %35 = icmp sgt i32 %34, -1
    Value *val35 = builder.CreateICmpSGT(val34, ConstantInt::get(context, APInt(32, -1)));
    // %36 = icmp slt i32 %34, 256
    Value *val36 = builder.CreateICmpSLT(val34, builder.getInt32(256));
    // br label %40
    builder.CreateBr(BB40);

    // 37:                                               ; preds = %51
    builder.SetInsertPoint(BB37);
    // %38 = add nsw i32 %32, 1
    Value *val38 = builder.CreateAdd(phi32, builder.getInt32(1));
    // %39 = icmp slt i32 %38, %15
    Value *val39 = builder.CreateICmpSLT(val38, val15);
    // br i1 %39, label %31, label %.loopexit, !llvm.loop !5
    builder.CreateCondBr(val39, BB31, BBloopexit);

    // 40:                                               ; preds = %51, %31
    builder.SetInsertPoint(BB40);
    // %41 = phi i32 [ %19, %31 ], [ %52, %51 ]
    PHINode *phi41 = builder.CreatePHI(builder.getInt32Ty(), 2);
    phi41->addIncoming(val19, BB31);
    // %42 = mul nsw i32 %41, %41
    Value *val42 = builder.CreateMul(phi41, phi41);
    // %43 = add nuw nsw i32 %42, %33
    Value *val43 = builder.CreateNSWAdd(val42, val33);
    // %44 = icmp ult i32 %43, %25
    Value *val44 = builder.CreateICmpULT(val43, val25);
    // br i1 %44, label %45, label %51
    builder.CreateCondBr(val44, BB45, BB51);

    // 45:                                               ; preds = %40
    builder.SetInsertPoint(BB45);
    // %46 = add nsw i32 %41, %10
    Value *val46 = builder.CreateAdd(phi41, val10);
    // %47 = icmp ult i32 %46, 512
    Value *val47 = builder.CreateICmpULT(val46, builder.getInt32(512));
    // %48 = select i1 %47, i1 %35, i1 false
    Value *val48 = builder.CreateSelect(val47, val35, builder.getFalse());
    // %49 = select i1 %48, i1 %36, i1 false
    Value *val49 = builder.CreateSelect(val48, val36, builder.getFalse());
    // br i1 %49, label %50, label %51
    builder.CreateCondBr(val49, BB50, BB51);

    // 50:                                               ; preds = %45
    builder.SetInsertPoint(BB50);
    // tail call void @simPutPixel(i32 noundef %46, i32 noundef %34, i32 noundef %30) #3
    builder.CreateCall(simPutPixelFunc, {val46, val34, val30});
    // br label %51
    builder.CreateBr(BB51);

    // 51:                                               ; preds = %50, %45, %40
    builder.SetInsertPoint(BB51);
    // %52 = add nsw i32 %41, 1
    Value *val52 = builder.CreateAdd(phi41, builder.getInt32(1));
    // %53 = icmp slt i32 %52, %15
    Value *val53 = builder.CreateICmpSLT(val52, val15);
    // br i1 %53, label %40, label %37, !llvm.loop !7
    builder.CreateCondBr(val53, BB40, BB37);

    // .loopexit:                                        ; preds = %37, %.preheader
    builder.SetInsertPoint(BBloopexit);
    // %54 = add nuw nsw i32 %8, 1
    Value *val54 = builder.CreateNSWAdd(phi8, builder.getInt32(1));
    // %55 = icmp eq i32 %54, 15
    Value *val55 = builder.CreateICmpEQ(val54, builder.getInt32(15));
    // br i1 %55, label %7, label %.preheader, !llvm.loop !9}
    builder.CreateCondBr(val55, BB7, BBpreheader);

    // Link PHI nodes
    phi2->addIncoming(builder.getInt32(0), BB2);
    val26_draw->addIncoming(val7_draw, BB16); 
    val26_draw->addIncoming(val37_draw, BB36);
    phi2->addIncoming(phi_be, BBbackedge);
    phi8->addIncoming(val54, BBloopexit);
    phi32->addIncoming(val38, BB37);
    phi41->addIncoming(val52, BB51);

    builder.SetInsertPoint(BBloopexit);

    // Dump LLVM IR
    module->print(outs(), nullptr);


    // Interpreter of LLVM IR
    outs() << "Running code...\n";
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
    
    ee->InstallLazyFunctionCreator([&](const std::string &fnName) -> void * {
        if (fnName == "simPutPixel") {
            return reinterpret_cast<void *>(simPutPixel);
        }
        if (fnName == "simFlush") {
            return reinterpret_cast<void *>(simFlush);
        }
        if (fnName == "simRand") {
            return reinterpret_cast<void *>(simRand);
        }
        return nullptr;
    });
    ee->finalizeObject();
    simInit();
    ArrayRef<GenericValue> noargs;
    GenericValue v = ee->runFunction(appFunc, noargs);
    outs() << "Code was run.\n";

    simExit();
    return EXIT_SUCCESS;
}