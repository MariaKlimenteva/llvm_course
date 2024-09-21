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

7:                                                ; preds = %77, %0
  %8 = load i32, i32* %2, align 4
  %9 = icmp slt i32 %8, 15
  br i1 %9, label %10, label %80

10:                                               ; preds = %7
  %11 = call i32 @rand() #3
  %12 = srem i32 %11, 512
  %13 = load i32, i32* %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Circle, %struct.Circle* %15, i32 0, i32 0
  store i32 %12, i32* %16, align 8
  %17 = call i32 @rand() #3
  %18 = srem i32 %17, 256
  %19 = load i32, i32* %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Circle, %struct.Circle* %21, i32 0, i32 1
  store i32 %18, i32* %22, align 4
  %23 = call i32 @rand() #3
  %24 = srem i32 %23, 128
  %25 = add nsw i32 %24, 128
  %26 = load i32, i32* %2, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.Circle, %struct.Circle* %28, i32 0, i32 7
  store i32 %25, i32* %29, align 4
  %30 = call i32 @rand() #3
  %31 = srem i32 %30, 256
  %32 = load i32, i32* %2, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %33
  %35 = getelementptr inbounds %struct.Circle, %struct.Circle* %34, i32 0, i32 8
  store i32 %31, i32* %35, align 8
  %36 = call i32 @rand() #3
  %37 = srem i32 %36, 128
  %38 = load i32, i32* %2, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.Circle, %struct.Circle* %40, i32 0, i32 9
  store i32 %37, i32* %41, align 4
  %42 = call i32 @rand() #3
  %43 = srem i32 %42, 50
  %44 = add nsw i32 %43, 2
  %45 = load i32, i32* %2, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %46
  %48 = getelementptr inbounds %struct.Circle, %struct.Circle* %47, i32 0, i32 2
  store i32 %44, i32* %48, align 8
  %49 = call i32 @rand() #3
  %50 = srem i32 %49, 5
  %51 = add nsw i32 %50, 1
  %52 = load i32, i32* %2, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %53
  %55 = getelementptr inbounds %struct.Circle, %struct.Circle* %54, i32 0, i32 3
  store i32 %51, i32* %55, align 4
  %56 = call i32 @rand() #3
  %57 = srem i32 %56, 128
  %58 = add nsw i32 %57, 1
  %59 = load i32, i32* %2, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %60
  %62 = getelementptr inbounds %struct.Circle, %struct.Circle* %61, i32 0, i32 4
  store i32 %58, i32* %62, align 8
  %63 = call i32 @rand() #3
  %64 = srem i32 %63, 2
  %65 = sub nsw i32 %64, 1
  %66 = load i32, i32* %2, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %67
  %69 = getelementptr inbounds %struct.Circle, %struct.Circle* %68, i32 0, i32 5
  store i32 %65, i32* %69, align 4
  %70 = call i32 @rand() #3
  %71 = srem i32 %70, 2
  %72 = sub nsw i32 %71, 1
  %73 = load i32, i32* %2, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %74
  %76 = getelementptr inbounds %struct.Circle, %struct.Circle* %75, i32 0, i32 6
  store i32 %72, i32* %76, align 8
  br label %77

77:                                               ; preds = %10
  %78 = load i32, i32* %2, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %2, align 4
  br label %7

80:                                               ; preds = %7
  br label %81

81:                                               ; preds = %80, %216
  store i32 0, i32* %3, align 4
  br label %82

82:                                               ; preds = %213, %81
  %83 = load i32, i32* %3, align 4
  %84 = icmp slt i32 %83, 15
  br i1 %84, label %85, label %216

85:                                               ; preds = %82
  %86 = load i32, i32* %3, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %87
  %89 = getelementptr inbounds %struct.Circle, %struct.Circle* %88, i32 0, i32 3
  %90 = load i32, i32* %89, align 4
  %91 = load i32, i32* %3, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %92
  %94 = getelementptr inbounds %struct.Circle, %struct.Circle* %93, i32 0, i32 2
  %95 = load i32, i32* %94, align 8
  %96 = add nsw i32 %95, %90
  store i32 %96, i32* %94, align 8
  %97 = load i32, i32* %3, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %98
  %100 = getelementptr inbounds %struct.Circle, %struct.Circle* %99, i32 0, i32 2
  %101 = load i32, i32* %100, align 8
  %102 = icmp sgt i32 %101, 42
  br i1 %102, label %103, label %111

103:                                              ; preds = %85
  %104 = call i32 @rand() #3
  %105 = srem i32 %104, 50
  %106 = add nsw i32 %105, 2
  %107 = load i32, i32* %3, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %108
  %110 = getelementptr inbounds %struct.Circle, %struct.Circle* %109, i32 0, i32 2
  store i32 %106, i32* %110, align 8
  br label %111

111:                                              ; preds = %103, %85
  %112 = call i32 @rand() #3
  %113 = srem i32 %112, 512
  %114 = load i32, i32* %3, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %115
  %117 = getelementptr inbounds %struct.Circle, %struct.Circle* %116, i32 0, i32 0
  store i32 %113, i32* %117, align 8
  %118 = call i32 @rand() #3
  %119 = srem i32 %118, 256
  %120 = load i32, i32* %3, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %121
  %123 = getelementptr inbounds %struct.Circle, %struct.Circle* %122, i32 0, i32 1
  store i32 %119, i32* %123, align 4
  %124 = load i32, i32* %3, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %125
  %127 = getelementptr inbounds %struct.Circle, %struct.Circle* %126, i32 0, i32 7
  %128 = load i32, i32* %127, align 4
  %129 = load i32, i32* %3, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %130
  %132 = getelementptr inbounds %struct.Circle, %struct.Circle* %131, i32 0, i32 4
  %133 = load i32, i32* %132, align 8
  %134 = add nsw i32 %128, %133
  %135 = srem i32 %134, 256
  %136 = load i32, i32* %3, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %137
  %139 = getelementptr inbounds %struct.Circle, %struct.Circle* %138, i32 0, i32 7
  store i32 %135, i32* %139, align 4
  %140 = load i32, i32* %3, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %141
  %143 = getelementptr inbounds %struct.Circle, %struct.Circle* %142, i32 0, i32 8
  %144 = load i32, i32* %143, align 8
  %145 = load i32, i32* %3, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %146
  %148 = getelementptr inbounds %struct.Circle, %struct.Circle* %147, i32 0, i32 4
  %149 = load i32, i32* %148, align 8
  %150 = add nsw i32 %144, %149
  %151 = srem i32 %150, 256
  %152 = load i32, i32* %3, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %153
  %155 = getelementptr inbounds %struct.Circle, %struct.Circle* %154, i32 0, i32 8
  store i32 %151, i32* %155, align 8
  %156 = load i32, i32* %3, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %157
  %159 = getelementptr inbounds %struct.Circle, %struct.Circle* %158, i32 0, i32 9
  %160 = load i32, i32* %159, align 4
  %161 = load i32, i32* %3, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %162
  %164 = getelementptr inbounds %struct.Circle, %struct.Circle* %163, i32 0, i32 4
  %165 = load i32, i32* %164, align 8
  %166 = add nsw i32 %160, %165
  %167 = srem i32 %166, 256
  %168 = load i32, i32* %3, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %169
  %171 = getelementptr inbounds %struct.Circle, %struct.Circle* %170, i32 0, i32 9
  store i32 %167, i32* %171, align 4
  %172 = load i32, i32* %3, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %173
  %175 = getelementptr inbounds %struct.Circle, %struct.Circle* %174, i32 0, i32 0
  %176 = load i32, i32* %175, align 8
  %177 = load i32, i32* %3, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %178
  %180 = getelementptr inbounds %struct.Circle, %struct.Circle* %179, i32 0, i32 1
  %181 = load i32, i32* %180, align 4
  %182 = load i32, i32* %3, align 4
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %183
  %185 = getelementptr inbounds %struct.Circle, %struct.Circle* %184, i32 0, i32 2
  %186 = load i32, i32* %185, align 8
  %187 = load i32, i32* %3, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %188
  %190 = getelementptr inbounds %struct.Circle, %struct.Circle* %189, i32 0, i32 5
  %191 = load i32, i32* %190, align 4
  %192 = load i32, i32* %3, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %193
  %195 = getelementptr inbounds %struct.Circle, %struct.Circle* %194, i32 0, i32 6
  %196 = load i32, i32* %195, align 8
  %197 = call i32 @getAbsVelocity(i32 %191, i32 %196)
  %198 = load i32, i32* %3, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %199
  %201 = getelementptr inbounds %struct.Circle, %struct.Circle* %200, i32 0, i32 7
  %202 = load i32, i32* %201, align 4
  %203 = load i32, i32* %3, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %204
  %206 = getelementptr inbounds %struct.Circle, %struct.Circle* %205, i32 0, i32 8
  %207 = load i32, i32* %206, align 8
  %208 = load i32, i32* %3, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [15 x %struct.Circle], [15 x %struct.Circle]* @circles, i64 0, i64 %209
  %211 = getelementptr inbounds %struct.Circle, %struct.Circle* %210, i32 0, i32 9
  %212 = load i32, i32* %211, align 4
  call void @DrawCircle(i32 %176, i32 %181, i32 %186, i32 %197, i32 %202, i32 %207, i32 %212)
  call void (...) @simFlush()
  br label %213

213:                                              ; preds = %111
  %214 = load i32, i32* %3, align 4
  %215 = add nsw i32 %214, 1
  store i32 %215, i32* %3, align 4
  br label %82

216:                                              ; preds = %82
  br label %81
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
