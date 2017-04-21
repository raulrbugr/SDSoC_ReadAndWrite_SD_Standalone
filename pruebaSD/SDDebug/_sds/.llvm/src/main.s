; ModuleID = 'G:/pruebaSD/src/main.cpp'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-n32-S64"
target triple = "armv7-none--eabi"

%struct.FATFS = type { i8, i8, i8, i8, i8, i8, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [16 x i8], [512 x i8] }
%struct.FIL = type { %struct.FATFS*, i16, i8, i8, i32, i32, i32, i32, i32, i32, i8*, [28 x i8], [512 x i8] }
%"class.std::basic_string" = type { %"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" }
%"struct.std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%"class.std::allocator" = type { i8 }

@Platform = global i32 0, align 4
@DestinationAddress = global [10485760 x i8] zeroinitializer, align 32
@SourceAddress = global [10485760 x i8] zeroinitializer, align 32
@Component = global [256 x i8] zeroinitializer, align 32
@.str = private unnamed_addr constant [38 x i8] c"SD Polled File System Example Test \0D\0A\00", align 1
@.str1 = private unnamed_addr constant [45 x i8] c"SD Polled File System Example Test failed \0D\0A\00", align 1
@.str2 = private unnamed_addr constant [55 x i8] c"Successfully ran SD Polled File System Example Test \0D\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"0:/\00", align 1
@_ZL5fatfs = internal global %struct.FATFS zeroinitializer, align 32
@_ZL8FileName = internal global [32 x i8] c"Test.txt\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@_ZL7SD_File = internal global i8* null, align 4
@_ZL3fil = internal global %struct.FIL zeroinitializer, align 32
@.str4 = private unnamed_addr constant [5 x i8] c"hola\00", align 1
@.str5 = private unnamed_addr constant [12 x i8] c"Palabra: \0D\0A\00", align 1

define i32 @main() #0 {
  %1 = alloca i32, align 4
  %Status = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %Status}, metadata !206), !dbg !207
  call void (i8*, ...)* @xil_printf(i8* getelementptr inbounds ([38 x i8]* @.str, i32 0, i32 0)), !dbg !208
  %2 = call i32 @_Z18FfsSdPolledExamplev(), !dbg !209
  store i32 %2, i32* %Status, align 4, !dbg !209
  %3 = load i32* %Status, align 4, !dbg !210
  %4 = icmp ne i32 %3, 0, !dbg !210
  br i1 %4, label %5, label %6, !dbg !210

; <label>:5                                       ; preds = %0
  call void (i8*, ...)* @xil_printf(i8* getelementptr inbounds ([45 x i8]* @.str1, i32 0, i32 0)), !dbg !212
  store i32 1, i32* %1, !dbg !214
  br label %7, !dbg !214

; <label>:6                                       ; preds = %0
  call void (i8*, ...)* @xil_printf(i8* getelementptr inbounds ([55 x i8]* @.str2, i32 0, i32 0)), !dbg !215
  store i32 0, i32* %1, !dbg !216
  br label %7, !dbg !216

; <label>:7                                       ; preds = %6, %5
  %8 = load i32* %1, !dbg !217
  ret i32 %8, !dbg !217
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare void @xil_printf(i8*, ...) #0

define i32 @_Z18FfsSdPolledExamplev() #0 {
  %1 = alloca i32, align 4
  %Res = alloca i32, align 4
  %NumBytesRead = alloca i32, align 4
  %NumBytesWritten = alloca i32, align 4
  %BuffCnt = alloca i32, align 4
  %FileSize = alloca i32, align 4
  %Path = alloca i8*, align 4
  %hola = alloca %"class.std::basic_string", align 4
  %2 = alloca %"class.std::allocator", align 1
  %3 = alloca i8*
  %4 = alloca i32
  %5 = alloca i8*
  %6 = alloca i32
  call void @llvm.dbg.declare(metadata !{i32* %Res}, metadata !218), !dbg !220
  call void @llvm.dbg.declare(metadata !{i32* %NumBytesRead}, metadata !221), !dbg !223
  call void @llvm.dbg.declare(metadata !{i32* %NumBytesWritten}, metadata !224), !dbg !225
  call void @llvm.dbg.declare(metadata !{i32* %BuffCnt}, metadata !226), !dbg !227
  call void @llvm.dbg.declare(metadata !{i32* %FileSize}, metadata !228), !dbg !229
  store i32 8388608, i32* %FileSize, align 4, !dbg !230
  call void @llvm.dbg.declare(metadata !{i8** %Path}, metadata !231), !dbg !234
  store i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i8** %Path, align 4, !dbg !235
  %7 = call i32 @XGetPlatform_Info(), !dbg !236
  store i32 %7, i32* @Platform, align 4, !dbg !236
  %8 = load i32* @Platform, align 4, !dbg !237
  %9 = icmp eq i32 %8, 1, !dbg !237
  br i1 %9, label %10, label %11, !dbg !237

; <label>:10                                      ; preds = %0
  store i32 8192, i32* %FileSize, align 4, !dbg !239
  br label %11, !dbg !241

; <label>:11                                      ; preds = %10, %0
  store i32 0, i32* %BuffCnt, align 4, !dbg !242
  br label %12, !dbg !242

; <label>:12                                      ; preds = %22, %11
  %13 = load i32* %BuffCnt, align 4, !dbg !244
  %14 = load i32* %FileSize, align 4, !dbg !244
  %15 = icmp ult i32 %13, %14, !dbg !244
  br i1 %15, label %16, label %25, !dbg !244

; <label>:16                                      ; preds = %12
  %17 = load i32* %BuffCnt, align 4, !dbg !247
  %18 = add i32 7, %17, !dbg !247
  %19 = trunc i32 %18 to i8, !dbg !247
  %20 = load i32* %BuffCnt, align 4, !dbg !247
  %21 = getelementptr inbounds [10485760 x i8]* @SourceAddress, i32 0, i32 %20, !dbg !247
  store i8 %19, i8* %21, align 1, !dbg !247
  br label %22, !dbg !249

; <label>:22                                      ; preds = %16
  %23 = load i32* %BuffCnt, align 4, !dbg !250
  %24 = add i32 %23, 1, !dbg !250
  store i32 %24, i32* %BuffCnt, align 4, !dbg !250
  br label %12, !dbg !250

; <label>:25                                      ; preds = %12
  %26 = load i8** %Path, align 4, !dbg !251
  %27 = call i32 @f_mount(%struct.FATFS* @_ZL5fatfs, i8* %26, i8 zeroext 0), !dbg !251
  store i32 %27, i32* %Res, align 4, !dbg !251
  %28 = load i32* %Res, align 4, !dbg !252
  %29 = icmp ne i32 %28, 0, !dbg !252
  br i1 %29, label %30, label %31, !dbg !252

; <label>:30                                      ; preds = %25
  store i32 1, i32* %1, !dbg !254
  br label %123, !dbg !254

; <label>:31                                      ; preds = %25
  store i8* getelementptr inbounds ([32 x i8]* @_ZL8FileName, i32 0, i32 0), i8** @_ZL7SD_File, align 4, !dbg !256
  %32 = load i8** @_ZL7SD_File, align 4, !dbg !257
  %33 = call i32 @f_open(%struct.FIL* @_ZL3fil, i8* %32, i8 zeroext 11), !dbg !257
  store i32 %33, i32* %Res, align 4, !dbg !257
  %34 = load i32* %Res, align 4, !dbg !258
  %35 = icmp ne i32 %34, 0, !dbg !258
  br i1 %35, label %36, label %37, !dbg !258

; <label>:36                                      ; preds = %31
  store i32 1, i32* %1, !dbg !260
  br label %123, !dbg !260

; <label>:37                                      ; preds = %31
  call void @llvm.dbg.declare(metadata !{%"class.std::basic_string"* %hola}, metadata !262), !dbg !265
  %38 = call %"class.std::allocator"* @_ZNSaIcEC1Ev(%"class.std::allocator"* %2) #3, !dbg !265
  %39 = invoke %"class.std::basic_string"* @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* %hola, i8* getelementptr inbounds ([5 x i8]* @.str4, i32 0, i32 0), %"class.std::allocator"* dereferenceable(1) %2)
          to label %40 unwind label %61, !dbg !265

; <label>:40                                      ; preds = %37
  %41 = call %"class.std::allocator"* @_ZNSaIcED1Ev(%"class.std::allocator"* %2) #3, !dbg !266
  %42 = invoke i32 @_ZNKSs4sizeEv(%"class.std::basic_string"* %hola)
          to label %43 unwind label %66, !dbg !268

; <label>:43                                      ; preds = %40
  %44 = call i8* @llvm.stacksave(), !dbg !269
  store i8* %44, i8** %5, !dbg !269
  %45 = alloca i8, i32 %42, align 1, !dbg !269
  call void @llvm.dbg.declare(metadata !{i8* %45}, metadata !271), !dbg !275
  store i32 0, i32* %BuffCnt, align 4, !dbg !276
  br label %46, !dbg !276

; <label>:46                                      ; preds = %58, %43
  %47 = load i32* %BuffCnt, align 4, !dbg !278
  %48 = invoke i32 @_ZNKSs4sizeEv(%"class.std::basic_string"* %hola)
          to label %49 unwind label %66, !dbg !281

; <label>:49                                      ; preds = %46
  %50 = icmp ult i32 %47, %48, !dbg !282
  br i1 %50, label %51, label %71, !dbg !282

; <label>:51                                      ; preds = %49
  %52 = load i32* %BuffCnt, align 4, !dbg !284
  %53 = invoke dereferenceable(1) i8* @_ZNSsixEj(%"class.std::basic_string"* %hola, i32 %52)
          to label %54 unwind label %66, !dbg !284

; <label>:54                                      ; preds = %51
  %55 = load i8* %53, !dbg !286
  %56 = load i32* %BuffCnt, align 4, !dbg !286
  %57 = getelementptr inbounds [10485760 x i8]* @SourceAddress, i32 0, i32 %56, !dbg !286
  store i8 %55, i8* %57, align 1, !dbg !286
  br label %58, !dbg !288

; <label>:58                                      ; preds = %54
  %59 = load i32* %BuffCnt, align 4, !dbg !289
  %60 = add i32 %59, 1, !dbg !289
  store i32 %60, i32* %BuffCnt, align 4, !dbg !289
  br label %46, !dbg !289

; <label>:61                                      ; preds = %37
  %62 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !290
  %63 = extractvalue { i8*, i32 } %62, 0, !dbg !290
  store i8* %63, i8** %3, !dbg !290
  %64 = extractvalue { i8*, i32 } %62, 1, !dbg !290
  store i32 %64, i32* %4, !dbg !290
  %65 = call %"class.std::allocator"* @_ZNSaIcED1Ev(%"class.std::allocator"* %2) #3, !dbg !290
  br label %125, !dbg !290

; <label>:66                                      ; preds = %112, %111, %108, %94, %87, %85, %79, %73, %71, %51, %46, %40
  %67 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !290
  %68 = extractvalue { i8*, i32 } %67, 0, !dbg !290
  store i8* %68, i8** %3, !dbg !290
  %69 = extractvalue { i8*, i32 } %67, 1, !dbg !290
  store i32 %69, i32* %4, !dbg !290
  %70 = invoke %"class.std::basic_string"* @_ZNSsD1Ev(%"class.std::basic_string"* %hola)
          to label %122 unwind label %130, !dbg !290

; <label>:71                                      ; preds = %49
  %72 = invoke i32 @_ZNKSs4sizeEv(%"class.std::basic_string"* %hola)
          to label %73 unwind label %66, !dbg !291

; <label>:73                                      ; preds = %71
  %74 = invoke i32 @f_write(%struct.FIL* @_ZL3fil, i8* getelementptr inbounds ([10485760 x i8]* @SourceAddress, i32 0, i32 0), i32 %72, i32* %NumBytesWritten)
          to label %75 unwind label %66, !dbg !292

; <label>:75                                      ; preds = %73
  store i32 %74, i32* %Res, align 4, !dbg !294
  %76 = load i32* %Res, align 4, !dbg !296
  %77 = icmp ne i32 %76, 0, !dbg !296
  br i1 %77, label %78, label %79, !dbg !296

; <label>:78                                      ; preds = %75
  store i32 1, i32* %1, !dbg !298
  store i32 1, i32* %6
  br label %119, !dbg !298

; <label>:79                                      ; preds = %75
  %80 = invoke i32 @f_lseek(%struct.FIL* @_ZL3fil, i32 0)
          to label %81 unwind label %66, !dbg !300

; <label>:81                                      ; preds = %79
  store i32 %80, i32* %Res, align 4, !dbg !301
  %82 = load i32* %Res, align 4, !dbg !303
  %83 = icmp ne i32 %82, 0, !dbg !303
  br i1 %83, label %84, label %85, !dbg !303

; <label>:84                                      ; preds = %81
  store i32 1, i32* %1, !dbg !305
  store i32 1, i32* %6
  br label %119, !dbg !305

; <label>:85                                      ; preds = %81
  %86 = invoke i32 @_ZNKSs4sizeEv(%"class.std::basic_string"* %hola)
          to label %87 unwind label %66, !dbg !307

; <label>:87                                      ; preds = %85
  %88 = invoke i32 @f_read(%struct.FIL* @_ZL3fil, i8* getelementptr inbounds ([256 x i8]* @Component, i32 0, i32 0), i32 %86, i32* %NumBytesWritten)
          to label %89 unwind label %66, !dbg !308

; <label>:89                                      ; preds = %87
  store i32 %88, i32* %Res, align 4, !dbg !310
  %90 = load i32* %Res, align 4, !dbg !312
  %91 = icmp ne i32 %90, 0, !dbg !312
  br i1 %91, label %92, label %93, !dbg !312

; <label>:92                                      ; preds = %89
  store i32 1, i32* %1, !dbg !314
  store i32 1, i32* %6
  br label %119, !dbg !314

; <label>:93                                      ; preds = %89
  store i32 0, i32* %BuffCnt, align 4, !dbg !316
  br label %94, !dbg !316

; <label>:94                                      ; preds = %105, %93
  %95 = load i32* %BuffCnt, align 4, !dbg !318
  %96 = invoke i32 @_ZNKSs4sizeEv(%"class.std::basic_string"* %hola)
          to label %97 unwind label %66, !dbg !321

; <label>:97                                      ; preds = %94
  %98 = icmp ult i32 %95, %96, !dbg !322
  br i1 %98, label %99, label %108, !dbg !322

; <label>:99                                      ; preds = %97
  %100 = load i32* %BuffCnt, align 4, !dbg !324
  %101 = getelementptr inbounds [256 x i8]* @Component, i32 0, i32 %100, !dbg !324
  %102 = load i8* %101, align 1, !dbg !324
  %103 = load i32* %BuffCnt, align 4, !dbg !324
  %104 = getelementptr inbounds i8* %45, i32 %103, !dbg !324
  store i8 %102, i8* %104, align 1, !dbg !324
  br label %105, !dbg !326

; <label>:105                                     ; preds = %99
  %106 = load i32* %BuffCnt, align 4, !dbg !327
  %107 = add i32 %106, 1, !dbg !327
  store i32 %107, i32* %BuffCnt, align 4, !dbg !327
  br label %94, !dbg !327

; <label>:108                                     ; preds = %97
  %109 = load i32* %BuffCnt, align 4, !dbg !328
  %110 = getelementptr inbounds i8* %45, i32 %109, !dbg !328
  store i8 0, i8* %110, align 1, !dbg !328
  invoke void (i8*, ...)* @xil_printf(i8* getelementptr inbounds ([12 x i8]* @.str5, i32 0, i32 0))
          to label %111 unwind label %66, !dbg !329

; <label>:111                                     ; preds = %108
  invoke void (i8*, ...)* @xil_printf(i8* %45)
          to label %112 unwind label %66, !dbg !330

; <label>:112                                     ; preds = %111
  %113 = invoke i32 @f_close(%struct.FIL* @_ZL3fil)
          to label %114 unwind label %66, !dbg !331

; <label>:114                                     ; preds = %112
  store i32 %113, i32* %Res, align 4, !dbg !332
  %115 = load i32* %Res, align 4, !dbg !334
  %116 = icmp ne i32 %115, 0, !dbg !334
  br i1 %116, label %117, label %118, !dbg !334

; <label>:117                                     ; preds = %114
  store i32 1, i32* %1, !dbg !336
  store i32 1, i32* %6
  br label %119, !dbg !336

; <label>:118                                     ; preds = %114
  store i32 0, i32* %1, !dbg !338
  store i32 1, i32* %6
  br label %119, !dbg !338

; <label>:119                                     ; preds = %118, %117, %92, %84, %78
  %120 = load i8** %5, !dbg !290
  call void @llvm.stackrestore(i8* %120), !dbg !290
  %121 = call %"class.std::basic_string"* @_ZNSsD1Ev(%"class.std::basic_string"* %hola), !dbg !290
  br label %123

; <label>:122                                     ; preds = %66
  br label %125, !dbg !339

; <label>:123                                     ; preds = %119, %36, %30
  %124 = load i32* %1, !dbg !290
  ret i32 %124, !dbg !290

; <label>:125                                     ; preds = %122, %61
  %126 = load i8** %3, !dbg !341
  %127 = load i32* %4, !dbg !341
  %128 = insertvalue { i8*, i32 } undef, i8* %126, 0, !dbg !341
  %129 = insertvalue { i8*, i32 } %128, i32 %127, 1, !dbg !341
  resume { i8*, i32 } %129, !dbg !341

; <label>:130                                     ; preds = %66
  %131 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null, !dbg !344
  %132 = extractvalue { i8*, i32 } %131, 0, !dbg !344
  call void @__clang_call_terminate(i8* %132) #5, !dbg !344
  unreachable, !dbg !344
}

declare i32 @XGetPlatform_Info() #0

declare i32 @f_mount(%struct.FATFS*, i8*, i8 zeroext) #0

declare i32 @f_open(%struct.FIL*, i8*, i8 zeroext) #0

; Function Attrs: nounwind
declare %"class.std::allocator"* @_ZNSaIcEC1Ev(%"class.std::allocator"* returned) #2

declare %"class.std::basic_string"* @_ZNSsC1EPKcRKSaIcE(%"class.std::basic_string"* returned, i8*, %"class.std::allocator"* dereferenceable(1)) #0

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare %"class.std::allocator"* @_ZNSaIcED1Ev(%"class.std::allocator"* returned) #2

declare i32 @_ZNKSs4sizeEv(%"class.std::basic_string"*) #0

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

declare dereferenceable(1) i8* @_ZNSsixEj(%"class.std::basic_string"*, i32) #0

declare i32 @f_write(%struct.FIL*, i8*, i32, i32*) #0

declare i32 @f_lseek(%struct.FIL*, i32) #0

declare i32 @f_read(%struct.FIL*, i8*, i32, i32*) #0

declare i32 @f_close(%struct.FIL*) #0

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

declare %"class.std::basic_string"* @_ZNSsD1Ev(%"class.std::basic_string"* returned) #0

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #4 {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #3
  call void @_ZSt9terminatev() #5
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline noreturn nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!xidane.fname = !{!150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181}
!xidane.function_declaration_type = !{!150, !182, !152, !183, !154, !182, !156, !184, !158, !185, !160, !186, !162, !187, !164, !188, !166, !187, !168, !189, !170, !190, !172, !191, !174, !192, !176, !193, !178, !194, !180, !187}
!xidane.function_declaration_filename = !{!150, !195, !152, !196, !154, !195, !156, !197, !158, !198, !160, !198, !162, !199, !164, !200, !166, !199, !168, !200, !170, !200, !172, !198, !174, !198, !176, !198, !178, !198, !180, !200}
!xidane.ExternC = !{!152, !156, !158, !160, !172, !174, !176, !178}
!llvm.module.flags = !{!201, !202, !203, !204}
!llvm.ident = !{!205}

!0 = metadata !{i32 786449, metadata !1, i32 4, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !26, metadata !95, metadata !103, metadata !133, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [G:\pruebaSD\SDDebug/../src\main.cpp] [DW_LANG_C_plus_plus]
!1 = metadata !{metadata !"../src\5Cmain.cpp", metadata !"G:\5CpruebaSD\5CSDDebug"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !4, null, metadata !"", i32 193, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, null, null, metadata !"_ZTS7FRESULT"} ; [ DW_TAG_enumeration_type ] [line 193, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !"G:/zybo_hdmi_in/arm-xilinx-eabi/include\5Cff.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25}
!6 = metadata !{i32 786472, metadata !"FR_OK", i64 0} ; [ DW_TAG_enumerator ] [FR_OK :: 0]
!7 = metadata !{i32 786472, metadata !"FR_DISK_ERR", i64 1} ; [ DW_TAG_enumerator ] [FR_DISK_ERR :: 1]
!8 = metadata !{i32 786472, metadata !"FR_INT_ERR", i64 2} ; [ DW_TAG_enumerator ] [FR_INT_ERR :: 2]
!9 = metadata !{i32 786472, metadata !"FR_NOT_READY", i64 3} ; [ DW_TAG_enumerator ] [FR_NOT_READY :: 3]
!10 = metadata !{i32 786472, metadata !"FR_NO_FILE", i64 4} ; [ DW_TAG_enumerator ] [FR_NO_FILE :: 4]
!11 = metadata !{i32 786472, metadata !"FR_NO_PATH", i64 5} ; [ DW_TAG_enumerator ] [FR_NO_PATH :: 5]
!12 = metadata !{i32 786472, metadata !"FR_INVALID_NAME", i64 6} ; [ DW_TAG_enumerator ] [FR_INVALID_NAME :: 6]
!13 = metadata !{i32 786472, metadata !"FR_DENIED", i64 7} ; [ DW_TAG_enumerator ] [FR_DENIED :: 7]
!14 = metadata !{i32 786472, metadata !"FR_EXIST", i64 8} ; [ DW_TAG_enumerator ] [FR_EXIST :: 8]
!15 = metadata !{i32 786472, metadata !"FR_INVALID_OBJECT", i64 9} ; [ DW_TAG_enumerator ] [FR_INVALID_OBJECT :: 9]
!16 = metadata !{i32 786472, metadata !"FR_WRITE_PROTECTED", i64 10} ; [ DW_TAG_enumerator ] [FR_WRITE_PROTECTED :: 10]
!17 = metadata !{i32 786472, metadata !"FR_INVALID_DRIVE", i64 11} ; [ DW_TAG_enumerator ] [FR_INVALID_DRIVE :: 11]
!18 = metadata !{i32 786472, metadata !"FR_NOT_ENABLED", i64 12} ; [ DW_TAG_enumerator ] [FR_NOT_ENABLED :: 12]
!19 = metadata !{i32 786472, metadata !"FR_NO_FILESYSTEM", i64 13} ; [ DW_TAG_enumerator ] [FR_NO_FILESYSTEM :: 13]
!20 = metadata !{i32 786472, metadata !"FR_MKFS_ABORTED", i64 14} ; [ DW_TAG_enumerator ] [FR_MKFS_ABORTED :: 14]
!21 = metadata !{i32 786472, metadata !"FR_TIMEOUT", i64 15} ; [ DW_TAG_enumerator ] [FR_TIMEOUT :: 15]
!22 = metadata !{i32 786472, metadata !"FR_LOCKED", i64 16} ; [ DW_TAG_enumerator ] [FR_LOCKED :: 16]
!23 = metadata !{i32 786472, metadata !"FR_NOT_ENOUGH_CORE", i64 17} ; [ DW_TAG_enumerator ] [FR_NOT_ENOUGH_CORE :: 17]
!24 = metadata !{i32 786472, metadata !"FR_TOO_MANY_OPEN_FILES", i64 18} ; [ DW_TAG_enumerator ] [FR_TOO_MANY_OPEN_FILES :: 18]
!25 = metadata !{i32 786472, metadata !"FR_INVALID_PARAMETER", i64 19} ; [ DW_TAG_enumerator ] [FR_INVALID_PARAMETER :: 19]
!26 = metadata !{metadata !27, metadata !33, metadata !43, metadata !3, metadata !45, metadata !49, metadata !75}
!27 = metadata !{i32 786451, metadata !28, null, metadata !"", i32 71, i64 64, i64 32, i32 0, i32 0, null, metadata !29, i32 0, null, null, metadata !"_ZTS10_mbstate_t"} ; [ DW_TAG_structure_type ] [line 71, size 64, align 32, offset 0] [def] [from ]
!28 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include\5Csys/_types.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!29 = metadata !{metadata !30, metadata !32}
!30 = metadata !{i32 786445, metadata !28, metadata !"_ZTS10_mbstate_t", metadata !"__count", i32 73, i64 32, i64 32, i64 0, i32 0, metadata !31} ; [ DW_TAG_member ] [__count] [line 73, size 32, align 32, offset 0] [from int]
!31 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!32 = metadata !{i32 786445, metadata !28, metadata !"_ZTS10_mbstate_t", metadata !"__value", i32 78, i64 32, i64 32, i64 32, i32 0, metadata !"_ZTSN10_mbstate_tUt_E"} ; [ DW_TAG_member ] [__value] [line 78, size 32, align 32, offset 32] [from _ZTSN10_mbstate_tUt_E]
!33 = metadata !{i32 786455, metadata !28, metadata !"_ZTS10_mbstate_t", metadata !"", i32 74, i64 32, i64 32, i64 0, i32 0, null, metadata !34, i32 0, null, null, metadata !"_ZTSN10_mbstate_tUt_E"} ; [ DW_TAG_union_type ] [line 74, size 32, align 32, offset 0] [def] [from ]
!34 = metadata !{metadata !35, metadata !38}
!35 = metadata !{i32 786445, metadata !28, metadata !"_ZTSN10_mbstate_tUt_E", metadata !"__wch", i32 76, i64 32, i64 32, i64 0, i32 0, metadata !36} ; [ DW_TAG_member ] [__wch] [line 76, size 32, align 32, offset 0] [from wint_t]
!36 = metadata !{i32 786454, metadata !37, null, metadata !"wint_t", i32 353, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ] [wint_t] [line 353, size 0, align 0, offset 0] [from int]
!37 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/lib/gcc/arm-none-eabi/4.9.2/include\5Cstddef.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!38 = metadata !{i32 786445, metadata !28, metadata !"_ZTSN10_mbstate_tUt_E", metadata !"__wchb", i32 77, i64 32, i64 8, i64 0, i32 0, metadata !39} ; [ DW_TAG_member ] [__wchb] [line 77, size 32, align 8, offset 0] [from ]
!39 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32, i64 8, i32 0, i32 0, metadata !40, metadata !41, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from unsigned char]
!40 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!43 = metadata !{i32 786451, metadata !44, null, metadata !"lconv", i32 25, i64 0, i64 0, i32 0, i32 4, null, null, i32 0, null, null, metadata !"_ZTS5lconv"} ; [ DW_TAG_structure_type ] [lconv] [line 25, size 0, align 0, offset 0] [decl] [from ]
!44 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include\5Clocale.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!45 = metadata !{i32 786434, metadata !46, metadata !47, metadata !"basic_string<char, std::char_traits<char>, std::allocator<char> >", i32 1132, i64 0, i64 0, i32 0, i32 4, null, null, i32 0, null, null, metadata !"_ZTSSs"} ; [ DW_TAG_class_type ] [basic_string<char, std::char_traits<char>, std::allocator<char> >] [line 1132, size 0, align 0, offset 0] [decl] [from ]
!46 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include/c++/4.9.2\5Cbits/basic_string.tcc", metadata !"G:\5CpruebaSD\5CSDDebug"}
!47 = metadata !{i32 786489, metadata !48, null, metadata !"std", i32 186} ; [ DW_TAG_namespace ] [std] [line 186]
!48 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include/c++/4.9.2/arm-none-eabi\5Cbits/c++config.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!49 = metadata !{i32 786451, metadata !4, null, metadata !"", i32 120, i64 4608, i64 256, i32 0, i32 0, null, metadata !50, i32 0, null, null, metadata !"_ZTS3FIL"} ; [ DW_TAG_structure_type ] [line 120, size 4608, align 256, offset 0] [def] [from ]
!50 = metadata !{metadata !51, metadata !54, metadata !58, metadata !60, metadata !61, metadata !64, metadata !65, metadata !66, metadata !67, metadata !68, metadata !69, metadata !71}
!51 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"fs", i32 121, i64 32, i64 32, i64 0, i32 0, metadata !52} ; [ DW_TAG_member ] [fs] [line 121, size 32, align 32, offset 0] [from ]
!52 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !53} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from FATFS]
!53 = metadata !{i32 786454, metadata !4, null, metadata !"FATFS", i32 114, i64 0, i64 0, i64 0, i32 0, metadata !"_ZTS5FATFS"} ; [ DW_TAG_typedef ] [FATFS] [line 114, size 0, align 0, offset 0] [from _ZTS5FATFS]
!54 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"id", i32 122, i64 16, i64 16, i64 32, i32 0, metadata !55} ; [ DW_TAG_member ] [id] [line 122, size 16, align 16, offset 32] [from WORD]
!55 = metadata !{i32 786454, metadata !56, null, metadata !"WORD", i32 20, i64 0, i64 0, i64 0, i32 0, metadata !57} ; [ DW_TAG_typedef ] [WORD] [line 20, size 0, align 0, offset 0] [from unsigned short]
!56 = metadata !{metadata !"G:/zybo_hdmi_in/arm-xilinx-eabi/include/integer.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!57 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!58 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"flag", i32 123, i64 8, i64 8, i64 48, i32 0, metadata !59} ; [ DW_TAG_member ] [flag] [line 123, size 8, align 8, offset 48] [from BYTE]
!59 = metadata !{i32 786454, metadata !56, null, metadata !"BYTE", i32 16, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_typedef ] [BYTE] [line 16, size 0, align 0, offset 0] [from unsigned char]
!60 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"err", i32 124, i64 8, i64 8, i64 56, i32 0, metadata !59} ; [ DW_TAG_member ] [err] [line 124, size 8, align 8, offset 56] [from BYTE]
!61 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"fptr", i32 125, i64 32, i64 32, i64 64, i32 0, metadata !62} ; [ DW_TAG_member ] [fptr] [line 125, size 32, align 32, offset 64] [from DWORD]
!62 = metadata !{i32 786454, metadata !56, null, metadata !"DWORD", i32 29, i64 0, i64 0, i64 0, i32 0, metadata !63} ; [ DW_TAG_typedef ] [DWORD] [line 29, size 0, align 0, offset 0] [from unsigned int]
!63 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!64 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"fsize", i32 126, i64 32, i64 32, i64 96, i32 0, metadata !62} ; [ DW_TAG_member ] [fsize] [line 126, size 32, align 32, offset 96] [from DWORD]
!65 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"sclust", i32 127, i64 32, i64 32, i64 128, i32 0, metadata !62} ; [ DW_TAG_member ] [sclust] [line 127, size 32, align 32, offset 128] [from DWORD]
!66 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"clust", i32 128, i64 32, i64 32, i64 160, i32 0, metadata !62} ; [ DW_TAG_member ] [clust] [line 128, size 32, align 32, offset 160] [from DWORD]
!67 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"dsect", i32 129, i64 32, i64 32, i64 192, i32 0, metadata !62} ; [ DW_TAG_member ] [dsect] [line 129, size 32, align 32, offset 192] [from DWORD]
!68 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"dir_sect", i32 131, i64 32, i64 32, i64 224, i32 0, metadata !62} ; [ DW_TAG_member ] [dir_sect] [line 131, size 32, align 32, offset 224] [from DWORD]
!69 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"dir_ptr", i32 132, i64 32, i64 32, i64 256, i32 0, metadata !70} ; [ DW_TAG_member ] [dir_ptr] [line 132, size 32, align 32, offset 256] [from ]
!70 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from BYTE]
!71 = metadata !{i32 786445, metadata !4, metadata !"_ZTS3FIL", metadata !"buf", i32 146, i64 4096, i64 8, i64 512, i32 0, metadata !72} ; [ DW_TAG_member ] [buf] [line 146, size 4096, align 8, offset 512] [from ]
!72 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 4096, i64 8, i32 0, i32 0, metadata !59, metadata !73, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 4096, align 8, offset 0] [from BYTE]
!73 = metadata !{metadata !74}
!74 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!75 = metadata !{i32 786451, metadata !4, null, metadata !"", i32 78, i64 4608, i64 256, i32 0, i32 0, null, metadata !76, i32 0, null, null, metadata !"_ZTS5FATFS"} ; [ DW_TAG_structure_type ] [line 78, size 4608, align 256, offset 0] [def] [from ]
!76 = metadata !{metadata !77, metadata !78, metadata !79, metadata !80, metadata !81, metadata !82, metadata !83, metadata !84, metadata !85, metadata !86, metadata !87, metadata !88, metadata !89, metadata !90, metadata !91, metadata !92, metadata !93, metadata !94}
!77 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"fs_type", i32 79, i64 8, i64 8, i64 0, i32 0, metadata !59} ; [ DW_TAG_member ] [fs_type] [line 79, size 8, align 8, offset 0] [from BYTE]
!78 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"drv", i32 80, i64 8, i64 8, i64 8, i32 0, metadata !59} ; [ DW_TAG_member ] [drv] [line 80, size 8, align 8, offset 8] [from BYTE]
!79 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"csize", i32 81, i64 8, i64 8, i64 16, i32 0, metadata !59} ; [ DW_TAG_member ] [csize] [line 81, size 8, align 8, offset 16] [from BYTE]
!80 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"n_fats", i32 82, i64 8, i64 8, i64 24, i32 0, metadata !59} ; [ DW_TAG_member ] [n_fats] [line 82, size 8, align 8, offset 24] [from BYTE]
!81 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"wflag", i32 83, i64 8, i64 8, i64 32, i32 0, metadata !59} ; [ DW_TAG_member ] [wflag] [line 83, size 8, align 8, offset 32] [from BYTE]
!82 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"fsi_flag", i32 84, i64 8, i64 8, i64 40, i32 0, metadata !59} ; [ DW_TAG_member ] [fsi_flag] [line 84, size 8, align 8, offset 40] [from BYTE]
!83 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"id", i32 85, i64 16, i64 16, i64 48, i32 0, metadata !55} ; [ DW_TAG_member ] [id] [line 85, size 16, align 16, offset 48] [from WORD]
!84 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"n_rootdir", i32 86, i64 16, i64 16, i64 64, i32 0, metadata !55} ; [ DW_TAG_member ] [n_rootdir] [line 86, size 16, align 16, offset 64] [from WORD]
!85 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"last_clust", i32 94, i64 32, i64 32, i64 96, i32 0, metadata !62} ; [ DW_TAG_member ] [last_clust] [line 94, size 32, align 32, offset 96] [from DWORD]
!86 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"free_clust", i32 95, i64 32, i64 32, i64 128, i32 0, metadata !62} ; [ DW_TAG_member ] [free_clust] [line 95, size 32, align 32, offset 128] [from DWORD]
!87 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"n_fatent", i32 100, i64 32, i64 32, i64 160, i32 0, metadata !62} ; [ DW_TAG_member ] [n_fatent] [line 100, size 32, align 32, offset 160] [from DWORD]
!88 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"fsize", i32 101, i64 32, i64 32, i64 192, i32 0, metadata !62} ; [ DW_TAG_member ] [fsize] [line 101, size 32, align 32, offset 192] [from DWORD]
!89 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"volbase", i32 102, i64 32, i64 32, i64 224, i32 0, metadata !62} ; [ DW_TAG_member ] [volbase] [line 102, size 32, align 32, offset 224] [from DWORD]
!90 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"fatbase", i32 103, i64 32, i64 32, i64 256, i32 0, metadata !62} ; [ DW_TAG_member ] [fatbase] [line 103, size 32, align 32, offset 256] [from DWORD]
!91 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"dirbase", i32 104, i64 32, i64 32, i64 288, i32 0, metadata !62} ; [ DW_TAG_member ] [dirbase] [line 104, size 32, align 32, offset 288] [from DWORD]
!92 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"database", i32 105, i64 32, i64 32, i64 320, i32 0, metadata !62} ; [ DW_TAG_member ] [database] [line 105, size 32, align 32, offset 320] [from DWORD]
!93 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"winsect", i32 106, i64 32, i64 32, i64 352, i32 0, metadata !62} ; [ DW_TAG_member ] [winsect] [line 106, size 32, align 32, offset 352] [from DWORD]
!94 = metadata !{i32 786445, metadata !4, metadata !"_ZTS5FATFS", metadata !"win", i32 112, i64 4096, i64 8, i64 512, i32 0, metadata !72} ; [ DW_TAG_member ] [win] [line 112, size 4096, align 8, offset 512] [from ]
!95 = metadata !{metadata !96, metadata !102}
!96 = metadata !{i32 786478, metadata !97, metadata !98, metadata !"main", metadata !"main", metadata !"", i32 125, metadata !99, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !101, i32 126} ; [ DW_TAG_subprogram ] [line 125] [def] [scope 126] [main]
!97 = metadata !{metadata !"G:/pruebaSD/src/main.cpp", metadata !"G:\5CpruebaSD\5CSDDebug"}
!98 = metadata !{i32 786473, metadata !97}        ; [ DW_TAG_file_type ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!99 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !100, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!100 = metadata !{metadata !31}
!101 = metadata !{}
!102 = metadata !{i32 786478, metadata !97, metadata !98, metadata !"FfsSdPolledExample", metadata !"FfsSdPolledExample", metadata !"_Z18FfsSdPolledExamplev", i32 158, metadata !99, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @_Z18FfsSdPolledExamplev, null, null, metadata !101, i32 159} ; [ DW_TAG_subprogram ] [line 158] [def] [scope 159] [FfsSdPolledExample]
!103 = metadata !{metadata !104, metadata !111, metadata !118, metadata !119, metadata !123, metadata !125, metadata !128, metadata !132}
!104 = metadata !{i32 786484, i32 0, null, metadata !"Platform", metadata !"Platform", metadata !"", metadata !98, i32 98, metadata !105, i32 0, i32 1, i32* @Platform, null} ; [ DW_TAG_variable ] [Platform] [line 98] [def]
!105 = metadata !{i32 786454, metadata !106, null, metadata !"u32", i32 88, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_typedef ] [u32] [line 88, size 0, align 0, offset 0] [from uint32_t]
!106 = metadata !{metadata !"G:/zybo_hdmi_in/arm-xilinx-eabi/include/xil_types.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!107 = metadata !{i32 786454, metadata !108, null, metadata !"uint32_t", i32 66, i64 0, i64 0, i64 0, i32 0, metadata !109} ; [ DW_TAG_typedef ] [uint32_t] [line 66, size 0, align 0, offset 0] [from __uint32_t]
!108 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include\5Cstdint.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!109 = metadata !{i32 786454, metadata !110, null, metadata !"__uint32_t", i32 65, i64 0, i64 0, i64 0, i32 0, metadata !63} ; [ DW_TAG_typedef ] [__uint32_t] [line 65, size 0, align 0, offset 0] [from unsigned int]
!110 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include\5Cmachine/_default_types.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!111 = metadata !{i32 786484, i32 0, null, metadata !"DestinationAddress", metadata !"DestinationAddress", metadata !"", metadata !98, i32 106, metadata !112, i32 0, i32 1, [10485760 x i8]* @DestinationAddress, null} ; [ DW_TAG_variable ] [DestinationAddress] [line 106] [def]
!112 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 83886080, i64 8, i32 0, i32 0, metadata !113, metadata !116, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 83886080, align 8, offset 0] [from u8]
!113 = metadata !{i32 786454, metadata !106, null, metadata !"u8", i32 86, i64 0, i64 0, i64 0, i32 0, metadata !114} ; [ DW_TAG_typedef ] [u8] [line 86, size 0, align 0, offset 0] [from uint8_t]
!114 = metadata !{i32 786454, metadata !108, null, metadata !"uint8_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !115} ; [ DW_TAG_typedef ] [uint8_t] [line 42, size 0, align 0, offset 0] [from __uint8_t]
!115 = metadata !{i32 786454, metadata !110, null, metadata !"__uint8_t", i32 29, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_typedef ] [__uint8_t] [line 29, size 0, align 0, offset 0] [from unsigned char]
!116 = metadata !{metadata !117}
!117 = metadata !{i32 786465, i64 0, i64 10485760} ; [ DW_TAG_subrange_type ] [0, 10485759]
!118 = metadata !{i32 786484, i32 0, null, metadata !"SourceAddress", metadata !"SourceAddress", metadata !"", metadata !98, i32 107, metadata !112, i32 0, i32 1, [10485760 x i8]* @SourceAddress, null} ; [ DW_TAG_variable ] [SourceAddress] [line 107] [def]
!119 = metadata !{i32 786484, i32 0, null, metadata !"Component", metadata !"Component", metadata !"", metadata !98, i32 108, metadata !120, i32 0, i32 1, [256 x i8]* @Component, null} ; [ DW_TAG_variable ] [Component] [line 108] [def]
!120 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !113, metadata !121, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from u8]
!121 = metadata !{metadata !122}
!122 = metadata !{i32 786465, i64 0, i64 256}     ; [ DW_TAG_subrange_type ] [0, 255]
!123 = metadata !{i32 786484, i32 0, null, metadata !"fil", metadata !"fil", metadata !"_ZL3fil", metadata !98, i32 90, metadata !124, i32 1, i32 1, %struct.FIL* @_ZL3fil, null} ; [ DW_TAG_variable ] [fil] [line 90] [local] [def]
!124 = metadata !{i32 786454, metadata !4, null, metadata !"FIL", i32 149, i64 0, i64 0, i64 0, i32 0, metadata !"_ZTS3FIL"} ; [ DW_TAG_typedef ] [FIL] [line 149, size 0, align 0, offset 0] [from _ZTS3FIL]
!125 = metadata !{i32 786484, i32 0, null, metadata !"SD_File", metadata !"SD_File", metadata !"_ZL7SD_File", metadata !98, i32 97, metadata !126, i32 1, i32 1, i8** @_ZL7SD_File, null} ; [ DW_TAG_variable ] [SD_File] [line 97] [local] [def]
!126 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !127} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from char]
!127 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!128 = metadata !{i32 786484, i32 0, null, metadata !"FileName", metadata !"FileName", metadata !"_ZL8FileName", metadata !98, i32 96, metadata !129, i32 1, i32 1, [32 x i8]* @_ZL8FileName, null} ; [ DW_TAG_variable ] [FileName] [line 96] [local] [def]
!129 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 8, i32 0, i32 0, metadata !127, metadata !130, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 8, offset 0] [from char]
!130 = metadata !{metadata !131}
!131 = metadata !{i32 786465, i64 0, i64 32}      ; [ DW_TAG_subrange_type ] [0, 31]
!132 = metadata !{i32 786484, i32 0, null, metadata !"fatfs", metadata !"fatfs", metadata !"_ZL5fatfs", metadata !98, i32 91, metadata !53, i32 1, i32 1, %struct.FATFS* @_ZL5fatfs, null} ; [ DW_TAG_variable ] [fatfs] [line 91] [local] [def]
!133 = metadata !{metadata !134, metadata !138, metadata !142, metadata !143, metadata !147, metadata !149}
!134 = metadata !{i32 786490, metadata !135, metadata !137, i32 56} ; [ DW_TAG_imported_module ]
!135 = metadata !{i32 786489, metadata !136, null, metadata !"__gnu_debug", i32 54} ; [ DW_TAG_namespace ] [__gnu_debug] [line 54]
!136 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include/c++/4.9.2\5Cdebug/debug.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!137 = metadata !{i32 786489, metadata !136, metadata !47, metadata !"__debug", i32 48} ; [ DW_TAG_namespace ] [__debug] [line 48]
!138 = metadata !{i32 786440, metadata !47, metadata !139, i32 64} ; [ DW_TAG_imported_declaration ]
!139 = metadata !{i32 786454, metadata !140, null, metadata !"mbstate_t", i32 60, i64 0, i64 0, i64 0, i32 0, metadata !141} ; [ DW_TAG_typedef ] [mbstate_t] [line 60, size 0, align 0, offset 0] [from _mbstate_t]
!140 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include\5Cwchar.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!141 = metadata !{i32 786454, metadata !28, null, metadata !"_mbstate_t", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !"_ZTS10_mbstate_t"} ; [ DW_TAG_typedef ] [_mbstate_t] [line 79, size 0, align 0, offset 0] [from _ZTS10_mbstate_t]
!142 = metadata !{i32 786440, metadata !47, metadata !36, i32 139} ; [ DW_TAG_imported_declaration ]
!143 = metadata !{i32 786440, metadata !144, metadata !146, i32 44} ; [ DW_TAG_imported_declaration ]
!144 = metadata !{i32 786489, metadata !145, null, metadata !"__gnu_cxx", i32 68} ; [ DW_TAG_namespace ] [__gnu_cxx] [line 68]
!145 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include/c++/4.9.2\5Cbits/cpp_type_traits.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!146 = metadata !{i32 786454, metadata !48, metadata !47, metadata !"size_t", i32 188, i64 0, i64 0, i64 0, i32 0, metadata !63} ; [ DW_TAG_typedef ] [size_t] [line 188, size 0, align 0, offset 0] [from unsigned int]
!147 = metadata !{i32 786440, metadata !144, metadata !148, i32 45} ; [ DW_TAG_imported_declaration ]
!148 = metadata !{i32 786454, metadata !48, metadata !47, metadata !"ptrdiff_t", i32 189, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ] [ptrdiff_t] [line 189, size 0, align 0, offset 0] [from int]
!149 = metadata !{i32 786440, metadata !47, metadata !"_ZTS5lconv", i32 53} ; [ DW_TAG_imported_declaration ]
!150 = metadata !{i32 ()* @main}
!151 = metadata !{metadata !"main"}
!152 = metadata !{void (i8*, ...)* @xil_printf}
!153 = metadata !{metadata !"xil_printf"}
!154 = metadata !{i32 ()* @_Z18FfsSdPolledExamplev}
!155 = metadata !{metadata !"FfsSdPolledExample"}
!156 = metadata !{i32 ()* @XGetPlatform_Info}
!157 = metadata !{metadata !"XGetPlatform_Info"}
!158 = metadata !{i32 (%struct.FATFS*, i8*, i8)* @f_mount}
!159 = metadata !{metadata !"f_mount"}
!160 = metadata !{i32 (%struct.FIL*, i8*, i8)* @f_open}
!161 = metadata !{metadata !"f_open"}
!162 = metadata !{%"class.std::allocator"* (%"class.std::allocator"*)* @_ZNSaIcEC1Ev}
!163 = metadata !{metadata !"allocator"}
!164 = metadata !{%"class.std::basic_string"* (%"class.std::basic_string"*, i8*, %"class.std::allocator"*)* @_ZNSsC1EPKcRKSaIcE}
!165 = metadata !{metadata !"basic_string"}
!166 = metadata !{%"class.std::allocator"* (%"class.std::allocator"*)* @_ZNSaIcED1Ev}
!167 = metadata !{metadata !"~allocator"}
!168 = metadata !{i32 (%"class.std::basic_string"*)* @_ZNKSs4sizeEv}
!169 = metadata !{metadata !"size"}
!170 = metadata !{i8* (%"class.std::basic_string"*, i32)* @_ZNSsixEj}
!171 = metadata !{metadata !"operator[]"}
!172 = metadata !{i32 (%struct.FIL*, i8*, i32, i32*)* @f_write}
!173 = metadata !{metadata !"f_write"}
!174 = metadata !{i32 (%struct.FIL*, i32)* @f_lseek}
!175 = metadata !{metadata !"f_lseek"}
!176 = metadata !{i32 (%struct.FIL*, i8*, i32, i32*)* @f_read}
!177 = metadata !{metadata !"f_read"}
!178 = metadata !{i32 (%struct.FIL*)* @f_close}
!179 = metadata !{metadata !"f_close"}
!180 = metadata !{%"class.std::basic_string"* (%"class.std::basic_string"*)* @_ZNSsD1Ev}
!181 = metadata !{metadata !"~basic_string"}
!182 = metadata !{metadata !"int."}
!183 = metadata !{metadata !"void.const char8 *.1"}
!184 = metadata !{metadata !"u32."}
!185 = metadata !{metadata !"FRESULT.FATFS *.1.const TCHAR *.1.BYTE.0"}
!186 = metadata !{metadata !"FRESULT.FIL *.1.const TCHAR *.1.BYTE.0"}
!187 = metadata !{metadata !"void."}
!188 = metadata !{metadata !"void.const char *.1.const class std::allocator<char> &.0"}
!189 = metadata !{metadata !"size_type."}
!190 = metadata !{metadata !"reference.size_type.0"}
!191 = metadata !{metadata !"FRESULT.FIL *.1.const void *.1.UINT.0.UINT *.1"}
!192 = metadata !{metadata !"FRESULT.FIL *.1.DWORD.0"}
!193 = metadata !{metadata !"FRESULT.FIL *.1.void *.1.UINT.0.UINT *.1"}
!194 = metadata !{metadata !"FRESULT.FIL *.1"}
!195 = metadata !{metadata !"G:/pruebaSD/src/main.cpp"}
!196 = metadata !{metadata !"G:/zybo_hdmi_in/arm-xilinx-eabi/include/xil_printf.h"}
!197 = metadata !{metadata !"G:/zybo_hdmi_in/arm-xilinx-eabi/include\5Cxplatform_info.h"}
!198 = metadata !{metadata !"G:/zybo_hdmi_in/arm-xilinx-eabi/include\5Cff.h"}
!199 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include/c++/4.9.2\5Cbits/allocator.h"}
!200 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include/c++/4.9.2\5Cbits/basic_string.h"}
!201 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!202 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!203 = metadata !{i32 1, metadata !"wchar_size", i32 4}
!204 = metadata !{i32 1, metadata !"min_enum_size", i32 4}
!205 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!206 = metadata !{i32 786688, metadata !96, metadata !"Status", metadata !98, i32 127, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Status] [line 127]
!207 = metadata !{i32 127, i32 6, metadata !96, null}
!208 = metadata !{i32 129, i32 2, metadata !96, null}
!209 = metadata !{i32 131, i32 11, metadata !96, null}
!210 = metadata !{i32 132, i32 6, metadata !211, null}
!211 = metadata !{i32 786443, metadata !97, metadata !96, i32 132, i32 6, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!212 = metadata !{i32 133, i32 3, metadata !213, null}
!213 = metadata !{i32 786443, metadata !97, metadata !211, i32 132, i32 29, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!214 = metadata !{i32 134, i32 3, metadata !213, null}
!215 = metadata !{i32 137, i32 2, metadata !96, null}
!216 = metadata !{i32 139, i32 2, metadata !96, null}
!217 = metadata !{i32 141, i32 1, metadata !96, null}
!218 = metadata !{i32 786688, metadata !102, metadata !"Res", metadata !98, i32 160, metadata !219, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Res] [line 160]
!219 = metadata !{i32 786454, metadata !4, null, metadata !"FRESULT", i32 214, i64 0, i64 0, i64 0, i32 0, metadata !"_ZTS7FRESULT"} ; [ DW_TAG_typedef ] [FRESULT] [line 214, size 0, align 0, offset 0] [from _ZTS7FRESULT]
!220 = metadata !{i32 160, i32 10, metadata !102, null}
!221 = metadata !{i32 786688, metadata !102, metadata !"NumBytesRead", metadata !98, i32 161, metadata !222, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NumBytesRead] [line 161]
!222 = metadata !{i32 786454, metadata !56, null, metadata !"UINT", i32 25, i64 0, i64 0, i64 0, i32 0, metadata !63} ; [ DW_TAG_typedef ] [UINT] [line 25, size 0, align 0, offset 0] [from unsigned int]
!223 = metadata !{i32 161, i32 7, metadata !102, null}
!224 = metadata !{i32 786688, metadata !102, metadata !"NumBytesWritten", metadata !98, i32 162, metadata !222, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NumBytesWritten] [line 162]
!225 = metadata !{i32 162, i32 7, metadata !102, null}
!226 = metadata !{i32 786688, metadata !102, metadata !"BuffCnt", metadata !98, i32 163, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BuffCnt] [line 163]
!227 = metadata !{i32 163, i32 6, metadata !102, null}
!228 = metadata !{i32 786688, metadata !102, metadata !"FileSize", metadata !98, i32 164, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [FileSize] [line 164]
!229 = metadata !{i32 164, i32 6, metadata !102, null}
!230 = metadata !{i32 164, i32 2, metadata !102, null}
!231 = metadata !{i32 786688, metadata !102, metadata !"Path", metadata !98, i32 169, metadata !232, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Path] [line 169]
!232 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !233} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from TCHAR]
!233 = metadata !{i32 786454, metadata !4, null, metadata !"TCHAR", i32 67, i64 0, i64 0, i64 0, i32 0, metadata !127} ; [ DW_TAG_typedef ] [TCHAR] [line 67, size 0, align 0, offset 0] [from char]
!234 = metadata !{i32 169, i32 9, metadata !102, null}
!235 = metadata !{i32 169, i32 2, metadata !102, null}
!236 = metadata !{i32 171, i32 13, metadata !102, null}
!237 = metadata !{i32 172, i32 6, metadata !238, null}
!238 = metadata !{i32 786443, metadata !97, metadata !102, i32 172, i32 6, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!239 = metadata !{i32 177, i32 3, metadata !240, null}
!240 = metadata !{i32 786443, metadata !97, metadata !238, i32 172, i32 39, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!241 = metadata !{i32 178, i32 2, metadata !240, null}
!242 = metadata !{i32 180, i32 6, metadata !243, null}
!243 = metadata !{i32 786443, metadata !97, metadata !102, i32 180, i32 2, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!244 = metadata !{i32 180, i32 6, metadata !245, null}
!245 = metadata !{i32 786443, metadata !97, metadata !246, i32 180, i32 6, i32 2, i32 23} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!246 = metadata !{i32 786443, metadata !97, metadata !243, i32 180, i32 6, i32 1, i32 22} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!247 = metadata !{i32 181, i32 3, metadata !248, null}
!248 = metadata !{i32 786443, metadata !97, metadata !243, i32 180, i32 49, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!249 = metadata !{i32 182, i32 2, metadata !248, null}
!250 = metadata !{i32 180, i32 39, metadata !243, null}
!251 = metadata !{i32 187, i32 8, metadata !102, null}
!252 = metadata !{i32 189, i32 6, metadata !253, null}
!253 = metadata !{i32 786443, metadata !97, metadata !102, i32 189, i32 6, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!254 = metadata !{i32 190, i32 3, metadata !255, null}
!255 = metadata !{i32 786443, metadata !97, metadata !253, i32 189, i32 20, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!256 = metadata !{i32 208, i32 2, metadata !102, null}
!257 = metadata !{i32 210, i32 8, metadata !102, null}
!258 = metadata !{i32 211, i32 6, metadata !259, null}
!259 = metadata !{i32 786443, metadata !97, metadata !102, i32 211, i32 6, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!260 = metadata !{i32 212, i32 3, metadata !261, null}
!261 = metadata !{i32 786443, metadata !97, metadata !259, i32 211, i32 11, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!262 = metadata !{i32 786688, metadata !102, metadata !"hola", metadata !98, i32 260, metadata !263, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hola] [line 260]
!263 = metadata !{i32 786454, metadata !264, metadata !47, metadata !"string", i32 62, i64 0, i64 0, i64 0, i32 0, metadata !"_ZTSSs"} ; [ DW_TAG_typedef ] [string] [line 62, size 0, align 0, offset 0] [from _ZTSSs]
!264 = metadata !{metadata !"C:/Xilinx/SDSoC/2016.2/SDK/2016.2/gnu/aarch32/nt/gcc-arm-none-eabi/arm-none-eabi/include/c++/4.9.2\5Cbits/stringfwd.h", metadata !"G:\5CpruebaSD\5CSDDebug"}
!265 = metadata !{i32 260, i32 14, metadata !102, null}
!266 = metadata !{i32 260, i32 14, metadata !267, null}
!267 = metadata !{i32 786443, metadata !97, metadata !102, i32 260, i32 14, i32 1, i32 24} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!268 = metadata !{i32 261, i32 14, metadata !102, null}
!269 = metadata !{i32 261, i32 14, metadata !270, null}
!270 = metadata !{i32 786443, metadata !97, metadata !102, i32 261, i32 14, i32 1, i32 25} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!271 = metadata !{i32 786688, metadata !102, metadata !"salida", metadata !98, i32 261, metadata !272, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [salida] [line 261]
!272 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 0, i64 8, i32 0, i32 0, metadata !127, metadata !273, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 8, offset 0] [from char]
!273 = metadata !{metadata !274}
!274 = metadata !{i32 786465, i64 0, i64 -1}      ; [ DW_TAG_subrange_type ] [unbounded]
!275 = metadata !{i32 261, i32 7, metadata !102, null}
!276 = metadata !{i32 266, i32 6, metadata !277, null}
!277 = metadata !{i32 786443, metadata !97, metadata !102, i32 266, i32 2, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!278 = metadata !{i32 266, i32 6, metadata !279, null}
!279 = metadata !{i32 786443, metadata !97, metadata !280, i32 266, i32 6, i32 3, i32 29} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!280 = metadata !{i32 786443, metadata !97, metadata !277, i32 266, i32 6, i32 1, i32 26} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!281 = metadata !{i32 266, i32 29, metadata !277, null}
!282 = metadata !{i32 266, i32 29, metadata !283, null}
!283 = metadata !{i32 786443, metadata !97, metadata !277, i32 266, i32 29, i32 2, i32 27} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!284 = metadata !{i32 267, i32 29, metadata !285, null}
!285 = metadata !{i32 786443, metadata !97, metadata !277, i32 266, i32 52, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!286 = metadata !{i32 267, i32 29, metadata !287, null}
!287 = metadata !{i32 786443, metadata !97, metadata !285, i32 267, i32 29, i32 1, i32 28} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!288 = metadata !{i32 268, i32 3, metadata !285, null}
!289 = metadata !{i32 266, i32 42, metadata !277, null}
!290 = metadata !{i32 303, i32 1, metadata !102, null}
!291 = metadata !{i32 269, i32 50, metadata !102, null}
!292 = metadata !{i32 269, i32 8, metadata !293, null}
!293 = metadata !{i32 786443, metadata !97, metadata !102, i32 269, i32 8, i32 1, i32 33} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!294 = metadata !{i32 269, i32 8, metadata !295, null}
!295 = metadata !{i32 786443, metadata !97, metadata !102, i32 269, i32 8, i32 2, i32 34} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!296 = metadata !{i32 270, i32 7, metadata !297, null}
!297 = metadata !{i32 786443, metadata !97, metadata !102, i32 270, i32 7, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!298 = metadata !{i32 271, i32 4, metadata !299, null}
!299 = metadata !{i32 786443, metadata !97, metadata !297, i32 270, i32 12, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!300 = metadata !{i32 277, i32 9, metadata !102, null}
!301 = metadata !{i32 277, i32 9, metadata !302, null}
!302 = metadata !{i32 786443, metadata !97, metadata !102, i32 277, i32 9, i32 1, i32 35} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!303 = metadata !{i32 278, i32 7, metadata !304, null}
!304 = metadata !{i32 786443, metadata !97, metadata !102, i32 278, i32 7, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!305 = metadata !{i32 279, i32 4, metadata !306, null}
!306 = metadata !{i32 786443, metadata !97, metadata !304, i32 278, i32 12, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!307 = metadata !{i32 282, i32 40, metadata !102, null}
!308 = metadata !{i32 282, i32 8, metadata !309, null}
!309 = metadata !{i32 786443, metadata !97, metadata !102, i32 282, i32 8, i32 1, i32 36} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!310 = metadata !{i32 282, i32 8, metadata !311, null}
!311 = metadata !{i32 786443, metadata !97, metadata !102, i32 282, i32 8, i32 2, i32 37} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!312 = metadata !{i32 283, i32 7, metadata !313, null}
!313 = metadata !{i32 786443, metadata !97, metadata !102, i32 283, i32 7, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!314 = metadata !{i32 284, i32 6, metadata !315, null}
!315 = metadata !{i32 786443, metadata !97, metadata !313, i32 283, i32 12, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!316 = metadata !{i32 287, i32 7, metadata !317, null}
!317 = metadata !{i32 786443, metadata !97, metadata !102, i32 287, i32 3, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!318 = metadata !{i32 287, i32 7, metadata !319, null}
!319 = metadata !{i32 786443, metadata !97, metadata !320, i32 287, i32 7, i32 3, i32 40} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!320 = metadata !{i32 786443, metadata !97, metadata !317, i32 287, i32 7, i32 1, i32 38} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!321 = metadata !{i32 287, i32 30, metadata !317, null}
!322 = metadata !{i32 287, i32 30, metadata !323, null}
!323 = metadata !{i32 786443, metadata !97, metadata !317, i32 287, i32 30, i32 2, i32 39} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!324 = metadata !{i32 288, i32 5, metadata !325, null}
!325 = metadata !{i32 786443, metadata !97, metadata !317, i32 287, i32 53, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!326 = metadata !{i32 289, i32 4, metadata !325, null}
!327 = metadata !{i32 287, i32 43, metadata !317, null}
!328 = metadata !{i32 290, i32 3, metadata !102, null}
!329 = metadata !{i32 292, i32 3, metadata !102, null}
!330 = metadata !{i32 293, i32 3, metadata !102, null}
!331 = metadata !{i32 297, i32 8, metadata !102, null}
!332 = metadata !{i32 297, i32 8, metadata !333, null}
!333 = metadata !{i32 786443, metadata !97, metadata !102, i32 297, i32 8, i32 1, i32 41} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!334 = metadata !{i32 298, i32 6, metadata !335, null}
!335 = metadata !{i32 786443, metadata !97, metadata !102, i32 298, i32 6, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!336 = metadata !{i32 299, i32 3, metadata !337, null}
!337 = metadata !{i32 786443, metadata !97, metadata !335, i32 298, i32 11, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!338 = metadata !{i32 302, i32 2, metadata !102, null}
!339 = metadata !{i32 303, i32 1, metadata !340, null}
!340 = metadata !{i32 786443, metadata !97, metadata !102, i32 303, i32 1, i32 2, i32 31} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!341 = metadata !{i32 303, i32 1, metadata !342, null}
!342 = metadata !{i32 786443, metadata !97, metadata !343, i32 303, i32 1, i32 4, i32 42} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!343 = metadata !{i32 786443, metadata !97, metadata !102, i32 303, i32 1, i32 1, i32 30} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
!344 = metadata !{i32 303, i32 1, metadata !345, null}
!345 = metadata !{i32 786443, metadata !97, metadata !102, i32 303, i32 1, i32 3, i32 32} ; [ DW_TAG_lexical_block ] [G:\pruebaSD\SDDebug/G:/pruebaSD/src/main.cpp]
