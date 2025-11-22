; ModuleID = 'motivating_example.bc'
source_filename = "motivating_example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.data = type { i32, [4 x i8] }

@d = common dso_local global %struct.data zeroinitializer, align 4, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%c\0A\00", align 1

; Function Attrs: nofree noinline norecurse nounwind uwtable writeonly
define dso_local i32 @foo(i32 %0, i8 signext %1) local_unnamed_addr #0 !dbg !24 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !28, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.value(metadata i8 %1, metadata !29, metadata !DIExpression()), !dbg !30
  %3 = icmp eq i32 %0, 0, !dbg !31
  br i1 %3, label %4, label %5, !dbg !33

4:                                                ; preds = %2
  store i8 %1, i8* getelementptr inbounds (%struct.data, %struct.data* @d, i64 0, i32 1, i64 1), align 1, !dbg !34, !tbaa !36
  br label %5, !dbg !39

5:                                                ; preds = %4, %2
  ret i32 0, !dbg !40
}

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define dso_local i32 @entry0(i32 %0, i8 signext %1) local_unnamed_addr #1 !dbg !41 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.value(metadata i8 %1, metadata !44, metadata !DIExpression()), !dbg !45
  %3 = icmp eq i32 %0, 0, !dbg !46
  br i1 %3, label %4, label %5, !dbg !46

4:                                                ; preds = %2
  store i8 %1, i8* getelementptr inbounds (%struct.data, %struct.data* @d, i64 0, i32 1, i64 0), align 4, !dbg !47, !tbaa !36
  br label %7, !dbg !49

5:                                                ; preds = %2
  %6 = call i32 @foo(i32 %0, i8 signext %1), !dbg !50
  br label %7, !dbg !51

7:                                                ; preds = %5, %4
  ret i32 0, !dbg !52
}

; Function Attrs: nofree noinline norecurse nounwind uwtable
define dso_local i32 @bar(i8* nocapture %0) local_unnamed_addr #2 !dbg !53 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !57, metadata !DIExpression()), !dbg !58
  %2 = getelementptr inbounds i8, i8* %0, i64 4, !dbg !59
  %3 = load i8, i8* %2, align 1, !dbg !60, !tbaa !36
  %4 = add i8 %3, -16, !dbg !60
  store i8 %4, i8* %2, align 1, !dbg !60, !tbaa !36
  ret i32 0, !dbg !61
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @entry1() local_unnamed_addr #3 !dbg !62 {
  %1 = call i32 @bar(i8* bitcast (%struct.data* @d to i8*)), !dbg !65
  store i8 0, i8* getelementptr inbounds (%struct.data, %struct.data* @d, i64 0, i32 1, i64 0), align 4, !dbg !66, !tbaa !36
  ret i32 0, !dbg !67
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @entry2() local_unnamed_addr #4 !dbg !68 {
  %1 = load i8, i8* getelementptr inbounds (%struct.data, %struct.data* @d, i64 0, i32 1, i64 1), align 1, !dbg !74, !tbaa !36
  %2 = add i8 %1, -16, !dbg !75
  call void @llvm.dbg.value(metadata i8 %2, metadata !70, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !76
  %3 = sext i8 %2 to i32, !dbg !77
  %4 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %3), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main(i32 %0, i8** nocapture readonly %1) local_unnamed_addr #4 !dbg !80 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.value(metadata i8** %1, metadata !86, metadata !DIExpression()), !dbg !87
  %3 = load i8*, i8** %1, align 8, !dbg !88, !tbaa !89
  %4 = load i8, i8* %3, align 1, !dbg !91, !tbaa !36
  %5 = call i32 @entry0(i32 %0, i8 signext %4), !dbg !92
  %6 = call i32 @entry1(), !dbg !93
  %7 = call i32 @entry2(), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #6

attributes #0 = { nofree noinline norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "d", scope: !2, file: !3, line: 8, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "motivating_example.c", directory: "/work/SUTURE-main/benchmark")
!4 = !{}
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{!0}
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "data", file: !3, line: 7, baseType: !10)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "data", file: !3, line: 4, size: 64, elements: !11)
!11 = !{!12, !16}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !10, file: !3, line: 5, baseType: !13, size: 32)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !14, line: 41, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !10, file: !3, line: 6, baseType: !17, size: 32, offset: 32)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 32, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 4)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{!"clang version 10.0.0-4ubuntu1 "}
!24 = distinct !DISubprogram(name: "foo", scope: !3, file: !3, line: 10, type: !25, scopeLine: 10, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !27)
!25 = !DISubroutineType(types: !26)
!26 = !{!15, !15, !7}
!27 = !{!28, !29}
!28 = !DILocalVariable(name: "n", arg: 1, scope: !24, file: !3, line: 10, type: !15)
!29 = !DILocalVariable(name: "c", arg: 2, scope: !24, file: !3, line: 10, type: !7)
!30 = !DILocation(line: 0, scope: !24)
!31 = !DILocation(line: 11, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !3, line: 11, column: 9)
!33 = !DILocation(line: 11, column: 9, scope: !24)
!34 = !DILocation(line: 12, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !3, line: 11, column: 17)
!36 = !{!37, !37, i64 0}
!37 = !{!"omnipotent char", !38, i64 0}
!38 = !{!"Simple C/C++ TBAA"}
!39 = !DILocation(line: 13, column: 5, scope: !35)
!40 = !DILocation(line: 14, column: 5, scope: !24)
!41 = distinct !DISubprogram(name: "entry0", scope: !3, file: !3, line: 17, type: !25, scopeLine: 17, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !42)
!42 = !{!43, !44}
!43 = !DILocalVariable(name: "cmd", arg: 1, scope: !41, file: !3, line: 17, type: !15)
!44 = !DILocalVariable(name: "user_input", arg: 2, scope: !41, file: !3, line: 17, type: !7)
!45 = !DILocation(line: 0, scope: !41)
!46 = !DILocation(line: 18, column: 5, scope: !41)
!47 = !DILocation(line: 21, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !41, file: !3, line: 19, column: 5)
!49 = !DILocation(line: 22, column: 9, scope: !48)
!50 = !DILocation(line: 24, column: 9, scope: !48)
!51 = !DILocation(line: 25, column: 5, scope: !48)
!52 = !DILocation(line: 26, column: 5, scope: !41)
!53 = distinct !DISubprogram(name: "bar", scope: !3, file: !3, line: 29, type: !54, scopeLine: 29, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !56)
!54 = !DISubroutineType(types: !55)
!55 = !{!15, !6}
!56 = !{!57}
!57 = !DILocalVariable(name: "p", arg: 1, scope: !53, file: !3, line: 29, type: !6)
!58 = !DILocation(line: 0, scope: !53)
!59 = !DILocation(line: 30, column: 8, scope: !53)
!60 = !DILocation(line: 30, column: 12, scope: !53)
!61 = !DILocation(line: 31, column: 5, scope: !53)
!62 = distinct !DISubprogram(name: "entry1", scope: !3, file: !3, line: 34, type: !63, scopeLine: 34, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!15}
!65 = !DILocation(line: 35, column: 5, scope: !62)
!66 = !DILocation(line: 36, column: 12, scope: !62)
!67 = !DILocation(line: 37, column: 5, scope: !62)
!68 = distinct !DISubprogram(name: "entry2", scope: !3, file: !3, line: 40, type: !63, scopeLine: 40, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !69)
!69 = !{!70}
!70 = !DILocalVariable(name: "a", scope: !68, file: !3, line: 41, type: !71)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 64, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 8)
!74 = !DILocation(line: 42, column: 12, scope: !68)
!75 = !DILocation(line: 42, column: 19, scope: !68)
!76 = !DILocation(line: 0, scope: !68)
!77 = !DILocation(line: 43, column: 19, scope: !68)
!78 = !DILocation(line: 43, column: 5, scope: !68)
!79 = !DILocation(line: 44, column: 5, scope: !68)
!80 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 49, type: !81, scopeLine: 49, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !84)
!81 = !DISubroutineType(types: !82)
!82 = !{!15, !15, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!84 = !{!85, !86}
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !3, line: 49, type: !15)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !3, line: 49, type: !83)
!87 = !DILocation(line: 0, scope: !80)
!88 = !DILocation(line: 50, column: 18, scope: !80)
!89 = !{!90, !90, i64 0}
!90 = !{!"any pointer", !37, i64 0}
!91 = !DILocation(line: 50, column: 17, scope: !80)
!92 = !DILocation(line: 50, column: 5, scope: !80)
!93 = !DILocation(line: 51, column: 5, scope: !80)
!94 = !DILocation(line: 52, column: 5, scope: !80)
!95 = !DILocation(line: 53, column: 5, scope: !80)
