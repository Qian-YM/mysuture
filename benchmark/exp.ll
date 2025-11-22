; ModuleID = 'exp.bc'
source_filename = "exp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.data = type { i32, [4 x i8] }
%struct.mytype = type { [4096 x i8] }

@numbers = dso_local global [128 x i32] zeroinitializer, align 16, !dbg !0
@d = common dso_local global %struct.data zeroinitializer, align 4, !dbg !17
@fp = common dso_local local_unnamed_addr global void (%struct.data*, i8)* null, align 8, !dbg !30
@mt = common dso_local local_unnamed_addr global %struct.mytype zeroinitializer, align 1, !dbg !9

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @test01(i8* nocapture %0, i8 signext %1) local_unnamed_addr #0 !dbg !44 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !48, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata i8 %1, metadata !49, metadata !DIExpression()), !dbg !50
  %3 = icmp eq i8 %1, 0, !dbg !51
  br i1 %3, label %5, label %4, !dbg !53

4:                                                ; preds = %2
  store i8 %1, i8* %0, align 1, !dbg !54, !tbaa !55
  br label %7, !dbg !58

5:                                                ; preds = %2
  %6 = getelementptr inbounds i8, i8* %0, i64 1000, !dbg !59
  store i8 0, i8* %6, align 1, !dbg !60, !tbaa !55
  br label %7

7:                                                ; preds = %5, %4
  ret void, !dbg !61
}

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @test00(%struct.data* nocapture %0, i8 signext %1) #0 !dbg !62 {
  call void @llvm.dbg.value(metadata %struct.data* %0, metadata !64, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata i8 %1, metadata !65, metadata !DIExpression()), !dbg !66
  %3 = bitcast %struct.data* %0 to i8*, !dbg !67
  store i8 %1, i8* %3, align 1, !dbg !68, !tbaa !55
  call void @test01(i8* nonnull %3, i8 signext %1), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local i32 @entry0(i32 %0, i8 signext %1) local_unnamed_addr #0 !dbg !71 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.value(metadata i8 %1, metadata !76, metadata !DIExpression()), !dbg !77
  call void @test00(%struct.data* nonnull @d, i8 signext %1), !dbg !78
  store i8 %1, i8* getelementptr inbounds (%struct.data, %struct.data* @d, i64 0, i32 1, i64 0), align 4, !dbg !79, !tbaa !55
  store void (%struct.data*, i8)* @test00, void (%struct.data*, i8)** @fp, align 8, !dbg !80, !tbaa !81
  ret i32 undef, !dbg !83
}

; Function Attrs: nofree noinline norecurse nounwind uwtable
define dso_local i32 @bar(i8* nocapture %0) local_unnamed_addr #1 !dbg !84 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = getelementptr inbounds i8, i8* %0, i64 4, !dbg !90
  %3 = load i8, i8* %2, align 1, !dbg !91, !tbaa !55
  %4 = add i8 %3, -16, !dbg !91
  store i8 %4, i8* %2, align 1, !dbg !91, !tbaa !55
  ret i32 0, !dbg !92
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @entry1() local_unnamed_addr #2 !dbg !93 {
  %1 = call i32 @bar(i8* bitcast ([128 x i32]* @numbers to i8*)), !dbg !96
  ret i32 undef, !dbg !97
}

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local void @test20() local_unnamed_addr #0 !dbg !98 {
  store void (%struct.data*, i8)* @test00, void (%struct.data*, i8)** @fp, align 8, !dbg !101, !tbaa !81
  ret void, !dbg !102
}

; Function Attrs: nounwind uwtable
define dso_local void @test21() local_unnamed_addr #3 !dbg !103 {
  %1 = load void (%struct.data*, i8)*, void (%struct.data*, i8)** @fp, align 8, !dbg !104, !tbaa !81
  call void %1(%struct.data* nonnull @d, i8 signext 97) #6, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind uwtable
define dso_local i32 @entry2() local_unnamed_addr #3 !dbg !106 {
  call void @test20(), !dbg !107
  call void @test21(), !dbg !108
  ret i32 undef, !dbg !109
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @main() local_unnamed_addr #4 !dbg !110 {
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

attributes #0 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!40, !41, !42}
!llvm.ident = !{!43}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "numbers", scope: !2, file: !3, line: 5, type: !37, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "exp.c", directory: "/work/SUTURE-main/benchmark")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{!0, !9, !17, !30}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "mt", scope: !2, file: !3, line: 10, type: !11, isLocal: false, isDefinition: true)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "mytype", file: !3, line: 7, size: 32768, elements: !12)
!12 = !{!13}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !11, file: !3, line: 8, baseType: !14, size: 32768)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 32768, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 4096)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "d", scope: !2, file: !3, line: 16, type: !19, isLocal: false, isDefinition: true)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "data", file: !3, line: 15, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "data", file: !3, line: 12, size: 64, elements: !21)
!21 = !{!22, !26}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !20, file: !3, line: 13, baseType: !23, size: 32)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !24, line: 41, baseType: !25)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !20, file: !3, line: 14, baseType: !27, size: 32, offset: 32)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 32, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 4)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "fp", scope: !2, file: !3, line: 28, type: !32, isLocal: false, isDefinition: true)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "test00_ptr_t", file: !3, line: 27, baseType: !33)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !36, !7}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 4096, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 128)
!40 = !{i32 7, !"Dwarf Version", i32 4}
!41 = !{i32 2, !"Debug Info Version", i32 3}
!42 = !{i32 1, !"wchar_size", i32 4}
!43 = !{!"clang version 10.0.0-4ubuntu1 "}
!44 = distinct !DISubprogram(name: "test01", scope: !3, file: !3, line: 18, type: !45, scopeLine: 18, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !47)
!45 = !DISubroutineType(types: !46)
!46 = !{null, !6, !7}
!47 = !{!48, !49}
!48 = !DILocalVariable(name: "p", arg: 1, scope: !44, file: !3, line: 18, type: !6)
!49 = !DILocalVariable(name: "u", arg: 2, scope: !44, file: !3, line: 18, type: !7)
!50 = !DILocation(line: 0, scope: !44)
!51 = !DILocation(line: 19, column: 8, scope: !52)
!52 = distinct !DILexicalBlock(scope: !44, file: !3, line: 19, column: 8)
!53 = !DILocation(line: 19, column: 8, scope: !44)
!54 = !DILocation(line: 19, column: 26, scope: !52)
!55 = !{!56, !56, i64 0}
!56 = !{!"omnipotent char", !57, i64 0}
!57 = !{!"Simple C/C++ TBAA"}
!58 = !DILocation(line: 19, column: 11, scope: !52)
!59 = !DILocation(line: 20, column: 10, scope: !52)
!60 = !DILocation(line: 20, column: 28, scope: !52)
!61 = !DILocation(line: 21, column: 1, scope: !44)
!62 = distinct !DISubprogram(name: "test00", scope: !3, file: !3, line: 23, type: !34, scopeLine: 23, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !63)
!63 = !{!64, !65}
!64 = !DILocalVariable(name: "p", arg: 1, scope: !62, file: !3, line: 23, type: !36)
!65 = !DILocalVariable(name: "u", arg: 2, scope: !62, file: !3, line: 23, type: !7)
!66 = !DILocation(line: 0, scope: !62)
!67 = !DILocation(line: 24, column: 5, scope: !62)
!68 = !DILocation(line: 24, column: 20, scope: !62)
!69 = !DILocation(line: 25, column: 5, scope: !62)
!70 = !DILocation(line: 26, column: 1, scope: !62)
!71 = distinct !DISubprogram(name: "entry0", scope: !3, file: !3, line: 29, type: !72, scopeLine: 29, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !74)
!72 = !DISubroutineType(types: !73)
!73 = !{!25, !25, !7}
!74 = !{!75, !76}
!75 = !DILocalVariable(name: "cmd", arg: 1, scope: !71, file: !3, line: 29, type: !25)
!76 = !DILocalVariable(name: "user_input", arg: 2, scope: !71, file: !3, line: 29, type: !7)
!77 = !DILocation(line: 0, scope: !71)
!78 = !DILocation(line: 30, column: 5, scope: !71)
!79 = !DILocation(line: 31, column: 12, scope: !71)
!80 = !DILocation(line: 32, column: 8, scope: !71)
!81 = !{!82, !82, i64 0}
!82 = !{!"any pointer", !56, i64 0}
!83 = !DILocation(line: 33, column: 1, scope: !71)
!84 = distinct !DISubprogram(name: "bar", scope: !3, file: !3, line: 34, type: !85, scopeLine: 34, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !87)
!85 = !DISubroutineType(types: !86)
!86 = !{!25, !6}
!87 = !{!88}
!88 = !DILocalVariable(name: "p", arg: 1, scope: !84, file: !3, line: 34, type: !6)
!89 = !DILocation(line: 0, scope: !84)
!90 = !DILocation(line: 35, column: 8, scope: !84)
!91 = !DILocation(line: 35, column: 12, scope: !84)
!92 = !DILocation(line: 36, column: 5, scope: !84)
!93 = distinct !DISubprogram(name: "entry1", scope: !3, file: !3, line: 38, type: !94, scopeLine: 38, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!94 = !DISubroutineType(types: !95)
!95 = !{!25}
!96 = !DILocation(line: 39, column: 5, scope: !93)
!97 = !DILocation(line: 40, column: 1, scope: !93)
!98 = distinct !DISubprogram(name: "test20", scope: !3, file: !3, line: 41, type: !99, scopeLine: 41, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!99 = !DISubroutineType(types: !100)
!100 = !{null}
!101 = !DILocation(line: 42, column: 8, scope: !98)
!102 = !DILocation(line: 43, column: 1, scope: !98)
!103 = distinct !DISubprogram(name: "test21", scope: !3, file: !3, line: 44, type: !99, scopeLine: 44, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!104 = !DILocation(line: 45, column: 5, scope: !103)
!105 = !DILocation(line: 46, column: 1, scope: !103)
!106 = distinct !DISubprogram(name: "entry2", scope: !3, file: !3, line: 47, type: !94, scopeLine: 47, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!107 = !DILocation(line: 48, column: 5, scope: !106)
!108 = !DILocation(line: 49, column: 5, scope: !106)
!109 = !DILocation(line: 50, column: 1, scope: !106)
!110 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 52, type: !94, scopeLine: 52, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!111 = !DILocation(line: 54, column: 1, scope: !110)
