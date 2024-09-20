; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Circle = type { i32, i32, i32, i32, i32, i32, i32 }

@circles = common dso_local global [15 x %struct.Circle] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getAbsVelocity(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %2
  %8 = load i32, i32* %3, align 4
  %9 = sub nsw i32 0, %8
  store i32 %9, i32* %3, align 4
  br label %10

10:                                               ; preds = %7, %2
  %11 = load i32, i32* %4, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = load i32, i32* %4, align 4
  %15 = sub nsw i32 0, %14
  store i32 %15, i32* %4, align 4
  br label %16

16:                                               ; preds = %13, %10
  %17 = load i32, i32* %3, align 4
  %18 = load i32, i32* %4, align 4
  %19 = add nsw i32 %17, %18
  %20 = and i32 %19, 255
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @DrawCircle(i32 %0, i32 %1, i32 %2, i32 %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %13 = load i32, i32* %7, align 4
  %14 = sub nsw i32 0, %13
  store i32 %14, i32* %9, align 4
  br label %15

15:                                               ; preds = %55, %4
  %16 = load i32, i32* %9, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %58

19:                                               ; preds = %15
  %20 = load i32, i32* %7, align 4
  %21 = sub nsw i32 0, %20
  store i32 %21, i32* %10, align 4
  br label %22

22:                                               ; preds = %51, %19
  %23 = load i32, i32* %10, align 4
  %24 = load i32, i32* %7, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %54

26:                                               ; preds = %22
  %27 = load i32, i32* %10, align 4
  %28 = load i32, i32* %10, align 4
  %29 = mul nsw i32 %27, %28
  %30 = load i32, i32* %9, align 4
  %31 = load i32, i32* %9, align 4
  %32 = mul nsw i32 %30, %31
  %33 = add nsw i32 %29, %32
  %34 = load i32, i32* %7, align 4
  %35 = load i32, i32* %7, align 4
  %36 = mul nsw i32 %34, %35
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %50

38:                                               ; preds = %26
  %39 = load i32, i32* %5, align 4
  %40 = load i32, i32* %10, align 4
  %41 = add nsw i32 %39, %40
  store i32 %41, i32* %11, align 4
  %42 = load i32, i32* %6, align 4
  %43 = load i32, i32* %9, align 4
  %44 = add nsw i32 %42, %43
  store i32 %44, i32* %12, align 4
  %45 = load i32, i32* %11, align 4
  %46 = load i32, i32* %12, align 4
  %47 = load i32, i32* %8, align 4
  %48 = shl i32 %47, 6
  %49 = add i32 -5240065, %48
  call void @simPutPixel(i32 %45, i32 %46, i32 %49)
  br label %50

50:                                               ; preds = %38, %26
  br label %51

51:                                               ; preds = %50
  %52 = load i32, i32* %10, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %10, align 4
  br label %22

54:                                               ; preds = %22
  br label %55

55:                                               ; preds = %54
  %56 = load i32, i32* %9, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %9, align 4
  br label %15

58:                                               ; preds = %15
  ret void
}

declare dso_local void @simPutPixel(i32, i32, i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @app() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = call i64 @time(i64* null) #3
  store i64 %4, i64* %1, align 8
  %5 = load i64, i64* %1, align 8
  %6 = trunc i64 %5 to i32
  call void @srand(i32 %6) #3
  store i32 0, i32* %2, align 4
  br label %7

7:                                                ; preds = %58, %0
  %8 = load i32, i32* %2, align 4
  %9 = icmp slt i32 %8, 15
  br i1 %9, label %10, label %61

10:                                               ; preds = %7
  %11 = call i32 @rand() #3
  %12 = srem i32 %11, 512
  %13 = load i32, i32* %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Circle, %struct.Circle* %15, i32 0, i32 0
  store i32 %12, i32* %16, align 4
  %17 = call i32 @rand() #3
  %18 = srem i32 %17, 256
  %19 = load i32, i32* %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Circle, %struct.Circle* %21, i32 0, i32 1
  store i32 %18, i32* %22, align 4
  %23 = call i32 @rand() #3
  %24 = srem i32 %23, 50
  %25 = add nsw i32 %24, 2
  %26 = load i32, i32* %2, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.Circle, %struct.Circle* %28, i32 0, i32 2
  store i32 %25, i32* %29, align 4
  %30 = call i32 @rand() #3
  %31 = srem i32 %30, 5
  %32 = add nsw i32 %31, 1
  %33 = load i32, i32* %2, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %34
  %36 = getelementptr inbounds %struct.Circle, %struct.Circle* %35, i32 0, i32 3
  store i32 %32, i32* %36, align 4
  %37 = call i32 @rand() #3
  %38 = srem i32 %37, 128
  %39 = add nsw i32 %38, 1
  %40 = load i32, i32* %2, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %41
  %43 = getelementptr inbounds %struct.Circle, %struct.Circle* %42, i32 0, i32 4
  store i32 %39, i32* %43, align 4
  %44 = call i32 @rand() #3
  %45 = srem i32 %44, 2
  %46 = sub nsw i32 %45, 1
  %47 = load i32, i32* %2, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %48
  %50 = getelementptr inbounds %struct.Circle, %struct.Circle* %49, i32 0, i32 5
  store i32 %46, i32* %50, align 4
  %51 = call i32 @rand() #3
  %52 = srem i32 %51, 2
  %53 = sub nsw i32 %52, 1
  %54 = load i32, i32* %2, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %55
  %57 = getelementptr inbounds %struct.Circle, %struct.Circle* %56, i32 0, i32 6
  store i32 %53, i32* %57, align 4
  br label %58

58:                                               ; preds = %10
  %59 = load i32, i32* %2, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %2, align 4
  br label %7

61:                                               ; preds = %7
  br label %62

62:                                               ; preds = %61, %134
  store i32 0, i32* %3, align 4
  br label %63

63:                                               ; preds = %131, %62
  %64 = load i32, i32* %3, align 4
  %65 = icmp slt i32 %64, 15
  br i1 %65, label %66, label %134

66:                                               ; preds = %63
  %67 = load i32, i32* %3, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %68
  %70 = getelementptr inbounds %struct.Circle, %struct.Circle* %69, i32 0, i32 3
  %71 = load i32, i32* %70, align 4
  %72 = load i32, i32* %3, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %73
  %75 = getelementptr inbounds %struct.Circle, %struct.Circle* %74, i32 0, i32 2
  %76 = load i32, i32* %75, align 4
  %77 = add nsw i32 %76, %71
  store i32 %77, i32* %75, align 4
  %78 = load i32, i32* %3, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %79
  %81 = getelementptr inbounds %struct.Circle, %struct.Circle* %80, i32 0, i32 2
  %82 = load i32, i32* %81, align 4
  %83 = icmp sgt i32 %82, 42
  br i1 %83, label %84, label %92

84:                                               ; preds = %66
  %85 = call i32 @rand() #3
  %86 = srem i32 %85, 50
  %87 = add nsw i32 %86, 2
  %88 = load i32, i32* %3, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %89
  %91 = getelementptr inbounds %struct.Circle, %struct.Circle* %90, i32 0, i32 2
  store i32 %87, i32* %91, align 4
  br label %92

92:                                               ; preds = %84, %66
  %93 = call i32 @rand() #3
  %94 = srem i32 %93, 512
  %95 = load i32, i32* %3, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %96
  %98 = getelementptr inbounds %struct.Circle, %struct.Circle* %97, i32 0, i32 0
  store i32 %94, i32* %98, align 4
  %99 = call i32 @rand() #3
  %100 = srem i32 %99, 256
  %101 = load i32, i32* %3, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %102
  %104 = getelementptr inbounds %struct.Circle, %struct.Circle* %103, i32 0, i32 1
  store i32 %100, i32* %104, align 4
  %105 = load i32, i32* %3, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %106
  %108 = getelementptr inbounds %struct.Circle, %struct.Circle* %107, i32 0, i32 0
  %109 = load i32, i32* %108, align 4
  %110 = load i32, i32* %3, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %111
  %113 = getelementptr inbounds %struct.Circle, %struct.Circle* %112, i32 0, i32 1
  %114 = load i32, i32* %113, align 4
  %115 = load i32, i32* %3, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %116
  %118 = getelementptr inbounds %struct.Circle, %struct.Circle* %117, i32 0, i32 2
  %119 = load i32, i32* %118, align 4
  %120 = load i32, i32* %3, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %121
  %123 = getelementptr inbounds %struct.Circle, %struct.Circle* %122, i32 0, i32 5
  %124 = load i32, i32* %123, align 4
  %125 = load i32, i32* %3, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %126
  %128 = getelementptr inbounds %struct.Circle, %struct.Circle* %127, i32 0, i32 6
  %129 = load i32, i32* %128, align 4
  %130 = call i32 @getAbsVelocity(i32 %124, i32 %129)
  call void @DrawCircle(i32 %109, i32 %114, i32 %119, i32 %130)
  call void (...) @simFlush()
  br label %131

131:                                              ; preds = %92
  %132 = load i32, i32* %3, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %3, align 4
  br label %63

134:                                              ; preds = %63
  br label %62
}

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local void @simFlush(...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
