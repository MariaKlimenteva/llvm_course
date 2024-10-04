; ModuleID = 'app.ll'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Circle = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }

@circles = common dso_local local_unnamed_addr global [15 x %struct.Circle] zeroinitializer, align 16

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @getAbsVelocity(i32 %0, i32 %1) local_unnamed_addr #0 {
  %3 = icmp slt i32 %0, 0
  %4 = sub nsw i32 0, %0
  %5 = select i1 %3, i32 %4, i32 %0
  %6 = icmp slt i32 %1, 0
  %7 = sub nsw i32 0, %1
  %8 = select i1 %6, i32 %7, i32 %1
  %9 = add nuw nsw i32 %8, %5
  %10 = and i32 %9, 255
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define dso_local void @DrawCircle(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #1 {
  %8 = sub nsw i32 0, %2
  %9 = icmp slt i32 %8, %2
  br i1 %9, label %10, label %.loopexit

10:                                               ; preds = %7
  %11 = mul nsw i32 %2, %2
  %12 = shl i32 %4, 16
  %13 = shl i32 %5, 8
  %14 = or i32 %12, %13
  %15 = or i32 %14, %6
  %16 = or i32 %15, -16777216
  %17 = mul i32 %3, 640
  %18 = add nsw i32 %16, %17
  br label %19

19:                                               ; preds = %23, %10
  %20 = phi i32 [ %8, %10 ], [ %24, %23 ]
  %21 = mul nsw i32 %20, %20
  %22 = add nsw i32 %20, %1
  br label %26

.loopexit:                                        ; preds = %23, %7
  ret void

23:                                               ; preds = %33
  %24 = add i32 %20, 1
  %25 = icmp eq i32 %24, %2
  br i1 %25, label %.loopexit, label %19

26:                                               ; preds = %33, %19
  %27 = phi i32 [ %8, %19 ], [ %34, %33 ]
  %28 = mul nsw i32 %27, %27
  %29 = add nuw nsw i32 %28, %21
  %30 = icmp ult i32 %29, %11
  br i1 %30, label %31, label %33

31:                                               ; preds = %26
  %32 = add nsw i32 %27, %0
  tail call void @simPutPixel(i32 %32, i32 %22, i32 %18) #4
  br label %33

33:                                               ; preds = %31, %26
  %34 = add i32 %27, 1
  %35 = icmp eq i32 %34, %2
  br i1 %35, label %23, label %26
}

declare dso_local void @simPutPixel(i32, i32, i32) local_unnamed_addr #2

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #3 {
  br label %1

1:                                                ; preds = %1, %0
  %2 = phi i64 [ 0, %0 ], [ %39, %1 ]
  %3 = tail call i32 (...) @simRand() #4
  %4 = srem i32 %3, 512
  %5 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %2, i32 0
  store i32 %4, i32* %5, align 8, !tbaa !2
  %6 = tail call i32 (...) @simRand() #4
  %7 = srem i32 %6, 256
  %8 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %2, i32 1
  store i32 %7, i32* %8, align 4, !tbaa !7
  %9 = tail call i32 (...) @simRand() #4
  %10 = srem i32 %9, 128
  %11 = add nsw i32 %10, 128
  %12 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %2, i32 7
  store i32 %11, i32* %12, align 4, !tbaa !8
  %13 = tail call i32 (...) @simRand() #4
  %14 = srem i32 %13, 256
  %15 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %2, i32 8
  store i32 %14, i32* %15, align 8, !tbaa !9
  %16 = tail call i32 (...) @simRand() #4
  %17 = srem i32 %16, 128
  %18 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %2, i32 9
  store i32 %17, i32* %18, align 4, !tbaa !10
  %19 = tail call i32 (...) @simRand() #4
  %20 = srem i32 %19, 50
  %21 = add nsw i32 %20, 2
  %22 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %2, i32 2
  store i32 %21, i32* %22, align 8, !tbaa !11
  %23 = tail call i32 (...) @simRand() #4
  %24 = srem i32 %23, 5
  %25 = add nsw i32 %24, 1
  %26 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %2, i32 3
  store i32 %25, i32* %26, align 4, !tbaa !12
  %27 = tail call i32 (...) @simRand() #4
  %28 = srem i32 %27, 128
  %29 = add nsw i32 %28, 1
  %30 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %2, i32 4
  store i32 %29, i32* %30, align 8, !tbaa !13
  %31 = tail call i32 (...) @simRand() #4
  %32 = srem i32 %31, 2
  %33 = add nsw i32 %32, -1
  %34 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %2, i32 5
  store i32 %33, i32* %34, align 4, !tbaa !14
  %35 = tail call i32 (...) @simRand() #4
  %36 = srem i32 %35, 2
  %37 = add nsw i32 %36, -1
  %38 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %2, i32 6
  store i32 %37, i32* %38, align 8, !tbaa !15
  %39 = add nuw nsw i64 %2, 1
  %40 = icmp eq i64 %39, 15
  br i1 %40, label %.preheader, label %1

.preheader:                                       ; preds = %.loopexit, %1
  br label %41

41:                                               ; preds = %.loopexit, %.preheader
  %42 = phi i64 [ 0, %.preheader ], [ %116, %.loopexit ]
  %43 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42, i32 3
  %44 = load i32, i32* %43, align 4, !tbaa !12
  %45 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42, i32 2
  %46 = load i32, i32* %45, align 8, !tbaa !11
  %47 = add nsw i32 %46, %44
  store i32 %47, i32* %45, align 8, !tbaa !11
  %48 = icmp sgt i32 %47, 42
  br i1 %48, label %49, label %53

49:                                               ; preds = %41
  %50 = tail call i32 (...) @simRand() #4
  %51 = srem i32 %50, 50
  %52 = add nsw i32 %51, 2
  store i32 %52, i32* %45, align 8, !tbaa !11
  br label %53

53:                                               ; preds = %49, %41
  %54 = tail call i32 (...) @simRand() #4
  %55 = srem i32 %54, 512
  %56 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42, i32 0
  store i32 %55, i32* %56, align 8, !tbaa !2
  %57 = tail call i32 (...) @simRand() #4
  %58 = srem i32 %57, 256
  %59 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42, i32 1
  store i32 %58, i32* %59, align 4, !tbaa !7
  %60 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42, i32 7
  %61 = load i32, i32* %60, align 4, !tbaa !8
  %62 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42, i32 4
  %63 = load i32, i32* %62, align 8, !tbaa !13
  %64 = add nsw i32 %63, %61
  %65 = srem i32 %64, 256
  store i32 %65, i32* %60, align 4, !tbaa !8
  %66 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42, i32 8
  %67 = load i32, i32* %66, align 8, !tbaa !9
  %68 = add nsw i32 %67, %63
  %69 = srem i32 %68, 256
  store i32 %69, i32* %66, align 8, !tbaa !9
  %70 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42, i32 9
  %71 = load i32, i32* %70, align 4, !tbaa !10
  %72 = add nsw i32 %71, %63
  %73 = srem i32 %72, 256
  store i32 %73, i32* %70, align 4, !tbaa !10
  %74 = load i32, i32* %56, align 8, !tbaa !2
  %75 = load i32, i32* %45, align 8, !tbaa !11
  %76 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42, i32 5
  %77 = load i32, i32* %76, align 4, !tbaa !14
  %78 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42, i32 6
  %79 = load i32, i32* %78, align 8, !tbaa !15
  %80 = sub nsw i32 0, %75
  %81 = icmp sgt i32 %75, %80
  br i1 %81, label %82, label %.loopexit

82:                                               ; preds = %53
  %83 = icmp slt i32 %79, 0
  %84 = sub nsw i32 0, %79
  %85 = select i1 %83, i32 %84, i32 %79
  %86 = icmp slt i32 %77, 0
  %87 = sub nsw i32 0, %77
  %88 = select i1 %86, i32 %87, i32 %77
  %89 = add nuw nsw i32 %85, %88
  %90 = and i32 %89, 255
  %91 = mul nsw i32 %75, %75
  %92 = shl nsw i32 %65, 16
  %93 = shl nsw i32 %69, 8
  %94 = or i32 %92, %93
  %95 = or i32 %94, %73
  %96 = or i32 %95, -16777216
  %97 = mul nuw nsw i32 %90, 640
  %98 = add nsw i32 %97, %96
  br label %99

99:                                               ; preds = %103, %82
  %100 = phi i32 [ %80, %82 ], [ %104, %103 ]
  %101 = mul nsw i32 %100, %100
  %102 = add nsw i32 %100, %58
  br label %106

103:                                              ; preds = %113
  %104 = add i32 %100, 1
  %105 = icmp eq i32 %104, %75
  br i1 %105, label %.loopexit, label %99

106:                                              ; preds = %113, %99
  %107 = phi i32 [ %80, %99 ], [ %114, %113 ]
  %108 = mul nsw i32 %107, %107
  %109 = add nuw nsw i32 %108, %101
  %110 = icmp ult i32 %109, %91
  br i1 %110, label %111, label %113

111:                                              ; preds = %106
  %112 = add nsw i32 %107, %74
  tail call void @simPutPixel(i32 %112, i32 %102, i32 %98) #4
  br label %113

113:                                              ; preds = %111, %106
  %114 = add i32 %107, 1
  %115 = icmp eq i32 %114, %75
  br i1 %115, label %103, label %106

.loopexit:                                        ; preds = %103, %53
  tail call void (...) @simFlush() #4
  %116 = add nuw nsw i64 %42, 1
  %117 = icmp eq i64 %116, 15
  br i1 %117, label %.preheader, label %41
}

declare dso_local i32 @simRand(...) local_unnamed_addr #2

declare dso_local void @simFlush(...) local_unnamed_addr #2

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3, !4, i64 0}
!3 = !{!"", !4, i64 0, !4, i64 4, !4, i64 8, !4, i64 12, !4, i64 16, !4, i64 20, !4, i64 24, !4, i64 28, !4, i64 32, !4, i64 36}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!3, !4, i64 4}
!8 = !{!3, !4, i64 28}
!9 = !{!3, !4, i64 32}
!10 = !{!3, !4, i64 36}
!11 = !{!3, !4, i64 8}
!12 = !{!3, !4, i64 12}
!13 = !{!3, !4, i64 16}
!14 = !{!3, !4, i64 20}
!15 = !{!3, !4, i64 24}
