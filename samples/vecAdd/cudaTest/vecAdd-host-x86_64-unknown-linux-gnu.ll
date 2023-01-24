; ModuleID = 'vecAdd-host-x86_64-unknown-linux-gnu.bc'
source_filename = "vecAdd.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

$_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_ = comdat any

$_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_ = comdat any

$_ZSt4ceilf = comdat any

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [18 x i8] c"final result: %f\0A\00", align 1
@0 = private unnamed_addr constant [17 x i8] c"_Z6vecAddPdS_S_i\00", align 1
@1 = private constant [4777 x i8] c"P\EDU\BA\01\00\10\00\98\12\00\00\00\00\00\00\02\00\01\01@\00\00\00\00\0F\00\00\00\00\00\00\00\00\00\00\00\00\00\00\07\00\01\00#\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\7FELF\02\01\013\07\00\00\00\00\00\00\00\02\00\BE\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\80\0C\00\00\00\00\00\00#\05#\00@\00\00\00\00\00@\00\0A\00\01\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00.text._Z6vecAddPdS_S_i\00.nv.info._Z6vecAddPdS_S_i\00.nv.shared._Z6vecAddPdS_S_i\00.nv.global\00.nv.constant0._Z6vecAddPdS_S_i\00.nv.rel.action\00\00.shstrtab\00.strtab\00.symtab\00.symtab_shndx\00.nv.info\00_Z6vecAddPdS_S_i\00.text._Z6vecAddPdS_S_i\00.nv.info._Z6vecAddPdS_S_i\00.nv.shared._Z6vecAddPdS_S_i\00.nv.global\00blockIdx\00blockDim\00threadIdx\00.nv.constant0._Z6vecAddPdS_S_i\00_param\00.nv.rel.action\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00C\00\00\00\03\00\08\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\90\00\00\00\03\00\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\9B\00\00\00\01\00\09\00\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\A4\00\00\00\01\00\09\00\02\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\AD\00\00\00\01\00\09\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\B7\00\00\00\03\00\07\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\DD\00\00\00\03\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\12\10\08\00\00\00\00\00\00\00\00\00\C0\06\00\00\00\00\00\00\04/\08\00\08\00\00\00\0C\00\00\00\04#\08\00\08\00\00\00\00\00\00\00\04\12\08\00\08\00\00\00 \00\00\00\04\11\08\00\08\00\00\00 \00\00\00\047\04\00s\00\00\00\04\0A\08\00\06\00\00\00@\01\1C\00\03\19\1C\00\04\17\0C\00\00\00\00\00\03\00\18\00\00\F0\11\00\04\17\0C\00\00\00\00\00\02\00\10\00\00\F0!\00\04\17\0C\00\00\00\00\00\01\00\08\00\00\F0!\00\04\17\0C\00\00\00\00\00\00\00\00\00\00\F0!\00\03\1B\FF\00\04\1D\04\00\10\03\00\00\04\1C\04\00\88\06\00\00\04\1E\04\00 \00\00\00\00\00\00\00K\00\00\00\00\00\00\00\00\02\02\08\10\0A/\22\00\00\00\08\00\00\00\00\00\00\08\08\00\00\00\00\00\00\10\08\00\00\00\00\00\00\18\08\00\00\00\00\00\00 \08\00\00\00\00\00\00(\08\00\00\00\00\00\000\08\00\00\00\00\00\008\08\00\00\00\00\01\00\00\08\00\00\00\00\01\00\08\08\00\00\00\00\01\00\10\08\00\00\00\00\01\00\18\08\00\00\00\00\01\00 \08\00\00\00\00\01\00(\08\00\00\00\00\01\000\08\00\00\00\00\01\008\08\00\00\00\00\02\00\00\08\00\00\00\00\02\00\08\08\00\00\00\00\02\00\10\08\00\00\00\00\02\00\18\08\00\00\00\00\02\00 \08\00\00\00\00\02\00(\08\00\00\00\00\02\000\08\00\00\00\00\02\008\08\00\00\00\00\00\00\00\14,\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\AC\00\00\00\AC\AC\00\08\06\00\9C\08\00<\C0d\05\04\1C\F0\FF\FF\7F@\02\00\9C\1B\00\00@\86\1E\04\1C\00\00\1C`\DB<\00\00\04\00\00\00\12\00\03\80\00\00\00\00\00\02\04\9C\7F\00\00\80\E0\00\00\00\00\00\00\00\08\02(\1C\00\00\00\00\E6\0A\00\1C\00\00<\C0\E4\0E\00\9C\7F\00<\C0\E4\02\00\1C\01\00<\C0\E4\12\00\9C\01\00<\C0\E4\0E\00\1C\00\00<\C0\E4\12\00\1C\02\00<\C0\E4\BC\00\00\00\00\BC\00\08\0A\00\9C\04\00<\C0d\02\00\9C\7F\00<\C0\E4\0A\0C\1C\01\00\10\00\E2\02\10\1C\00\00\10\00\E2\0E\C0\1F\AC\00\00\00t\0E\0C\1C\00\00\00\A0|\0E\00\9C\01\00<\C0\E4\00\BC\00\00\00\00\00\08\12\C0\1F\A8\00\00\00t\12\10\1C\00\00\00\A8|*\00\1C\02\00<\C0\E4.\00\9C\02\00<\C0\E4*\00\1C\05\00<\C0\E4.\00\9C\05\00<\C0\E4\12\C0\1F\A4\00\00\00t\BC\00\00\00\00\00\BC\08\12\10\1C\00\00\00\A8|\1A\00\1C\02\00<\C0\E4\1E\00\9C\02\00<\C0\E4\1A\00\1C\03\00<\C0\E4\1E\00\9C\03\00<\C0\E4\12\C0\1F\A0\00\00\00t\12\10\1C\00\00\00\A8|\00\00\00\00\00\00\00\08\22\00\1C\02\00<\C0\E4&\00\9C\02\00<\C0\E4\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\12\00\1C\05\00<\C0\E4\16\00\9C\05\00<\C0\E4\12\00\1C\02\00<\C0\E4\00\00\00\00\00\00\00\08\16\00\9C\02\00<\C0\E4\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\1A\00\1C\03\00<\C0\E4\1E\00\9C\03\00<\C0\E4\1A\00\1C\03\00<\C0\E4\1E\00\9C\03\00<\C0\E4\00\00\00\00\00\00\00\08\1A\00\1C\03\00<\C0\E4\1E\00\9C\03\00<\C0\E4\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\22\00\1C\04\00<\C0\E4\00\00\00\00\00\00\00\08&\00\9C\04\00<\C0\E4*\08\9C\7F\00\00\84\E0.\00\9C\7F\00@\80\E0*\00\1C\05\00<\C0\E4.\00\9C\05\00<\C0\E4*\00\1C\05\00<\C0\E4.\00\9C\05\00<\C0\E4\00\00\00\00\00\00\00\08 (\1C\00\00\00\80\E5!\08\1C\04\00\00\80@&\00\9C\7F\00@\80\E0\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\00\00\00\00\00\00\00\08\18 \1C\00\00\00\80\E5\19\08\1C\08\00\00\80@\1E\00\9C\7F\00@\80\E0\1A\00\1C\03\00<\C0\E4\1E\00\9C\03\00<\C0\E4\1A\00\1C\03\00<\C0\E4\1E\00\9C\03\00<\C0\E4\00\00\00\00\00\00\00\08\10\18\1C\00\00\00\80\E5\11\08\1C\0C\00\00\80@\16\00\9C\7F\00@\80\E0\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\00\00\00\BC\00\00\00\08\0C\10\1C\00\00\00\80\E4\0E\00\9C\12\00\00@\86\0E\00\9C\01\00<\C0\E4\12\00\1C\05\00<\C0d\0E\0C\1C\02\00\18\C0\E1\12\00\9C\10\00\00@\86\12\00\1C\02\00<\C0\E4\00\00\00\00\00\00\00\08\0E\0C\1C\02\00\00\80\E0\11\08\1C\0E\00\00\80@\16\00\9C\7F\00@\80\E0\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\00\00\00\00\00\00\00\08\0C\10\1C\00\00\00\80\E4\11\08\1C\0E\00\00\80@\16\00\9C\7F\00@\80\E0\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\00\00\00\00\00\00\00\08\0C\10\1C\00\00\00\80\C4\11\08\1C\0C\00\00\80@\16\00\9C\7F\00@\80\E0\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\00\00\00\00\AC\AC\00\08\10\10\1C\00\00\00\80\C4\1E\0C\1C\02\00\1Ch\DB\12\00\1C\01\00<\C0\E4\1A\00\1C\00\00<\C0\E4<\00\00$\01\00\00\12<\00\1C\00\00\00\00\12\22\10\9C\7F\00\00\84\E0\00\00\00\00\00\00\00\08&\18\9C\7F\00@\80\E0\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\08 \1C\00\00\00\80\C5\22\00\1C\01\00<\C0\E4\00\00\00\00\00\00\00\08&\00\9C\01\00<\C0\E4\09\10\1C\0E\00\00\80@\0E\18\9C\7F\00@\80\E0\0A\00\1C\01\00<\C0\E4\0E\00\9C\01\00<\C0\E4\0A\00\1C\01\00<\C0\E4\0E\00\9C\01\00<\C0\E4\00\00\00\00\00\00\00\08\08\08\1C\00\00\00\80\C4\0A\E8\1C\01\00\00\00\E6\01\08\9C\0F\00\00H\C1\0A\00\1C\01\00<\C0\E4\02\00\1C\00\00<\C0\E4\01\08\9C\01\00\02\C0\B7\15\08\9C\01\00\00@\C2\00\00\00\00\00\00\00\08\22 \9C\02\00\00\84\E0&$\1C\00\00@\80\E0\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\08 \1C\00\00\00\80\C5\00\00\00\00\00\00\00\08)\10\1C\04\00\00\80@.\18\9C\7F\00@\80\E0*\00\1C\05\00<\C0\E4.\00\9C\05\00<\C0\E4*\00\1C\05\00<\C0\E4.\00\9C\05\00<\C0\E4 (\1C\00\00\00\80\C5\00\00\00\00\00\00\00\08*\00\1C\04\00<\C0\E4.\00\9C\04\00<\C0\E4*(\9C\02\00\00\84\E0.,\1C\00\00@\80\E0*\00\1C\05\00<\C0\E4.\00\9C\05\00<\C0\E4*\00\1C\05\00<\C0\E4\00\00\00\00\00\00\00\08.\00\9C\05\00<\C0\E4 (\1C\00\00\00\80\C5\0A\08\1C\04\00\00\80\E3!\10\1C\08\00\00\80@&\18\9C\7F\00@\80\E0\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\00\00\00\00\00\00\00\08\22\00\1C\04\00<\C0\E4&\00\9C\04\00<\C0\E4\18 \1C\00\00\00\80\C5\12\00\1C\03\00<\C0\E4\1A\00\9C\03\00<\C0\E4\12\10\9C\02\00\00\84\E0\16\18\1C\00\00@\80\E0\00\00\00\00\00\AC\00\08\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\12\00\1C\02\00<\C0\E4\16\00\9C\02\00<\C0\E4\08\10\1C\00\00\00\80\E5<\00\1C\00\00\00\00\12\FE\03\9C\7F\00<\C0\E4\B8\00\00\00\00\00\00\08<\00\1C\00\00\00\00\18<\00\1C\FC\FF\7F\00\12\02<\1C\00\00\00\80\85\02<\1C\00\00\00\80\85\02<\1C\00\00\00\80\85\02<\1C\00\00\00\80\85\02<\1C\00\00\00\80\85\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\00\00\00\00\00\00\00\B8\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0B\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\F8\00\00\00\00\00\00\00\EC\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\E8\01\00\00\00\00\00\00\D8\00\00\00\00\00\00\00\02\00\00\00\08\00\00\00\08\00\00\00\00\00\00\00\18\00\00\00\00\00\00\00)\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\C0\02\00\00\00\00\00\000\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00I\00\00\00\00\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\F0\02\00\00\00\00\00\00t\00\00\00\00\00\00\00\03\00\00\00\08\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\A9\00\00\00\0B\00\00p\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00h\03\00\00\00\00\00\00\D8\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\8A\00\00\00\01\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\04\00\00\00\00\00\00\\\01\00\00\00\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\002\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\C0\05\00\00\00\00\00\00\C0\06\00\00\00\00\00\00\03\00\00\00\08\00\00\0C@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\7F\00\00\00\08\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\80\0C\00\00\00\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\01\01H\00\00\00\10\03\00\00\00\00\00\00\10\03\00\00@\00\00\00\05\00\07\00#\00\00\00\00\00\00\00\00\00\00\00\11 \00\00\00\00\00\00\00\00\00\00\00\00\00\00:\06\00\00\00\00\00\00\00\00\00\00\00\00\00\00\F0 \0A\0A\0A\0A.version 7.5\0A.target sm_35\0A.address_size 64.\00\FF\11global .align 1 .b8 blockIdx[1];\22\00\08?Dim\22\00\07dthreadE\00\FD\1F\0A.visible .entry _Z6vecAddPdS_S_i(\0A.param .u64\1E\00\11_\1C\00?_0,&\00\11\1F1&\00\12\172&\00/32&\00\05\A63\0A)\0A{\0A.loc\E0\00\118\E0\00!__\15\00\A0_depot0[32\09\01\CBreg .b64 %SP\0F\00\14L\10\00\A5pred %p<2>\22\00\8932 %r<9>3\00Urd<18\13\00\10f\13\00\D3fd<4>;\0A\0Amov.uW\00\1B,\8A\00b;\0Acvta\B2\00\04%\00\13,\81\00\22ld\F3\00\01\F2\00o%r1, [\F8\00\05\18].\00\02\8F\00\1F3/\00\07\1F2/\00\00\1F2/\00\07\1F1/\00\00\0F\8D\00\08#0]\D5\00#tok\02\045\00 4,\06\00\133\1F\00\0A\1C\00\115\1C\00\1F4;\00\05\116\1F\00\1F2;\00\02\117\1C\00\1F6;\00\05\118\1F\00\1F1;\00\02\119\1C\00Q8;\0Ast\13\00q[%SP+0]\16\00\1A9\16\00\128\16\00\1A7\16\00\2216\17\00\125\17\00\2232\17\00!24\17\00\221;\FD\01\01\C0\01\B82, %ctaid.x\17\00c3, %nt\16\00qul.lo.s\19\00#4,5\00(r30\00\00)\01\03/\003add,\00$6,1\00\0C\89\00\02\B7\00\116\C2\01\02A\00%7,\1B\00\07\16\00%8,\BA\00\92;\0Asetp.ge]\002p1,6\00\F5\11%r8;\0A@%p1 bra $L__BB0_2;\0Abra.uni\13\0051;\0A\0B\00\11:c\00\02n\01410,b\01\01z\00\02\BC\008d11\92\004shlR\03412, \00\133\EE\00\03\19\00$3,P\00\00\07\00\112N\00\03t\03\01M\00\00#\00(];{\00$4,\C7\01\0AJ\00$5,\1F\00\0DJ\00\132J\00\1353\00$rn\1A\00\00\7F\00\01j\00\00&\00\09g\00%6,\18\02\0Ah\00$7, \00\03h\00!stN\00\01b\00!7]K\00\1E3K\01\162K\01\C02:\0Aret;\0A\0A}\0A\00\00", section ".nv_fatbin", align 8
@__cuda_fatbin_wrapper = internal constant { i32, i32, ptr, ptr } { i32 1180844977, i32 1, ptr @1, ptr null }, section ".nvFatBinSegment", align 8
@__cuda_gpubin_handle = internal global ptr null, align 8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @__cuda_module_ctor, ptr null }]

; Function Attrs: noinline norecurse optnone uwtable
define dso_local void @_Z21__device_stub__vecAddPdS_S_i(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.dim3, align 8
  %10 = alloca %struct.dim3, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca { i64, i32 }, align 8
  %14 = alloca { i64, i32 }, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %15 = alloca ptr, i64 4, align 16
  %16 = getelementptr ptr, ptr %15, i32 0
  store ptr %5, ptr %16, align 8
  %17 = getelementptr ptr, ptr %15, i32 1
  store ptr %6, ptr %17, align 8
  %18 = getelementptr ptr, ptr %15, i32 2
  store ptr %7, ptr %18, align 8
  %19 = getelementptr ptr, ptr %15, i32 3
  store ptr %8, ptr %19, align 8
  %20 = call i32 @__cudaPopCallConfiguration(ptr %9, ptr %10, ptr %11, ptr %12)
  %21 = load i64, ptr %11, align 8
  %22 = load ptr, ptr %12, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %9, i64 12, i1 false)
  %23 = getelementptr inbounds { i64, i32 }, ptr %13, i32 0, i32 0
  %24 = load i64, ptr %23, align 8
  %25 = getelementptr inbounds { i64, i32 }, ptr %13, i32 0, i32 1
  %26 = load i32, ptr %25, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %14, ptr align 8 %10, i64 12, i1 false)
  %27 = getelementptr inbounds { i64, i32 }, ptr %14, i32 0, i32 0
  %28 = load i64, ptr %27, align 8
  %29 = getelementptr inbounds { i64, i32 }, ptr %14, i32 0, i32 1
  %30 = load i32, ptr %29, align 8
  %31 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z21__device_stub__vecAddPdS_S_i, i64 %24, i32 %26, i64 %28, i32 %30, ptr noundef %15, i64 noundef %21, ptr noundef %22)
  br label %32

32:                                               ; preds = %4
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr)

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr)

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr noundef %1) #2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca %struct.dim3, align 4
  %18 = alloca %struct.dim3, align 4
  %19 = alloca { i64, i32 }, align 4
  %20 = alloca { i64, i32 }, align 4
  %21 = alloca double, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 100000, ptr %6, align 4
  %22 = load i32, ptr %6, align 4
  %23 = sext i32 %22 to i64
  %24 = mul i64 %23, 8
  store i64 %24, ptr %13, align 8
  %25 = load i64, ptr %13, align 8
  %26 = call noalias ptr @malloc(i64 noundef %25) #10
  store ptr %26, ptr %7, align 8
  %27 = load i64, ptr %13, align 8
  %28 = call noalias ptr @malloc(i64 noundef %27) #10
  store ptr %28, ptr %8, align 8
  %29 = load i64, ptr %13, align 8
  %30 = call noalias ptr @malloc(i64 noundef %29) #10
  store ptr %30, ptr %9, align 8
  %31 = load i64, ptr %13, align 8
  %32 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(ptr noundef %10, i64 noundef %31)
  %33 = load i64, ptr %13, align 8
  %34 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(ptr noundef %11, i64 noundef %33)
  %35 = load i64, ptr %13, align 8
  %36 = call noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(ptr noundef %12, i64 noundef %35)
  store i32 0, ptr %14, align 4
  br label %37

37:                                               ; preds = %60, %2
  %38 = load i32, ptr %14, align 4
  %39 = load i32, ptr %6, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %63

41:                                               ; preds = %37
  %42 = load i32, ptr %14, align 4
  %43 = call noundef double @_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %42)
  %44 = load i32, ptr %14, align 4
  %45 = call noundef double @_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %44)
  %46 = fmul double %43, %45
  %47 = load ptr, ptr %7, align 8
  %48 = load i32, ptr %14, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double, ptr %47, i64 %49
  store double %46, ptr %50, align 8
  %51 = load i32, ptr %14, align 4
  %52 = call noundef double @_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %51)
  %53 = load i32, ptr %14, align 4
  %54 = call noundef double @_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %53)
  %55 = fmul double %52, %54
  %56 = load ptr, ptr %8, align 8
  %57 = load i32, ptr %14, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, ptr %56, i64 %58
  store double %55, ptr %59, align 8
  br label %60

60:                                               ; preds = %41
  %61 = load i32, ptr %14, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %14, align 4
  br label %37, !llvm.loop !7

63:                                               ; preds = %37
  %64 = load ptr, ptr %10, align 8
  %65 = load ptr, ptr %7, align 8
  %66 = load i64, ptr %13, align 8
  %67 = call i32 @cudaMemcpy(ptr noundef %64, ptr noundef %65, i64 noundef %66, i32 noundef 1)
  %68 = load ptr, ptr %11, align 8
  %69 = load ptr, ptr %8, align 8
  %70 = load i64, ptr %13, align 8
  %71 = call i32 @cudaMemcpy(ptr noundef %68, ptr noundef %69, i64 noundef %70, i32 noundef 1)
  store i32 1024, ptr %15, align 4
  %72 = load i32, ptr %6, align 4
  %73 = sitofp i32 %72 to float
  %74 = load i32, ptr %15, align 4
  %75 = sitofp i32 %74 to float
  %76 = fdiv float %73, %75
  %77 = call noundef float @_ZSt4ceilf(float noundef %76)
  %78 = fptosi float %77 to i32
  store i32 %78, ptr %16, align 4
  %79 = load i32, ptr %16, align 4
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %17, i32 noundef %79, i32 noundef 1, i32 noundef 1)
  %80 = load i32, ptr %15, align 4
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %18, i32 noundef %80, i32 noundef 1, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %19, ptr align 4 %17, i64 12, i1 false)
  %81 = getelementptr inbounds { i64, i32 }, ptr %19, i32 0, i32 0
  %82 = load i64, ptr %81, align 4
  %83 = getelementptr inbounds { i64, i32 }, ptr %19, i32 0, i32 1
  %84 = load i32, ptr %83, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %20, ptr align 4 %18, i64 12, i1 false)
  %85 = getelementptr inbounds { i64, i32 }, ptr %20, i32 0, i32 0
  %86 = load i64, ptr %85, align 4
  %87 = getelementptr inbounds { i64, i32 }, ptr %20, i32 0, i32 1
  %88 = load i32, ptr %87, align 4
  %89 = call i32 @__cudaPushCallConfiguration(i64 %82, i32 %84, i64 %86, i32 %88, i64 noundef 0, ptr noundef null)
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %96, label %91

91:                                               ; preds = %63
  %92 = load ptr, ptr %10, align 8
  %93 = load ptr, ptr %11, align 8
  %94 = load ptr, ptr %12, align 8
  %95 = load i32, ptr %6, align 4
  call void @_Z21__device_stub__vecAddPdS_S_i(ptr noundef %92, ptr noundef %93, ptr noundef %94, i32 noundef %95)
  br label %96

96:                                               ; preds = %91, %63
  %97 = load ptr, ptr %9, align 8
  %98 = load ptr, ptr %12, align 8
  %99 = load i64, ptr %13, align 8
  %100 = call i32 @cudaMemcpy(ptr noundef %97, ptr noundef %98, i64 noundef %99, i32 noundef 2)
  store double 0.000000e+00, ptr %21, align 8
  store i32 0, ptr %14, align 4
  br label %101

101:                                              ; preds = %113, %96
  %102 = load i32, ptr %14, align 4
  %103 = load i32, ptr %6, align 4
  %104 = icmp slt i32 %102, %103
  br i1 %104, label %105, label %116

105:                                              ; preds = %101
  %106 = load ptr, ptr %9, align 8
  %107 = load i32, ptr %14, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds double, ptr %106, i64 %108
  %110 = load double, ptr %109, align 8
  %111 = load double, ptr %21, align 8
  %112 = fadd double %111, %110
  store double %112, ptr %21, align 8
  br label %113

113:                                              ; preds = %105
  %114 = load i32, ptr %14, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, ptr %14, align 4
  br label %101, !llvm.loop !9

116:                                              ; preds = %101
  %117 = load double, ptr %21, align 8
  %118 = load i32, ptr %6, align 4
  %119 = sitofp i32 %118 to double
  %120 = fdiv double %117, %119
  %121 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %120)
  %122 = load ptr, ptr %10, align 8
  %123 = call i32 @cudaFree(ptr noundef %122)
  %124 = load ptr, ptr %11, align 8
  %125 = call i32 @cudaFree(ptr noundef %124)
  %126 = load ptr, ptr %12, align 8
  %127 = call i32 @cudaFree(ptr noundef %126)
  %128 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %128) #11
  %129 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %129) #11
  %130 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %130) #11
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: mustprogress noinline optnone uwtable
define internal noundef i32 @_ZL10cudaMallocIdE9cudaErrorPPT_m(ptr noundef %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call i32 @cudaMalloc(ptr noundef %5, i64 noundef %6)
  ret i32 %7
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef double @_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %0) #5 comdat {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = sitofp i32 %3 to double
  %5 = call double @sin(double noundef %4) #11
  ret double %5
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef double @_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_(i32 noundef %0) #5 comdat {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = sitofp i32 %3 to double
  %5 = call double @cos(double noundef %4) #11
  ret double %5
}

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) #6

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef float @_ZSt4ceilf(float noundef %0) #5 comdat {
  %2 = alloca float, align 4
  store float %0, ptr %2, align 4
  %3 = load float, ptr %2, align 4
  %4 = call float @llvm.ceil.f32(float %3)
  ret float %4
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #7 comdat align 2 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %6, align 4
  store i32 %11, ptr %10, align 4
  %12 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 1
  %13 = load i32, ptr %7, align 4
  store i32 %13, ptr %12, align 4
  %14 = getelementptr inbounds %struct.dim3, ptr %9, i32 0, i32 2
  %15 = load i32, ptr %8, align 4
  store i32 %15, ptr %14, align 4
  ret void
}

declare i32 @printf(ptr noundef, ...) #6

declare i32 @cudaFree(ptr noundef) #6

; Function Attrs: nounwind
declare void @free(ptr noundef) #8

; Function Attrs: nounwind
declare double @sin(double noundef) #8

; Function Attrs: nounwind
declare double @cos(double noundef) #8

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #9

declare i32 @cudaMalloc(ptr noundef, i64 noundef) #6

define internal void @__cuda_register_globals(ptr %0) {
  %2 = call i32 @__cudaRegisterFunction(ptr %0, ptr @_Z21__device_stub__vecAddPdS_S_i, ptr @0, ptr @0, i32 -1, ptr null, ptr null, ptr null, ptr null, ptr null)
  ret void
}

declare i32 @__cudaRegisterFunction(ptr, ptr, ptr, ptr, i32, ptr, ptr, ptr, ptr, ptr)

declare void @__cudaRegisterVar(ptr, ptr, ptr, ptr, i32, i64, i32, i32)

declare void @__cudaRegisterManagedVar(ptr, ptr, ptr, ptr, i64, i32)

declare void @__cudaRegisterSurface(ptr, ptr, ptr, ptr, i32, i32)

declare void @__cudaRegisterTexture(ptr, ptr, ptr, ptr, i32, i32, i32)

declare ptr @__cudaRegisterFatBinary(ptr)

define internal void @__cuda_module_ctor() {
  %1 = call ptr @__cudaRegisterFatBinary(ptr @__cuda_fatbin_wrapper)
  store ptr %1, ptr @__cuda_gpubin_handle, align 8
  call void @__cuda_register_globals(ptr %1)
  call void @__cudaRegisterFatBinaryEnd(ptr %1)
  %2 = call i32 @atexit(ptr @__cuda_module_dtor)
  ret void
}

declare void @__cudaRegisterFatBinaryEnd(ptr)

declare void @__cudaUnregisterFatBinary(ptr)

define internal void @__cuda_module_dtor() {
  %1 = load ptr, ptr @__cuda_gpubin_handle, align 8
  call void @__cudaUnregisterFatBinary(ptr %1)
  ret void
}

declare i32 @atexit(ptr)

attributes #0 = { noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nocallback nofree nounwind willreturn }
attributes #2 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { nounwind allocsize(0) }
attributes #11 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
