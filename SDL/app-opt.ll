; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local i32 @getHeight(ptr noundef readonly captures(none) %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp ugt i32 %1, 511
  %5 = icmp ugt i32 %2, 255
  %6 = or i1 %4, %5
  br i1 %6, label %13, label %7

7:                                                ; preds = %3
  %8 = shl nuw nsw i32 %2, 9
  %9 = or disjoint i32 %8, %1
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds nuw i32, ptr %0, i64 %10
  %12 = load i32, ptr %11, align 4, !tbaa !5
  br label %13

13:                                               ; preds = %3, %7
  %14 = phi i32 [ %12, %7 ], [ 0, %3 ]
  ret i32 %14
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local float @invSqrt(float noundef %0) local_unnamed_addr #1 {
  %2 = bitcast float %0 to i32
  %3 = lshr i32 %2, 1
  %4 = sub nsw i32 1597463007, %3
  %5 = bitcast i32 %4 to float
  ret float %5
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #2

; Function Attrs: nounwind uwtable
define dso_local void @drawField(ptr noundef readonly captures(none) %0) local_unnamed_addr #3 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 4
  %3 = getelementptr i8, ptr %0, i64 -4
  br label %4

4:                                                ; preds = %64, %1
  %5 = phi i64 [ 0, %1 ], [ %90, %64 ]
  %6 = add nsw i64 %5, -1
  %7 = icmp ugt i64 %6, 255
  %8 = icmp eq i64 %5, 255
  %9 = shl nuw nsw i64 %5, 9
  %10 = add nuw nsw i64 %9, 512
  %11 = shl i64 %6, 9
  %12 = and i64 %11, 4294966784
  %13 = getelementptr inbounds nuw i32, ptr %2, i64 %9
  %14 = load i32, ptr %13, align 4, !tbaa !5
  br i1 %7, label %18, label %15

15:                                               ; preds = %4
  %16 = getelementptr inbounds nuw i32, ptr %0, i64 %12
  %17 = load i32, ptr %16, align 4, !tbaa !5
  br i1 %8, label %22, label %18

18:                                               ; preds = %4, %15
  %19 = phi i32 [ %17, %15 ], [ 0, %4 ]
  %20 = getelementptr inbounds nuw i32, ptr %0, i64 %10
  %21 = load i32, ptr %20, align 4, !tbaa !5
  br label %22

22:                                               ; preds = %15, %18
  %23 = phi i32 [ %19, %18 ], [ %17, %15 ]
  %24 = phi i32 [ %21, %18 ], [ 0, %15 ]
  %25 = add i32 %14, %24
  %26 = sub i32 %23, %25
  %27 = sitofp i32 %26 to float
  %28 = fadd float %27, 2.560000e+02
  %29 = tail call float @llvm.fmuladd.f32(float %27, float %27, float 6.553600e+04)
  %30 = bitcast float %29 to i32
  %31 = lshr i32 %30, 1
  %32 = sub nsw i32 1597463007, %31
  %33 = bitcast i32 %32 to float
  %34 = fmul float %28, %33
  %35 = fcmp ogt float %34, 0.000000e+00
  %36 = select i1 %35, float %34, float 0.000000e+00
  %37 = fmul float %36, 1.000000e+02
  %38 = fptosi float %37 to i32
  %39 = add nsw i32 %38, 20
  %40 = sdiv i32 %39, 5
  %41 = shl i32 %40, 16
  %42 = mul nsw i32 %39, 3
  %43 = sdiv i32 %42, 5
  %44 = shl i32 %43, 8
  %45 = add i32 %38, -16777196
  %46 = add i32 %45, %41
  %47 = add i32 %46, %44
  %48 = trunc nuw nsw i64 %5 to i32
  tail call void @simPutPixel(i32 noundef 0, i32 noundef %48, i32 noundef %47) #10
  %49 = getelementptr i32, ptr %3, i64 %9
  %50 = getelementptr inbounds nuw i32, ptr %0, i64 %9
  %51 = getelementptr inbounds nuw i32, ptr %0, i64 %12
  %52 = getelementptr inbounds nuw i32, ptr %0, i64 %10
  br label %92

53:                                               ; preds = %64
  ret void

54:                                               ; preds = %106
  %55 = getelementptr i32, ptr %49, i64 %96
  %56 = load i32, ptr %55, align 4, !tbaa !5
  br i1 %7, label %60, label %57

57:                                               ; preds = %54
  %58 = getelementptr inbounds nuw i32, ptr %51, i64 %96
  %59 = load i32, ptr %58, align 4, !tbaa !5
  br i1 %8, label %64, label %60

60:                                               ; preds = %57, %54
  %61 = phi i32 [ %59, %57 ], [ 0, %54 ]
  %62 = getelementptr inbounds nuw i32, ptr %52, i64 %96
  %63 = load i32, ptr %62, align 4, !tbaa !5
  br label %64

64:                                               ; preds = %60, %57
  %65 = phi i32 [ %61, %60 ], [ %59, %57 ]
  %66 = phi i32 [ %63, %60 ], [ 0, %57 ]
  %67 = add i32 %56, %65
  %68 = sub i32 %67, %66
  %69 = sitofp i32 %68 to float
  %70 = fadd float %69, 2.560000e+02
  %71 = tail call float @llvm.fmuladd.f32(float %69, float %69, float 6.553600e+04)
  %72 = bitcast float %71 to i32
  %73 = lshr i32 %72, 1
  %74 = sub nsw i32 1597463007, %73
  %75 = bitcast i32 %74 to float
  %76 = fmul float %70, %75
  %77 = fcmp ogt float %76, 0.000000e+00
  %78 = select i1 %77, float %76, float 0.000000e+00
  %79 = fmul float %78, 1.000000e+02
  %80 = fptosi float %79 to i32
  %81 = add nsw i32 %80, 20
  %82 = sdiv i32 %81, 5
  %83 = shl i32 %82, 16
  %84 = mul nsw i32 %81, 3
  %85 = sdiv i32 %84, 5
  %86 = shl i32 %85, 8
  %87 = add i32 %80, -16777196
  %88 = add i32 %87, %83
  %89 = add i32 %88, %86
  tail call void @simPutPixel(i32 noundef 511, i32 noundef %48, i32 noundef %89) #10
  %90 = add nuw nsw i64 %5, 1
  %91 = icmp eq i64 %90, 256
  br i1 %91, label %53, label %4, !llvm.loop !9

92:                                               ; preds = %22, %106
  %93 = phi i64 [ 1, %22 ], [ %96, %106 ]
  %94 = getelementptr i32, ptr %49, i64 %93
  %95 = load i32, ptr %94, align 4, !tbaa !5
  %96 = add nuw nsw i64 %93, 1
  %97 = getelementptr inbounds nuw i32, ptr %50, i64 %96
  %98 = load i32, ptr %97, align 4, !tbaa !5
  br i1 %7, label %102, label %99

99:                                               ; preds = %92
  %100 = getelementptr inbounds nuw i32, ptr %51, i64 %93
  %101 = load i32, ptr %100, align 4, !tbaa !5
  br i1 %8, label %106, label %102

102:                                              ; preds = %92, %99
  %103 = phi i32 [ %101, %99 ], [ 0, %92 ]
  %104 = getelementptr inbounds nuw i32, ptr %52, i64 %93
  %105 = load i32, ptr %104, align 4, !tbaa !5
  br label %106

106:                                              ; preds = %99, %102
  %107 = phi i32 [ %103, %102 ], [ %101, %99 ]
  %108 = phi i32 [ %105, %102 ], [ 0, %99 ]
  %109 = add i32 %95, %107
  %110 = add i32 %98, %108
  %111 = sub i32 %109, %110
  %112 = sitofp i32 %111 to float
  %113 = fadd float %112, 2.560000e+02
  %114 = tail call float @llvm.fmuladd.f32(float %112, float %112, float 6.553600e+04)
  %115 = bitcast float %114 to i32
  %116 = lshr i32 %115, 1
  %117 = sub nsw i32 1597463007, %116
  %118 = bitcast i32 %117 to float
  %119 = fmul float %113, %118
  %120 = fcmp ogt float %119, 0.000000e+00
  %121 = select i1 %120, float %119, float 0.000000e+00
  %122 = fmul float %121, 1.000000e+02
  %123 = fptosi float %122 to i32
  %124 = add nsw i32 %123, 20
  %125 = sdiv i32 %124, 5
  %126 = shl i32 %125, 16
  %127 = mul nsw i32 %124, 3
  %128 = sdiv i32 %127, 5
  %129 = shl i32 %128, 8
  %130 = add i32 %123, -16777196
  %131 = add i32 %130, %126
  %132 = add i32 %131, %129
  %133 = trunc nuw nsw i64 %93 to i32
  tail call void @simPutPixel(i32 noundef %133, i32 noundef %48, i32 noundef %132) #10
  %134 = icmp eq i64 %96, 511
  br i1 %134, label %54, label %92, !llvm.loop !11
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #4

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @addDrop(ptr noundef captures(none) %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #6 {
  %4 = sext i32 %2 to i64
  %5 = sext i32 %1 to i64
  %6 = shl nsw i64 %4, 9
  %7 = add nsw i64 %6, -1024
  %8 = add nsw i64 %7, %5
  %9 = getelementptr i32, ptr %0, i64 %8
  %10 = getelementptr i8, ptr %9, i64 -4
  %11 = load <2 x i32>, ptr %10, align 4, !tbaa !5
  %12 = add nsw <2 x i32> %11, splat (i32 -1024)
  store <2 x i32> %12, ptr %10, align 4, !tbaa !5
  %13 = getelementptr i32, ptr %0, i64 %8
  %14 = getelementptr i8, ptr %13, i64 4
  %15 = load i32, ptr %14, align 4, !tbaa !5
  %16 = add nsw i32 %15, -1024
  store i32 %16, ptr %14, align 4, !tbaa !5
  %17 = shl nsw i64 %4, 9
  %18 = add nsw i64 %17, -512
  %19 = add nsw i64 %18, %5
  %20 = getelementptr i32, ptr %0, i64 %19
  %21 = getelementptr i8, ptr %20, i64 -8
  %22 = load <4 x i32>, ptr %21, align 4, !tbaa !5
  %23 = add nsw <4 x i32> %22, splat (i32 -1024)
  store <4 x i32> %23, ptr %21, align 4, !tbaa !5
  %24 = getelementptr i32, ptr %0, i64 %19
  %25 = getelementptr i8, ptr %24, i64 8
  %26 = load i32, ptr %25, align 4, !tbaa !5
  %27 = add nsw i32 %26, -1024
  store i32 %27, ptr %25, align 4, !tbaa !5
  %28 = shl nsw i64 %4, 9
  %29 = add nsw i64 %28, %5
  %30 = getelementptr i32, ptr %0, i64 %29
  %31 = getelementptr i8, ptr %30, i64 -8
  %32 = load <4 x i32>, ptr %31, align 4, !tbaa !5
  %33 = add nsw <4 x i32> %32, splat (i32 -1024)
  store <4 x i32> %33, ptr %31, align 4, !tbaa !5
  %34 = getelementptr i32, ptr %0, i64 %29
  %35 = getelementptr i8, ptr %34, i64 8
  %36 = load i32, ptr %35, align 4, !tbaa !5
  %37 = add nsw i32 %36, -1024
  store i32 %37, ptr %35, align 4, !tbaa !5
  %38 = shl nsw i64 %4, 9
  %39 = add nsw i64 %38, 512
  %40 = add nsw i64 %39, %5
  %41 = getelementptr i32, ptr %0, i64 %40
  %42 = getelementptr i8, ptr %41, i64 -8
  %43 = load <4 x i32>, ptr %42, align 4, !tbaa !5
  %44 = add nsw <4 x i32> %43, splat (i32 -1024)
  store <4 x i32> %44, ptr %42, align 4, !tbaa !5
  %45 = getelementptr i32, ptr %0, i64 %40
  %46 = getelementptr i8, ptr %45, i64 8
  %47 = load i32, ptr %46, align 4, !tbaa !5
  %48 = add nsw i32 %47, -1024
  store i32 %48, ptr %46, align 4, !tbaa !5
  %49 = shl nsw i64 %4, 9
  %50 = add nsw i64 %49, 1024
  %51 = add nsw i64 %50, %5
  %52 = getelementptr i32, ptr %0, i64 %51
  %53 = getelementptr i8, ptr %52, i64 -4
  %54 = load <2 x i32>, ptr %53, align 4, !tbaa !5
  %55 = add nsw <2 x i32> %54, splat (i32 -1024)
  store <2 x i32> %55, ptr %53, align 4, !tbaa !5
  %56 = getelementptr i32, ptr %0, i64 %51
  %57 = getelementptr i8, ptr %56, i64 4
  %58 = load i32, ptr %57, align 4, !tbaa !5
  %59 = add nsw i32 %58, -1024
  store i32 %59, ptr %57, align 4, !tbaa !5
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @calcField(ptr noundef readonly captures(none) %0, ptr noundef captures(none) %1) local_unnamed_addr #7 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 4
  %4 = getelementptr i8, ptr %0, i64 -4
  br label %5

5:                                                ; preds = %51, %2
  %6 = phi i64 [ 0, %2 ], [ %61, %51 ]
  %7 = add nsw i64 %6, -1
  %8 = icmp ugt i64 %7, 255
  %9 = icmp eq i64 %6, 255
  %10 = shl nuw nsw i64 %6, 9
  %11 = add nuw nsw i64 %10, 512
  %12 = shl i64 %7, 9
  %13 = and i64 %12, 4294966784
  %14 = getelementptr inbounds nuw i32, ptr %3, i64 %10
  %15 = load i32, ptr %14, align 4, !tbaa !5
  br i1 %8, label %20, label %16

16:                                               ; preds = %5
  %17 = getelementptr inbounds nuw i32, ptr %0, i64 %13
  %18 = load i32, ptr %17, align 4, !tbaa !5
  %19 = add nsw i32 %15, %18
  br i1 %9, label %24, label %20

20:                                               ; preds = %5, %16
  %21 = phi i32 [ %19, %16 ], [ %15, %5 ]
  %22 = getelementptr inbounds nuw i32, ptr %0, i64 %11
  %23 = load i32, ptr %22, align 4, !tbaa !5
  br label %24

24:                                               ; preds = %16, %20
  %25 = phi i32 [ %21, %20 ], [ %19, %16 ]
  %26 = phi i32 [ %23, %20 ], [ 0, %16 ]
  %27 = add nsw i32 %25, %26
  %28 = ashr i32 %27, 1
  %29 = getelementptr inbounds nuw i32, ptr %1, i64 %10
  %30 = load i32, ptr %29, align 4, !tbaa !5
  %31 = sub nsw i32 %28, %30
  %32 = ashr i32 %31, 5
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %29, align 4, !tbaa !5
  %34 = getelementptr i32, ptr %4, i64 %10
  %35 = getelementptr inbounds nuw i32, ptr %0, i64 %10
  %36 = getelementptr inbounds nuw i32, ptr %0, i64 %13
  %37 = getelementptr inbounds nuw i32, ptr %0, i64 %11
  %38 = getelementptr inbounds nuw i32, ptr %1, i64 %10
  br label %63

39:                                               ; preds = %51
  ret void

40:                                               ; preds = %79
  %41 = getelementptr i32, ptr %34, i64 %67
  %42 = load i32, ptr %41, align 4, !tbaa !5
  br i1 %8, label %47, label %43

43:                                               ; preds = %40
  %44 = getelementptr inbounds nuw i32, ptr %36, i64 %67
  %45 = load i32, ptr %44, align 4, !tbaa !5
  %46 = add nsw i32 %42, %45
  br i1 %9, label %51, label %47

47:                                               ; preds = %43, %40
  %48 = phi i32 [ %46, %43 ], [ %42, %40 ]
  %49 = getelementptr inbounds nuw i32, ptr %37, i64 %67
  %50 = load i32, ptr %49, align 4, !tbaa !5
  br label %51

51:                                               ; preds = %47, %43
  %52 = phi i32 [ %48, %47 ], [ %46, %43 ]
  %53 = phi i32 [ %50, %47 ], [ 0, %43 ]
  %54 = add nsw i32 %52, %53
  %55 = ashr i32 %54, 1
  %56 = getelementptr inbounds nuw i32, ptr %38, i64 %67
  %57 = load i32, ptr %56, align 4, !tbaa !5
  %58 = sub nsw i32 %55, %57
  %59 = ashr i32 %58, 5
  %60 = sub nsw i32 %58, %59
  store i32 %60, ptr %56, align 4, !tbaa !5
  %61 = add nuw nsw i64 %6, 1
  %62 = icmp eq i64 %61, 256
  br i1 %62, label %39, label %5, !llvm.loop !13

63:                                               ; preds = %24, %79
  %64 = phi i64 [ 1, %24 ], [ %67, %79 ]
  %65 = getelementptr i32, ptr %34, i64 %64
  %66 = load i32, ptr %65, align 4, !tbaa !5
  %67 = add nuw nsw i64 %64, 1
  %68 = getelementptr inbounds nuw i32, ptr %35, i64 %67
  %69 = load i32, ptr %68, align 4, !tbaa !5
  %70 = add nsw i32 %69, %66
  br i1 %8, label %75, label %71

71:                                               ; preds = %63
  %72 = getelementptr inbounds nuw i32, ptr %36, i64 %64
  %73 = load i32, ptr %72, align 4, !tbaa !5
  %74 = add nsw i32 %70, %73
  br i1 %9, label %79, label %75

75:                                               ; preds = %63, %71
  %76 = phi i32 [ %74, %71 ], [ %70, %63 ]
  %77 = getelementptr inbounds nuw i32, ptr %37, i64 %64
  %78 = load i32, ptr %77, align 4, !tbaa !5
  br label %79

79:                                               ; preds = %71, %75
  %80 = phi i32 [ %76, %75 ], [ %74, %71 ]
  %81 = phi i32 [ %78, %75 ], [ 0, %71 ]
  %82 = add nsw i32 %80, %81
  %83 = ashr i32 %82, 1
  %84 = getelementptr inbounds nuw i32, ptr %38, i64 %64
  %85 = load i32, ptr %84, align 4, !tbaa !5
  %86 = sub nsw i32 %83, %85
  %87 = ashr i32 %86, 5
  %88 = sub nsw i32 %86, %87
  store i32 %88, ptr %84, align 4, !tbaa !5
  %89 = icmp eq i64 %67, 511
  br i1 %89, label %40, label %63, !llvm.loop !14
}

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #8 {
  %1 = alloca [131072 x i32], align 16
  %2 = alloca [131072 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 524288, ptr nonnull %1) #10
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(524288) %1, i8 0, i64 524288, i1 false)
  call void @llvm.lifetime.start.p0(i64 524288, ptr nonnull %2) #10
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(524288) %2, i8 0, i64 524288, i1 false)
  br label %4

3:                                                ; preds = %64
  br label %4, !llvm.loop !13

4:                                                ; preds = %3, %0
  %5 = phi ptr [ %2, %0 ], [ %6, %3 ]
  %6 = phi ptr [ %1, %0 ], [ %5, %3 ]
  call void @drawField(ptr noundef nonnull %6)
  tail call void (...) @simFlush() #10
  %7 = tail call i32 (...) @simRand() #10
  %8 = srem i32 %7, 10
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %17

10:                                               ; preds = %4
  %11 = tail call i32 (...) @simRand() #10
  %12 = srem i32 %11, 508
  %13 = add nsw i32 %12, 2
  %14 = tail call i32 (...) @simRand() #10
  %15 = srem i32 %14, 252
  %16 = add nsw i32 %15, 2
  call void @addDrop(ptr noundef nonnull %6, i32 noundef %13, i32 noundef %16)
  br label %17

17:                                               ; preds = %10, %4
  %18 = getelementptr inbounds nuw i8, ptr %6, i64 4
  %19 = getelementptr i8, ptr %6, i64 -4
  br label %20

20:                                               ; preds = %64, %17
  %21 = phi i64 [ 0, %17 ], [ %74, %64 ]
  %22 = add nsw i64 %21, -1
  %23 = icmp ugt i64 %22, 255
  %24 = icmp eq i64 %21, 255
  %25 = shl nuw nsw i64 %21, 9
  %26 = add nuw nsw i64 %25, 512
  %27 = shl i64 %22, 9
  %28 = and i64 %27, 4294966784
  %29 = getelementptr inbounds nuw i32, ptr %18, i64 %25
  %30 = load i32, ptr %29, align 4, !tbaa !5
  br i1 %23, label %35, label %31

31:                                               ; preds = %20
  %32 = getelementptr inbounds nuw i32, ptr %6, i64 %28
  %33 = load i32, ptr %32, align 16, !tbaa !5
  %34 = add nsw i32 %33, %30
  br i1 %24, label %39, label %35

35:                                               ; preds = %31, %20
  %36 = phi i32 [ %34, %31 ], [ %30, %20 ]
  %37 = getelementptr inbounds nuw i32, ptr %6, i64 %26
  %38 = load i32, ptr %37, align 16, !tbaa !5
  br label %39

39:                                               ; preds = %35, %31
  %40 = phi i32 [ %36, %35 ], [ %34, %31 ]
  %41 = phi i32 [ %38, %35 ], [ 0, %31 ]
  %42 = add nsw i32 %41, %40
  %43 = ashr i32 %42, 1
  %44 = getelementptr inbounds nuw i32, ptr %5, i64 %25
  %45 = load i32, ptr %44, align 16, !tbaa !5
  %46 = sub nsw i32 %43, %45
  %47 = ashr i32 %46, 5
  %48 = sub nsw i32 %46, %47
  store i32 %48, ptr %44, align 16, !tbaa !5
  %49 = getelementptr i32, ptr %19, i64 %25
  %50 = getelementptr inbounds nuw i32, ptr %6, i64 %25
  %51 = getelementptr inbounds nuw i32, ptr %6, i64 %28
  %52 = getelementptr inbounds nuw i32, ptr %6, i64 %26
  br label %76

53:                                               ; preds = %92
  %54 = getelementptr i8, ptr %49, i64 2044
  %55 = load i32, ptr %54, align 8, !tbaa !5
  br i1 %23, label %60, label %56

56:                                               ; preds = %53
  %57 = getelementptr inbounds nuw i8, ptr %51, i64 2044
  %58 = load i32, ptr %57, align 4, !tbaa !5
  %59 = add nsw i32 %58, %55
  br i1 %24, label %64, label %60

60:                                               ; preds = %56, %53
  %61 = phi i32 [ %59, %56 ], [ %55, %53 ]
  %62 = getelementptr inbounds nuw i8, ptr %52, i64 2044
  %63 = load i32, ptr %62, align 4, !tbaa !5
  br label %64

64:                                               ; preds = %60, %56
  %65 = phi i32 [ %61, %60 ], [ %59, %56 ]
  %66 = phi i32 [ %63, %60 ], [ 0, %56 ]
  %67 = add nsw i32 %66, %65
  %68 = ashr i32 %67, 1
  %69 = getelementptr inbounds nuw i8, ptr %44, i64 2044
  %70 = load i32, ptr %69, align 4, !tbaa !5
  %71 = sub nsw i32 %68, %70
  %72 = ashr i32 %71, 5
  %73 = sub nsw i32 %71, %72
  store i32 %73, ptr %69, align 4, !tbaa !5
  %74 = add nuw nsw i64 %21, 1
  %75 = icmp eq i64 %74, 256
  br i1 %75, label %3, label %20, !llvm.loop !13

76:                                               ; preds = %92, %39
  %77 = phi i64 [ 1, %39 ], [ %80, %92 ]
  %78 = getelementptr i32, ptr %49, i64 %77
  %79 = load i32, ptr %78, align 4, !tbaa !5
  %80 = add nuw nsw i64 %77, 1
  %81 = getelementptr inbounds nuw i32, ptr %50, i64 %80
  %82 = load i32, ptr %81, align 4, !tbaa !5
  %83 = add nsw i32 %82, %79
  br i1 %23, label %88, label %84

84:                                               ; preds = %76
  %85 = getelementptr inbounds nuw i32, ptr %51, i64 %77
  %86 = load i32, ptr %85, align 4, !tbaa !5
  %87 = add nsw i32 %86, %83
  br i1 %24, label %92, label %88

88:                                               ; preds = %84, %76
  %89 = phi i32 [ %87, %84 ], [ %83, %76 ]
  %90 = getelementptr inbounds nuw i32, ptr %52, i64 %77
  %91 = load i32, ptr %90, align 4, !tbaa !5
  br label %92

92:                                               ; preds = %88, %84
  %93 = phi i32 [ %89, %88 ], [ %87, %84 ]
  %94 = phi i32 [ %91, %88 ], [ 0, %84 ]
  %95 = add nsw i32 %94, %93
  %96 = ashr i32 %95, 1
  %97 = getelementptr inbounds nuw i32, ptr %44, i64 %77
  %98 = load i32, ptr %97, align 4, !tbaa !5
  %99 = sub nsw i32 %96, %98
  %100 = ashr i32 %99, 5
  %101 = sub nsw i32 %99, %100
  store i32 %101, ptr %97, align 4, !tbaa !5
  %102 = icmp eq i64 %80, 511
  br i1 %102, label %53, label %76, !llvm.loop !15
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #9

declare void @simFlush(...) local_unnamed_addr #5

declare i32 @simRand(...) local_unnamed_addr #5

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10, !12}
!12 = !{!"llvm.loop.peeled.count", i32 2}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10, !12}
!15 = distinct !{!15, !10, !12}
