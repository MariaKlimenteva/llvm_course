; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Circle = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }

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
define dso_local void @DrawCircle(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  store i32 %6, i32* %14, align 4
  %20 = load i32, i32* %10, align 4
  %21 = sub nsw i32 0, %20
  store i32 %21, i32* %15, align 4
  br label %22

22:                                               ; preds = %72, %7
  %23 = load i32, i32* %15, align 4
  %24 = load i32, i32* %10, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %75

26:                                               ; preds = %22
  %27 = load i32, i32* %10, align 4
  %28 = sub nsw i32 0, %27
  store i32 %28, i32* %16, align 4
  br label %29

29:                                               ; preds = %68, %26
  %30 = load i32, i32* %16, align 4
  %31 = load i32, i32* %10, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %71

33:                                               ; preds = %29
  %34 = load i32, i32* %16, align 4
  %35 = load i32, i32* %16, align 4
  %36 = mul nsw i32 %34, %35
  %37 = load i32, i32* %15, align 4
  %38 = load i32, i32* %15, align 4
  %39 = mul nsw i32 %37, %38
  %40 = add nsw i32 %36, %39
  %41 = load i32, i32* %10, align 4
  %42 = load i32, i32* %10, align 4
  %43 = mul nsw i32 %41, %42
  %44 = icmp slt i32 %40, %43
  br i1 %44, label %45, label %67

45:                                               ; preds = %33
  %46 = load i32, i32* %8, align 4
  %47 = load i32, i32* %16, align 4
  %48 = add nsw i32 %46, %47
  store i32 %48, i32* %17, align 4
  %49 = load i32, i32* %9, align 4
  %50 = load i32, i32* %15, align 4
  %51 = add nsw i32 %49, %50
  store i32 %51, i32* %18, align 4
  %52 = load i32, i32* %12, align 4
  %53 = shl i32 %52, 16
  %54 = or i32 -16777216, %53
  %55 = load i32, i32* %13, align 4
  %56 = shl i32 %55, 8
  %57 = or i32 %54, %56
  %58 = load i32, i32* %14, align 4
  %59 = or i32 %57, %58
  store i32 %59, i32* %19, align 4
  %60 = load i32, i32* %17, align 4
  %61 = load i32, i32* %18, align 4
  %62 = load i32, i32* %19, align 4
  %63 = load i32, i32* %11, align 4
  %64 = mul nsw i32 %63, 10
  %65 = shl i32 %64, 6
  %66 = add nsw i32 %62, %65
  call void @simPutPixel(i32 %60, i32 %61, i32 %66)
  br label %67

67:                                               ; preds = %45, %33
  br label %68

68:                                               ; preds = %67
  %69 = load i32, i32* %16, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %16, align 4
  br label %29

71:                                               ; preds = %29
  br label %72

72:                                               ; preds = %71
  %73 = load i32, i32* %15, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %15, align 4
  br label %22

75:                                               ; preds = %22
  ret void
}

declare dso_local void @simPutPixel(i32, i32, i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @app() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %3

3:                                                ; preds = %73, %0
  %4 = load i32, i32* %1, align 4
  %5 = icmp slt i32 %4, 15
  br i1 %5, label %6, label %76

6:                                                ; preds = %3
  %7 = call i32 (...) @simRand()
  %8 = srem i32 %7, 512
  %9 = load i32, i32* %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.Circle, %struct.Circle* %11, i32 0, i32 0
  store i32 %8, i32* %12, align 8
  %13 = call i32 (...) @simRand()
  %14 = srem i32 %13, 256
  %15 = load i32, i32* %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Circle, %struct.Circle* %17, i32 0, i32 1
  store i32 %14, i32* %18, align 4
  %19 = call i32 (...) @simRand()
  %20 = srem i32 %19, 128
  %21 = add nsw i32 %20, 128
  %22 = load i32, i32* %1, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.Circle, %struct.Circle* %24, i32 0, i32 7
  store i32 %21, i32* %25, align 4
  %26 = call i32 (...) @simRand()
  %27 = srem i32 %26, 256
  %28 = load i32, i32* %1, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.Circle, %struct.Circle* %30, i32 0, i32 8
  store i32 %27, i32* %31, align 8
  %32 = call i32 (...) @simRand()
  %33 = srem i32 %32, 128
  %34 = load i32, i32* %1, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.Circle, %struct.Circle* %36, i32 0, i32 9
  store i32 %33, i32* %37, align 4
  %38 = call i32 (...) @simRand()
  %39 = srem i32 %38, 50
  %40 = add nsw i32 %39, 2
  %41 = load i32, i32* %1, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %42
  %44 = getelementptr inbounds %struct.Circle, %struct.Circle* %43, i32 0, i32 2
  store i32 %40, i32* %44, align 8
  %45 = call i32 (...) @simRand()
  %46 = srem i32 %45, 5
  %47 = add nsw i32 %46, 1
  %48 = load i32, i32* %1, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %49
  %51 = getelementptr inbounds %struct.Circle, %struct.Circle* %50, i32 0, i32 3
  store i32 %47, i32* %51, align 4
  %52 = call i32 (...) @simRand()
  %53 = srem i32 %52, 128
  %54 = add nsw i32 %53, 1
  %55 = load i32, i32* %1, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %56
  %58 = getelementptr inbounds %struct.Circle, %struct.Circle* %57, i32 0, i32 4
  store i32 %54, i32* %58, align 8
  %59 = call i32 (...) @simRand()
  %60 = srem i32 %59, 2
  %61 = sub nsw i32 %60, 1
  %62 = load i32, i32* %1, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %63
  %65 = getelementptr inbounds %struct.Circle, %struct.Circle* %64, i32 0, i32 5
  store i32 %61, i32* %65, align 4
  %66 = call i32 (...) @simRand()
  %67 = srem i32 %66, 2
  %68 = sub nsw i32 %67, 1
  %69 = load i32, i32* %1, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %70
  %72 = getelementptr inbounds %struct.Circle, %struct.Circle* %71, i32 0, i32 6
  store i32 %68, i32* %72, align 8
  br label %73

73:                                               ; preds = %6
  %74 = load i32, i32* %1, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %1, align 4
  br label %3

76:                                               ; preds = %3
  br label %77

77:                                               ; preds = %76, %212
  store i32 0, i32* %2, align 4
  br label %78

78:                                               ; preds = %209, %77
  %79 = load i32, i32* %2, align 4
  %80 = icmp slt i32 %79, 15
  br i1 %80, label %81, label %212

81:                                               ; preds = %78
  %82 = load i32, i32* %2, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %83
  %85 = getelementptr inbounds %struct.Circle, %struct.Circle* %84, i32 0, i32 3
  %86 = load i32, i32* %85, align 4
  %87 = load i32, i32* %2, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %88
  %90 = getelementptr inbounds %struct.Circle, %struct.Circle* %89, i32 0, i32 2
  %91 = load i32, i32* %90, align 8
  %92 = add nsw i32 %91, %86
  store i32 %92, i32* %90, align 8
  %93 = load i32, i32* %2, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %94
  %96 = getelementptr inbounds %struct.Circle, %struct.Circle* %95, i32 0, i32 2
  %97 = load i32, i32* %96, align 8
  %98 = icmp sgt i32 %97, 42
  br i1 %98, label %99, label %107

99:                                               ; preds = %81
  %100 = call i32 (...) @simRand()
  %101 = srem i32 %100, 50
  %102 = add nsw i32 %101, 2
  %103 = load i32, i32* %2, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %104
  %106 = getelementptr inbounds %struct.Circle, %struct.Circle* %105, i32 0, i32 2
  store i32 %102, i32* %106, align 8
  br label %107

107:                                              ; preds = %99, %81
  %108 = call i32 (...) @simRand()
  %109 = srem i32 %108, 512
  %110 = load i32, i32* %2, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %111
  %113 = getelementptr inbounds %struct.Circle, %struct.Circle* %112, i32 0, i32 0
  store i32 %109, i32* %113, align 8
  %114 = call i32 (...) @simRand()
  %115 = srem i32 %114, 256
  %116 = load i32, i32* %2, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %117
  %119 = getelementptr inbounds %struct.Circle, %struct.Circle* %118, i32 0, i32 1
  store i32 %115, i32* %119, align 4
  %120 = load i32, i32* %2, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %121
  %123 = getelementptr inbounds %struct.Circle, %struct.Circle* %122, i32 0, i32 7
  %124 = load i32, i32* %123, align 4
  %125 = load i32, i32* %2, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %126
  %128 = getelementptr inbounds %struct.Circle, %struct.Circle* %127, i32 0, i32 4
  %129 = load i32, i32* %128, align 8
  %130 = add nsw i32 %124, %129
  %131 = srem i32 %130, 256
  %132 = load i32, i32* %2, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %133
  %135 = getelementptr inbounds %struct.Circle, %struct.Circle* %134, i32 0, i32 7
  store i32 %131, i32* %135, align 4
  %136 = load i32, i32* %2, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %137
  %139 = getelementptr inbounds %struct.Circle, %struct.Circle* %138, i32 0, i32 8
  %140 = load i32, i32* %139, align 8
  %141 = load i32, i32* %2, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %142
  %144 = getelementptr inbounds %struct.Circle, %struct.Circle* %143, i32 0, i32 4
  %145 = load i32, i32* %144, align 8
  %146 = add nsw i32 %140, %145
  %147 = srem i32 %146, 256
  %148 = load i32, i32* %2, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %149
  %151 = getelementptr inbounds %struct.Circle, %struct.Circle* %150, i32 0, i32 8
  store i32 %147, i32* %151, align 8
  %152 = load i32, i32* %2, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %153
  %155 = getelementptr inbounds %struct.Circle, %struct.Circle* %154, i32 0, i32 9
  %156 = load i32, i32* %155, align 4
  %157 = load i32, i32* %2, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %158
  %160 = getelementptr inbounds %struct.Circle, %struct.Circle* %159, i32 0, i32 4
  %161 = load i32, i32* %160, align 8
  %162 = add nsw i32 %156, %161
  %163 = srem i32 %162, 256
  %164 = load i32, i32* %2, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %165
  %167 = getelementptr inbounds %struct.Circle, %struct.Circle* %166, i32 0, i32 9
  store i32 %163, i32* %167, align 4
  %168 = load i32, i32* %2, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %169
  %171 = getelementptr inbounds %struct.Circle, %struct.Circle* %170, i32 0, i32 0
  %172 = load i32, i32* %171, align 8
  %173 = load i32, i32* %2, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %174
  %176 = getelementptr inbounds %struct.Circle, %struct.Circle* %175, i32 0, i32 1
  %177 = load i32, i32* %176, align 4
  %178 = load i32, i32* %2, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %179
  %181 = getelementptr inbounds %struct.Circle, %struct.Circle* %180, i32 0, i32 2
  %182 = load i32, i32* %181, align 8
  %183 = load i32, i32* %2, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %184
  %186 = getelementptr inbounds %struct.Circle, %struct.Circle* %185, i32 0, i32 5
  %187 = load i32, i32* %186, align 4
  %188 = load i32, i32* %2, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %189
  %191 = getelementptr inbounds %struct.Circle, %struct.Circle* %190, i32 0, i32 6
  %192 = load i32, i32* %191, align 8
  %193 = call i32 @getAbsVelocity(i32 %187, i32 %192)
  %194 = load i32, i32* %2, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %195
  %197 = getelementptr inbounds %struct.Circle, %struct.Circle* %196, i32 0, i32 7
  %198 = load i32, i32* %197, align 4
  %199 = load i32, i32* %2, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %200
  %202 = getelementptr inbounds %struct.Circle, %struct.Circle* %201, i32 0, i32 8
  %203 = load i32, i32* %202, align 8
  %204 = load i32, i32* %2, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %205
  %207 = getelementptr inbounds %struct.Circle, %struct.Circle* %206, i32 0, i32 9
  %208 = load i32, i32* %207, align 4
  call void @DrawCircle(i32 %172, i32 %177, i32 %182, i32 %193, i32 %198, i32 %203, i32 %208)
  call void (...) @simFlush()
  br label %209

209:                                              ; preds = %107
  %210 = load i32, i32* %2, align 4
  %211 = add nsw i32 %210, 1
  store i32 %211, i32* %2, align 4
  br label %78

212:                                              ; preds = %78
  br label %77
}

declare dso_local i32 @simRand(...) #1

declare dso_local void @simFlush(...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
