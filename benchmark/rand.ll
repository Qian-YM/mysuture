; ModuleID = 'rand.bc'
source_filename = "rand.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { %struct.blake2s_state, i64, i32 }
%struct.blake2s_state = type { [8 x i32], [2 x i32], [2 x i32], [64 x i8], i32, i32 }
%struct.kiocb = type opaque

@input_pool = internal global %struct.anon { %struct.blake2s_state { [8 x i32] [i32 1795745351, i32 -1150833019, i32 1013904242, i32 -1521486534, i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225], [2 x i32] zeroinitializer, [2 x i32] zeroinitializer, [64 x i8] zeroinitializer, i32 0, i32 32 }, i64 0, i32 0 }, align 8, !dbg !0

; Function Attrs: nounwind uwtable
define dso_local void @blake2s_update(%struct.blake2s_state* nocapture %0, i8* nocapture readonly %1, i64 %2) local_unnamed_addr #0 !dbg !38 {
  call void @llvm.dbg.value(metadata %struct.blake2s_state* %0, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata i8* %1, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata i64 %2, metadata !47, metadata !DIExpression()), !dbg !50
  %4 = getelementptr inbounds %struct.blake2s_state, %struct.blake2s_state* %0, i64 0, i32 4, !dbg !51
  %5 = load i32, i32* %4, align 4, !dbg !51, !tbaa !52
  %6 = sub i32 64, %5, !dbg !57
  %7 = zext i32 %6 to i64, !dbg !58
  call void @llvm.dbg.value(metadata i64 %7, metadata !48, metadata !DIExpression()), !dbg !50
  %8 = icmp ult i64 %7, %2, !dbg !59
  br i1 %8, label %9, label %14, !dbg !61

9:                                                ; preds = %3
  %10 = zext i32 %5 to i64, !dbg !62
  %11 = getelementptr inbounds %struct.blake2s_state, %struct.blake2s_state* %0, i64 0, i32 3, i64 %10, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %11, i8* align 1 %1, i64 %7, i1 false), !dbg !64
  store i32 0, i32* %4, align 4, !dbg !65, !tbaa !52
  %12 = getelementptr inbounds i8, i8* %1, i64 %7, !dbg !66
  call void @llvm.dbg.value(metadata i8* %12, metadata !46, metadata !DIExpression()), !dbg !50
  %13 = sub i64 %2, %7, !dbg !67
  call void @llvm.dbg.value(metadata i64 %13, metadata !47, metadata !DIExpression()), !dbg !50
  br label %14, !dbg !68

14:                                               ; preds = %9, %3
  %15 = phi i64 [ %13, %9 ], [ %2, %3 ]
  %16 = phi i8* [ %12, %9 ], [ %1, %3 ]
  call void @llvm.dbg.value(metadata i8* %16, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata i64 %15, metadata !47, metadata !DIExpression()), !dbg !50
  %17 = load i32, i32* %4, align 4, !dbg !69, !tbaa !52
  %18 = zext i32 %17 to i64, !dbg !70
  %19 = getelementptr inbounds %struct.blake2s_state, %struct.blake2s_state* %0, i64 0, i32 3, i64 %18, !dbg !70
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %19, i8* align 1 %16, i64 %15, i1 false), !dbg !71
  %20 = load i32, i32* %4, align 4, !dbg !72, !tbaa !52
  %21 = trunc i64 %15 to i32, !dbg !72
  %22 = add i32 %20, %21, !dbg !72
  store i32 %22, i32* %4, align 4, !dbg !72, !tbaa !52
  ret void, !dbg !73
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local void @entry0(i32 %0, i8 signext %1) local_unnamed_addr #0 !dbg !74 {
  %3 = alloca i32, align 4
  %4 = alloca [256 x i8], align 16
  call void @llvm.dbg.value(metadata i32 %0, metadata !78, metadata !DIExpression()), !dbg !84
  store i32 %0, i32* %3, align 4, !tbaa !85
  call void @llvm.dbg.value(metadata i8 undef, metadata !79, metadata !DIExpression()), !dbg !84
  %5 = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 0, i64 0, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %5) #4, !dbg !86
  call void @llvm.dbg.declare(metadata [256 x i8]* %4, metadata !80, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata i32* %3, metadata !78, metadata !DIExpression(DW_OP_deref)), !dbg !84
  %6 = call i32 (i8*, i32*, i32, ...) bitcast (i32 (...)* @copy_from_user to i32 (i8*, i32*, i32, ...)*)(i8* nonnull %5, i32* nonnull %3, i32 256) #4, !dbg !88
  call fastcc void @random_write_iter(i8* nonnull %5), !dbg !89
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %5) #4, !dbg !90
  ret void, !dbg !90
}

declare dso_local i32 @copy_from_user(...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define internal fastcc void @random_write_iter(i8* %0) unnamed_addr #0 !dbg !91 {
  call void @llvm.dbg.value(metadata %struct.kiocb* undef, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i8* %0, metadata !104, metadata !DIExpression()), !dbg !105
  call fastcc void @write_pool_user(i8* %0), !dbg !106
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 !dbg !107 {
  call void @entry0(i32 1, i8 signext undef), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind uwtable
define internal fastcc void @write_pool_user(i8* %0) unnamed_addr #0 !dbg !112 {
  %2 = alloca [64 x i8], align 16
  call void @llvm.dbg.value(metadata i8* %0, metadata !116, metadata !DIExpression()), !dbg !120
  %3 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0, !dbg !121
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %3) #4, !dbg !121
  call void @llvm.dbg.declare(metadata [64 x i8]* %2, metadata !117, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.value(metadata i64 0, metadata !118, metadata !DIExpression()), !dbg !120
  %4 = ptrtoint [64 x i8]* %2 to i64, !dbg !123
  %5 = icmp ne [64 x i8]* %2, inttoptr (i64 64 to [64 x i8]*), !dbg !127
  br label %6, !dbg !129

6:                                                ; preds = %6, %1
  call void @llvm.dbg.value(metadata i64 undef, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(64) %3, i8* nonnull align 1 dereferenceable(64) %0, i64 64, i1 false), !dbg !130
  call void @llvm.dbg.value(metadata i64 %4, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.value(metadata i64 undef, metadata !118, metadata !DIExpression()), !dbg !120
  call fastcc void @mix_pool_bytes(i8* nonnull %3, i64 %4), !dbg !131
  %7 = call i32 (i8*, ...) bitcast (i32 (...)* @iov_iter_count to i32 (i8*, ...)*)(i8* %0) #4, !dbg !132
  %8 = icmp eq i32 %7, 0, !dbg !132
  %9 = or i1 %5, %8, !dbg !133
  br i1 %9, label %10, label %6, !dbg !133, !llvm.loop !134

10:                                               ; preds = %6
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %3) #4, !dbg !137
  ret void
}

; Function Attrs: nounwind uwtable
define internal fastcc void @mix_pool_bytes(i8* nocapture readonly %0, i64 %1) unnamed_addr #0 !dbg !138 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !144, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.value(metadata i64 %1, metadata !145, metadata !DIExpression()), !dbg !147
  call fastcc void @_mix_pool_bytes(i8* %0, i64 %1), !dbg !148
  ret void, !dbg !149
}

declare dso_local i32 @iov_iter_count(...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define internal fastcc void @_mix_pool_bytes(i8* nocapture readonly %0, i64 %1) unnamed_addr #0 !dbg !150 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !152, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.value(metadata i64 %1, metadata !153, metadata !DIExpression()), !dbg !154
  call void @blake2s_update(%struct.blake2s_state* getelementptr inbounds (%struct.anon, %struct.anon* @input_pool, i64 0, i32 0), i8* %0, i64 %1), !dbg !155
  ret void, !dbg !156
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!34, !35, !36}
!llvm.ident = !{!37}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "input_pool", scope: !2, file: !3, line: 37, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "rand.c", directory: "/work/benchmark")
!4 = !{}
!5 = !{!0}
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 33, size: 1088, elements: !7)
!7 = !{!8, !29, !33}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !6, file: !3, line: 34, baseType: !9, size: 960)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "blake2s_state", file: !3, line: 24, size: 960, elements: !10)
!10 = !{!11, !16, !20, !21, !26, !28}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !9, file: !3, line: 26, baseType: !12, size: 256)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 256, elements: !14)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{!15}
!15 = !DISubrange(count: 8)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "t", scope: !9, file: !3, line: 27, baseType: !17, size: 64, offset: 256)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 2)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "f", scope: !9, file: !3, line: 28, baseType: !17, size: 64, offset: 320)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "buf", scope: !9, file: !3, line: 29, baseType: !22, size: 512, offset: 384)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 512, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "buflen", scope: !9, file: !3, line: 30, baseType: !27, size: 32, offset: 896)
!27 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "outlen", scope: !9, file: !3, line: 31, baseType: !27, size: 32, offset: 928)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "lock", scope: !6, file: !3, line: 35, baseType: !30, size: 64, offset: 960)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "/usr/lib/llvm-10/lib/clang/10.0.0/include/stddef.h", directory: "")
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "init_bits", scope: !6, file: !3, line: 36, baseType: !27, size: 32, offset: 1024)
!34 = !{i32 7, !"Dwarf Version", i32 4}
!35 = !{i32 2, !"Debug Info Version", i32 3}
!36 = !{i32 1, !"wchar_size", i32 4}
!37 = !{!"clang version 10.0.0-4ubuntu1 "}
!38 = distinct !DISubprogram(name: "blake2s_update", scope: !3, file: !3, line: 46, type: !39, scopeLine: 47, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !44)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !41, !42, !30}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!44 = !{!45, !46, !47, !48}
!45 = !DILocalVariable(name: "state", arg: 1, scope: !38, file: !3, line: 46, type: !41)
!46 = !DILocalVariable(name: "in", arg: 2, scope: !38, file: !3, line: 46, type: !42)
!47 = !DILocalVariable(name: "inlen", arg: 3, scope: !38, file: !3, line: 46, type: !30)
!48 = !DILocalVariable(name: "fill", scope: !38, file: !3, line: 48, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!50 = !DILocation(line: 0, scope: !38)
!51 = !DILocation(line: 48, column: 64, scope: !38)
!52 = !{!53, !56, i64 112}
!53 = !{!"blake2s_state", !54, i64 0, !54, i64 32, !54, i64 40, !54, i64 48, !56, i64 112, !56, i64 116}
!54 = !{!"omnipotent char", !55, i64 0}
!55 = !{!"Simple C/C++ TBAA"}
!56 = !{!"int", !54, i64 0}
!57 = !DILocation(line: 48, column: 55, scope: !38)
!58 = !DILocation(line: 48, column: 25, scope: !38)
!59 = !DILocation(line: 51, column: 15, scope: !60)
!60 = distinct !DILexicalBlock(scope: !38, file: !3, line: 51, column: 9)
!61 = !DILocation(line: 51, column: 9, scope: !38)
!62 = !DILocation(line: 52, column: 27, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !3, line: 51, column: 23)
!64 = !DILocation(line: 52, column: 9, scope: !63)
!65 = !DILocation(line: 54, column: 23, scope: !63)
!66 = !DILocation(line: 55, column: 12, scope: !63)
!67 = !DILocation(line: 56, column: 15, scope: !63)
!68 = !DILocation(line: 57, column: 5, scope: !63)
!69 = !DILocation(line: 59, column: 32, scope: !38)
!70 = !DILocation(line: 59, column: 23, scope: !38)
!71 = !DILocation(line: 59, column: 5, scope: !38)
!72 = !DILocation(line: 60, column: 19, scope: !38)
!73 = !DILocation(line: 62, column: 1, scope: !38)
!74 = distinct !DISubprogram(name: "entry0", scope: !3, file: !3, line: 106, type: !75, scopeLine: 106, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !77)
!75 = !DISubroutineType(types: !76)
!76 = !{null, !13, !23}
!77 = !{!78, !79, !80}
!78 = !DILocalVariable(name: "cmd", arg: 1, scope: !74, file: !3, line: 106, type: !13)
!79 = !DILocalVariable(name: "user_input", arg: 2, scope: !74, file: !3, line: 106, type: !23)
!80 = !DILocalVariable(name: "con", scope: !74, file: !3, line: 107, type: !81)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 2048, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 256)
!84 = !DILocation(line: 0, scope: !74)
!85 = !{!56, !56, i64 0}
!86 = !DILocation(line: 107, column: 5, scope: !74)
!87 = !DILocation(line: 107, column: 10, scope: !74)
!88 = !DILocation(line: 108, column: 5, scope: !74)
!89 = !DILocation(line: 109, column: 5, scope: !74)
!90 = !DILocation(line: 110, column: 1, scope: !74)
!91 = distinct !DISubprogram(name: "random_write_iter", scope: !3, file: !3, line: 102, type: !92, scopeLine: 103, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !102)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !99, !101}
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "ssize_t", file: !95, line: 77, baseType: !96)
!95 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ssize_t", file: !97, line: 193, baseType: !98)
!97 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!98 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DICompositeType(tag: DW_TAG_structure_type, name: "kiocb", file: !3, line: 102, flags: DIFlagFwdDecl)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!102 = !{!103, !104}
!103 = !DILocalVariable(name: "kiocb", arg: 1, scope: !91, file: !3, line: 102, type: !99)
!104 = !DILocalVariable(name: "iter", arg: 2, scope: !91, file: !3, line: 102, type: !101)
!105 = !DILocation(line: 0, scope: !91)
!106 = !DILocation(line: 104, column: 12, scope: !91)
!107 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 112, type: !108, scopeLine: 112, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!108 = !DISubroutineType(types: !109)
!109 = !{!13}
!110 = !DILocation(line: 113, column: 5, scope: !107)
!111 = !DILocation(line: 114, column: 1, scope: !107)
!112 = distinct !DISubprogram(name: "write_pool_user", scope: !3, file: !3, line: 77, type: !113, scopeLine: 78, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !115)
!113 = !DISubroutineType(types: !114)
!114 = !{!94, !101}
!115 = !{!116, !117, !118, !119}
!116 = !DILocalVariable(name: "iter", arg: 1, scope: !112, file: !3, line: 77, type: !101)
!117 = !DILocalVariable(name: "block", scope: !112, file: !3, line: 79, type: !22)
!118 = !DILocalVariable(name: "ret", scope: !112, file: !3, line: 80, type: !94)
!119 = !DILocalVariable(name: "copied", scope: !112, file: !3, line: 81, type: !30)
!120 = !DILocation(line: 0, scope: !112)
!121 = !DILocation(line: 79, column: 5, scope: !112)
!122 = !DILocation(line: 79, column: 8, scope: !112)
!123 = !DILocation(line: 0, scope: !124)
!124 = distinct !DILexicalBlock(scope: !125, file: !3, line: 84, column: 14)
!125 = distinct !DILexicalBlock(scope: !126, file: !3, line: 84, column: 5)
!126 = distinct !DILexicalBlock(scope: !112, file: !3, line: 84, column: 5)
!127 = !DILocation(line: 0, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !3, line: 90, column: 13)
!129 = !DILocation(line: 84, column: 5, scope: !112)
!130 = !DILocation(line: 86, column: 18, scope: !124)
!131 = !DILocation(line: 88, column: 9, scope: !124)
!132 = !DILocation(line: 90, column: 14, scope: !128)
!133 = !DILocation(line: 90, column: 35, scope: !128)
!134 = distinct !{!134, !135, !136}
!135 = !DILocation(line: 84, column: 5, scope: !126)
!136 = !DILocation(line: 98, column: 5, scope: !126)
!137 = !DILocation(line: 100, column: 1, scope: !112)
!138 = distinct !DISubprogram(name: "mix_pool_bytes", scope: !3, file: !3, line: 69, type: !139, scopeLine: 70, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !143)
!139 = !DISubroutineType(types: !140)
!140 = !{null, !141, !30}
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !142, size: 64)
!142 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!143 = !{!144, !145, !146}
!144 = !DILocalVariable(name: "buf", arg: 1, scope: !138, file: !3, line: 69, type: !141)
!145 = !DILocalVariable(name: "len", arg: 2, scope: !138, file: !3, line: 69, type: !30)
!146 = !DILocalVariable(name: "flags", scope: !138, file: !3, line: 71, type: !32)
!147 = !DILocation(line: 0, scope: !138)
!148 = !DILocation(line: 74, column: 5, scope: !138)
!149 = !DILocation(line: 76, column: 1, scope: !138)
!150 = distinct !DISubprogram(name: "_mix_pool_bytes", scope: !3, file: !3, line: 65, type: !139, scopeLine: 66, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !151)
!151 = !{!152, !153}
!152 = !DILocalVariable(name: "buf", arg: 1, scope: !150, file: !3, line: 65, type: !141)
!153 = !DILocalVariable(name: "len", arg: 2, scope: !150, file: !3, line: 65, type: !30)
!154 = !DILocation(line: 0, scope: !150)
!155 = !DILocation(line: 67, column: 5, scope: !150)
!156 = !DILocation(line: 68, column: 1, scope: !150)
