; ModuleID = 'simple_app.c'
source_filename = "simple_app.c"

declare void @simPutPixel(i32, i32, i32)

declare void @simFlush()

declare i32 @simRand()

define void @DrawCircle(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5) {
  %7 = sub i32 0, %2
  %8 = icmp sgt i32 %2, 0
  br i1 %8, label %9, label %.loopexit

9:                                                ; preds = %6
  %10 = mul i32 %2, %2
  %11 = shl i32 %3, 16
  %12 = shl i32 %4, 8
  %13 = or i32 %11, %12
  %14 = or i32 %13, %5
  %15 = or i32 %14, -16777216
  br label %16

16:                                               ; preds = %22, %9
  %17 = phi i32 [ %7, %9 ], [ %23, %22 ]
  %18 = mul i32 %17, %17
  %19 = add i32 %17, %1
  %20 = icmp sgt i32 %19, -1
  %21 = icmp slt i32 %19, 256
  br label %25

22:                                               ; preds = %36
  %23 = add i32 %17, 1
  %24 = icmp slt i32 %23, %2
  br i1 %24, label %16, label %.loopexit

25:                                               ; preds = %36, %16
  %26 = phi i32 [ %7, %16 ], [ %37, %36 ]
  %27 = mul i32 %26, %26
  %28 = add nsw i32 %27, %18
  %29 = icmp ult i32 %28, %10
  br i1 %29, label %30, label %36

30:                                               ; preds = %25
  %31 = add i32 %26, %0
  %32 = icmp ult i32 %31, 512
  %33 = select i1 %32, i1 %20, i1 false
  %34 = select i1 %33, i1 %21, i1 false
  br i1 %34, label %35, label %36

35:                                               ; preds = %30
  call void @simPutPixel(i32 %31, i32 %19, i32 %15)
  br label %36

36:                                               ; preds = %35, %30, %25
  %37 = add i32 %26, 1
  %38 = icmp slt i32 %37, %2
  br i1 %38, label %25, label %22

.loopexit:                                        ; preds = %22, %6
  ret void
}

define void @app() {
  br label %1

1:                                                ; preds = %.backedge, %0
  %2 = phi i32 [ 0, %0 ], [ %.be, %.backedge ]
  %3 = and i32 %2, 511
  %4 = lshr i32 %2, 9
  call void @simPutPixel(i32 %3, i32 %4, i32 0)
  %5 = add nsw i32 %2, 1
  %6 = icmp eq i32 %5, 131072
  br i1 %6, label %.preheader, label %.backedge

7:                                                ; preds = %.loopexit
  call void @simFlush()
  br label %.backedge

.backedge:                                        ; preds = %7, %1
  %.be = phi i32 [ %5, %1 ], [ 0, %7 ]
  br label %1

.preheader:                                       ; preds = %.loopexit, %1
  %8 = phi i32 [ 0, %1 ], [ %54, %.loopexit ]
  %9 = call i32 @simRand()
  %10 = srem i32 %9, 512
  %11 = call i32 @simRand()
  %12 = srem i32 %11, 256
  %13 = call i32 @simRand()
  %14 = srem i32 %13, 50
  %15 = add i32 %14, 5
  %16 = call i32 @simRand()
  %17 = call i32 @simRand()
  %18 = call i32 @simRand()
  %19 = sub i32 -5, %14
  %20 = icmp sgt i32 %14, -5
  br i1 %20, label %21, label %.loopexit

21:                                               ; preds = %.preheader
  %22 = srem i32 %18, 256
  %23 = srem i32 %17, 256
  %24 = srem i32 %16, 256
  %25 = mul nsw i32 %15, %15
  %26 = shl i32 %24, 16
  %27 = shl i32 %23, 8
  %28 = or i32 %26, %27
  %29 = or i32 %28, %22
  %30 = or i32 %29, -16777216
  br label %31

31:                                               ; preds = %37, %21
  %32 = phi i32 [ %19, %21 ], [ %38, %37 ]
  %33 = mul i32 %32, %32
  %34 = add i32 %32, %12
  %35 = icmp sgt i32 %34, -1
  %36 = icmp slt i32 %34, 256
  br label %40

37:                                               ; preds = %51
  %38 = add i32 %32, 1
  %39 = icmp slt i32 %38, %15
  br i1 %39, label %31, label %.loopexit

40:                                               ; preds = %51, %31
  %41 = phi i32 [ %19, %31 ], [ %52, %51 ]
  %42 = mul i32 %41, %41
  %43 = add nsw i32 %42, %33
  %44 = icmp ult i32 %43, %25
  br i1 %44, label %45, label %51

45:                                               ; preds = %40
  %46 = add i32 %41, %10
  %47 = icmp ult i32 %46, 512
  %48 = select i1 %47, i1 %35, i1 false
  %49 = select i1 %48, i1 %36, i1 false
  br i1 %49, label %50, label %51

50:                                               ; preds = %45
  call void @simPutPixel(i32 %46, i32 %34, i32 %30)
  br label %51

51:                                               ; preds = %50, %45, %40
  %52 = add i32 %41, 1
  %53 = icmp slt i32 %52, %15
  br i1 %53, label %40, label %37

.loopexit:                                        ; preds = %37, %.preheader
  %54 = add nsw i32 %8, 1
  %55 = icmp eq i32 %54, 15
  br i1 %55, label %7, label %.preheader
}
