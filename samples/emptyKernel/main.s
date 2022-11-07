	.text
	.file	"main.cpp"
	.file	0 "/nethome/jchen706/coding/amdcuda/samples/emptyKernel" "main.cpp" md5 0x8c35547cbde4d2dd114337ecd3885616
	.file	1 "main.cpp"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.loc	1 4 0                           # main.cpp:4:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$752, %rsp                      # imm = 0x2F0
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
.Ltmp0:
	.loc	1 6 3 prologue_end              # main.cpp:6:3
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	.loc	1 10 3                          # main.cpp:10:3
	leaq	-20(%rbp), %rdi
	callq	cudaGetDevice@PLT
	.loc	1 12 34                         # main.cpp:12:34
	movl	-20(%rbp), %esi
	.loc	1 12 3 is_stmt 0                # main.cpp:12:3
	leaq	-752(%rbp), %rdi
	callq	cudaGetDeviceProperties@PLT
	.loc	1 13 1 is_stmt 1                # main.cpp:13:1
	xorl	%eax, %eax
	addq	$752, %rsp                      # imm = 0x2F0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp1:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Testing main"
	.size	.L.str, 13

	.file	2 "/nethome/jchen706" "cuda-11.5/targets/x86_64-linux/include/driver_types.h"
	.file	3 "/nethome/jchen706" "opt/llvm/lib/clang/16.0.0/include/stddef.h"
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	54                              # DW_AT_calling_convention
	.byte	11                              # DW_FORM_data1
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	5                               # DW_FORM_data2
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	56                              # DW_AT_data_member_location
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	16                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	17                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	54                              # DW_AT_calling_convention
	.byte	11                              # DW_FORM_data1
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	18                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0x466 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.short	33                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.long	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	1                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.long	.Laddr_table_base0              # DW_AT_addr_base
	.byte	2                               # Abbrev [2] 0x23:0xa DW_TAG_variable
	.long	45                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.byte	2                               # DW_AT_location
	.byte	161
	.byte	0
	.byte	3                               # Abbrev [3] 0x2d:0xc DW_TAG_array_type
	.long	57                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x32:0x6 DW_TAG_subrange_type
	.long	66                              # DW_AT_type
	.byte	13                              # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x39:0x5 DW_TAG_const_type
	.long	62                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0x3e:0x4 DW_TAG_base_type
	.byte	3                               # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x42:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	8                               # Abbrev [8] 0x46:0x3d DW_TAG_subprogram
	.byte	1                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.byte	5                               # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.long	131                             # DW_AT_type
                                        # DW_AT_external
	.byte	9                               # Abbrev [9] 0x55:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	124
	.byte	7                               # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.long	131                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x60:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	112
	.byte	8                               # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.long	135                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0x6b:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	108
	.byte	9                               # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.long	131                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0x76:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\220z"
	.byte	10                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	8                               # DW_AT_decl_line
	.long	145                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x83:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	11                              # Abbrev [11] 0x87:0x5 DW_TAG_pointer_type
	.long	140                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x8c:0x5 DW_TAG_pointer_type
	.long	62                              # DW_AT_type
	.byte	12                              # Abbrev [12] 0x91:0x378 DW_TAG_structure_type
	.byte	5                               # DW_AT_calling_convention
	.byte	97                              # DW_AT_name
	.short	728                             # DW_AT_byte_size
	.byte	2                               # DW_AT_decl_file
	.short	2189                            # DW_AT_decl_line
	.byte	13                              # Abbrev [13] 0x99:0xa DW_TAG_member
	.byte	11                              # DW_AT_name
	.long	1033                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2191                            # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0xa3:0xb DW_TAG_member
	.byte	12                              # DW_AT_name
	.long	1046                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2192                            # DW_AT_decl_line
	.short	256                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0xae:0xb DW_TAG_member
	.byte	16                              # DW_AT_name
	.long	1085                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2193                            # DW_AT_decl_line
	.short	272                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0xb9:0xb DW_TAG_member
	.byte	17                              # DW_AT_name
	.long	1097                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2194                            # DW_AT_decl_line
	.short	280                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0xc4:0xb DW_TAG_member
	.byte	19                              # DW_AT_name
	.long	1101                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2195                            # DW_AT_decl_line
	.short	288                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0xcf:0xb DW_TAG_member
	.byte	22                              # DW_AT_name
	.long	1101                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2196                            # DW_AT_decl_line
	.short	296                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0xda:0xb DW_TAG_member
	.byte	23                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2197                            # DW_AT_decl_line
	.short	304                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0xe5:0xb DW_TAG_member
	.byte	24                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2198                            # DW_AT_decl_line
	.short	308                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0xf0:0xb DW_TAG_member
	.byte	25                              # DW_AT_name
	.long	1101                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2199                            # DW_AT_decl_line
	.short	312                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0xfb:0xb DW_TAG_member
	.byte	26                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2200                            # DW_AT_decl_line
	.short	320                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x106:0xb DW_TAG_member
	.byte	27                              # DW_AT_name
	.long	1113                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2201                            # DW_AT_decl_line
	.short	324                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x111:0xb DW_TAG_member
	.byte	28                              # DW_AT_name
	.long	1113                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2202                            # DW_AT_decl_line
	.short	336                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x11c:0xb DW_TAG_member
	.byte	29                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2203                            # DW_AT_decl_line
	.short	348                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x127:0xb DW_TAG_member
	.byte	30                              # DW_AT_name
	.long	1101                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2204                            # DW_AT_decl_line
	.short	352                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x132:0xb DW_TAG_member
	.byte	31                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2205                            # DW_AT_decl_line
	.short	360                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x13d:0xb DW_TAG_member
	.byte	32                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2206                            # DW_AT_decl_line
	.short	364                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x148:0xb DW_TAG_member
	.byte	33                              # DW_AT_name
	.long	1101                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2207                            # DW_AT_decl_line
	.short	368                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x153:0xb DW_TAG_member
	.byte	34                              # DW_AT_name
	.long	1101                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2208                            # DW_AT_decl_line
	.short	376                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x15e:0xb DW_TAG_member
	.byte	35                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2209                            # DW_AT_decl_line
	.short	384                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x169:0xb DW_TAG_member
	.byte	36                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2210                            # DW_AT_decl_line
	.short	388                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x174:0xb DW_TAG_member
	.byte	37                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2211                            # DW_AT_decl_line
	.short	392                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x17f:0xb DW_TAG_member
	.byte	38                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2212                            # DW_AT_decl_line
	.short	396                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x18a:0xb DW_TAG_member
	.byte	39                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2213                            # DW_AT_decl_line
	.short	400                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x195:0xb DW_TAG_member
	.byte	40                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2214                            # DW_AT_decl_line
	.short	404                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1a0:0xb DW_TAG_member
	.byte	41                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2215                            # DW_AT_decl_line
	.short	408                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1ab:0xb DW_TAG_member
	.byte	42                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2216                            # DW_AT_decl_line
	.short	412                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1b6:0xb DW_TAG_member
	.byte	43                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2217                            # DW_AT_decl_line
	.short	416                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1c1:0xb DW_TAG_member
	.byte	44                              # DW_AT_name
	.long	1125                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2218                            # DW_AT_decl_line
	.short	420                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1cc:0xb DW_TAG_member
	.byte	45                              # DW_AT_name
	.long	1125                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2219                            # DW_AT_decl_line
	.short	428                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1d7:0xb DW_TAG_member
	.byte	46                              # DW_AT_name
	.long	1113                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2220                            # DW_AT_decl_line
	.short	436                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1e2:0xb DW_TAG_member
	.byte	47                              # DW_AT_name
	.long	1125                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2221                            # DW_AT_decl_line
	.short	448                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1ed:0xb DW_TAG_member
	.byte	48                              # DW_AT_name
	.long	1113                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2222                            # DW_AT_decl_line
	.short	456                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1f8:0xb DW_TAG_member
	.byte	49                              # DW_AT_name
	.long	1113                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2223                            # DW_AT_decl_line
	.short	468                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x203:0xb DW_TAG_member
	.byte	50                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2224                            # DW_AT_decl_line
	.short	480                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x20e:0xb DW_TAG_member
	.byte	51                              # DW_AT_name
	.long	1125                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2225                            # DW_AT_decl_line
	.short	484                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x219:0xb DW_TAG_member
	.byte	52                              # DW_AT_name
	.long	1113                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2226                            # DW_AT_decl_line
	.short	492                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x224:0xb DW_TAG_member
	.byte	53                              # DW_AT_name
	.long	1125                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2227                            # DW_AT_decl_line
	.short	504                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x22f:0xb DW_TAG_member
	.byte	54                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2228                            # DW_AT_decl_line
	.short	512                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x23a:0xb DW_TAG_member
	.byte	55                              # DW_AT_name
	.long	1125                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2229                            # DW_AT_decl_line
	.short	516                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x245:0xb DW_TAG_member
	.byte	56                              # DW_AT_name
	.long	1113                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2230                            # DW_AT_decl_line
	.short	524                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x250:0xb DW_TAG_member
	.byte	57                              # DW_AT_name
	.long	1125                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2231                            # DW_AT_decl_line
	.short	536                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x25b:0xb DW_TAG_member
	.byte	58                              # DW_AT_name
	.long	1113                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2232                            # DW_AT_decl_line
	.short	544                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x266:0xb DW_TAG_member
	.byte	59                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2233                            # DW_AT_decl_line
	.short	556                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x271:0xb DW_TAG_member
	.byte	60                              # DW_AT_name
	.long	1125                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2234                            # DW_AT_decl_line
	.short	560                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x27c:0xb DW_TAG_member
	.byte	61                              # DW_AT_name
	.long	1101                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2235                            # DW_AT_decl_line
	.short	568                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x287:0xb DW_TAG_member
	.byte	62                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2236                            # DW_AT_decl_line
	.short	576                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x292:0xb DW_TAG_member
	.byte	63                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2237                            # DW_AT_decl_line
	.short	580                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x29d:0xb DW_TAG_member
	.byte	64                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2238                            # DW_AT_decl_line
	.short	584                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2a8:0xb DW_TAG_member
	.byte	65                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2239                            # DW_AT_decl_line
	.short	588                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2b3:0xb DW_TAG_member
	.byte	66                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2240                            # DW_AT_decl_line
	.short	592                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2be:0xb DW_TAG_member
	.byte	67                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2241                            # DW_AT_decl_line
	.short	596                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2c9:0xb DW_TAG_member
	.byte	68                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2242                            # DW_AT_decl_line
	.short	600                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2d4:0xb DW_TAG_member
	.byte	69                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2243                            # DW_AT_decl_line
	.short	604                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2df:0xb DW_TAG_member
	.byte	70                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2244                            # DW_AT_decl_line
	.short	608                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2ea:0xb DW_TAG_member
	.byte	71                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2245                            # DW_AT_decl_line
	.short	612                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2f5:0xb DW_TAG_member
	.byte	72                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2246                            # DW_AT_decl_line
	.short	616                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x300:0xb DW_TAG_member
	.byte	73                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2247                            # DW_AT_decl_line
	.short	620                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x30b:0xb DW_TAG_member
	.byte	74                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2248                            # DW_AT_decl_line
	.short	624                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x316:0xb DW_TAG_member
	.byte	75                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2249                            # DW_AT_decl_line
	.short	628                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x321:0xb DW_TAG_member
	.byte	76                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2250                            # DW_AT_decl_line
	.short	632                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x32c:0xb DW_TAG_member
	.byte	77                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2251                            # DW_AT_decl_line
	.short	636                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x337:0xb DW_TAG_member
	.byte	78                              # DW_AT_name
	.long	1101                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2252                            # DW_AT_decl_line
	.short	640                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x342:0xb DW_TAG_member
	.byte	79                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2253                            # DW_AT_decl_line
	.short	648                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x34d:0xb DW_TAG_member
	.byte	80                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2254                            # DW_AT_decl_line
	.short	652                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x358:0xb DW_TAG_member
	.byte	81                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2255                            # DW_AT_decl_line
	.short	656                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x363:0xb DW_TAG_member
	.byte	82                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2256                            # DW_AT_decl_line
	.short	660                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x36e:0xb DW_TAG_member
	.byte	83                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2257                            # DW_AT_decl_line
	.short	664                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x379:0xb DW_TAG_member
	.byte	84                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2258                            # DW_AT_decl_line
	.short	668                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x384:0xb DW_TAG_member
	.byte	85                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2259                            # DW_AT_decl_line
	.short	672                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x38f:0xb DW_TAG_member
	.byte	86                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2260                            # DW_AT_decl_line
	.short	676                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x39a:0xb DW_TAG_member
	.byte	87                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2261                            # DW_AT_decl_line
	.short	680                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3a5:0xb DW_TAG_member
	.byte	88                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2262                            # DW_AT_decl_line
	.short	684                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3b0:0xb DW_TAG_member
	.byte	89                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2263                            # DW_AT_decl_line
	.short	688                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3bb:0xb DW_TAG_member
	.byte	90                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2264                            # DW_AT_decl_line
	.short	692                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3c6:0xb DW_TAG_member
	.byte	91                              # DW_AT_name
	.long	1101                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2265                            # DW_AT_decl_line
	.short	696                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3d1:0xb DW_TAG_member
	.byte	92                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2266                            # DW_AT_decl_line
	.short	704                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3dc:0xb DW_TAG_member
	.byte	93                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2267                            # DW_AT_decl_line
	.short	708                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3e7:0xb DW_TAG_member
	.byte	94                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2268                            # DW_AT_decl_line
	.short	712                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3f2:0xb DW_TAG_member
	.byte	95                              # DW_AT_name
	.long	131                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2269                            # DW_AT_decl_line
	.short	716                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3fd:0xb DW_TAG_member
	.byte	96                              # DW_AT_name
	.long	1101                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2270                            # DW_AT_decl_line
	.short	720                             # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	3                               # Abbrev [3] 0x409:0xd DW_TAG_array_type
	.long	62                              # DW_AT_type
	.byte	15                              # Abbrev [15] 0x40e:0x7 DW_TAG_subrange_type
	.long	66                              # DW_AT_type
	.short	256                             # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	16                              # Abbrev [16] 0x416:0x9 DW_TAG_typedef
	.long	1055                            # DW_AT_type
	.byte	15                              # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.short	2184                            # DW_AT_decl_line
	.byte	17                              # Abbrev [17] 0x41f:0x12 DW_TAG_structure_type
	.byte	5                               # DW_AT_calling_convention
	.byte	14                              # DW_AT_name
	.byte	16                              # DW_AT_byte_size
	.byte	2                               # DW_AT_decl_file
	.short	2179                            # DW_AT_decl_line
	.byte	13                              # Abbrev [13] 0x426:0xa DW_TAG_member
	.byte	13                              # DW_AT_name
	.long	1073                            # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	2180                            # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	3                               # Abbrev [3] 0x431:0xc DW_TAG_array_type
	.long	62                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x436:0x6 DW_TAG_subrange_type
	.long	66                              # DW_AT_type
	.byte	16                              # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	3                               # Abbrev [3] 0x43d:0xc DW_TAG_array_type
	.long	62                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x442:0x6 DW_TAG_subrange_type
	.long	66                              # DW_AT_type
	.byte	8                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x449:0x4 DW_TAG_base_type
	.byte	18                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	18                              # Abbrev [18] 0x44d:0x8 DW_TAG_typedef
	.long	1109                            # DW_AT_type
	.byte	21                              # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.byte	6                               # Abbrev [6] 0x455:0x4 DW_TAG_base_type
	.byte	20                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x459:0xc DW_TAG_array_type
	.long	131                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x45e:0x6 DW_TAG_subrange_type
	.long	66                              # DW_AT_type
	.byte	3                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	3                               # Abbrev [3] 0x465:0xc DW_TAG_array_type
	.long	131                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x46a:0x6 DW_TAG_subrange_type
	.long	66                              # DW_AT_type
	.byte	2                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.long	396                             # Length of String Offsets Set
	.short	5
	.short	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)" # string offset=0
.Linfo_string1:
	.asciz	"main.cpp"                      # string offset=105
.Linfo_string2:
	.asciz	"/nethome/jchen706/coding/amdcuda/samples/emptyKernel" # string offset=114
.Linfo_string3:
	.asciz	"char"                          # string offset=167
.Linfo_string4:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=172
.Linfo_string5:
	.asciz	"main"                          # string offset=192
.Linfo_string6:
	.asciz	"int"                           # string offset=197
.Linfo_string7:
	.asciz	"argc"                          # string offset=201
.Linfo_string8:
	.asciz	"argv"                          # string offset=206
.Linfo_string9:
	.asciz	"device"                        # string offset=211
.Linfo_string10:
	.asciz	"prop"                          # string offset=218
.Linfo_string11:
	.asciz	"name"                          # string offset=223
.Linfo_string12:
	.asciz	"uuid"                          # string offset=228
.Linfo_string13:
	.asciz	"bytes"                         # string offset=233
.Linfo_string14:
	.asciz	"CUuuid_st"                     # string offset=239
.Linfo_string15:
	.asciz	"cudaUUID_t"                    # string offset=249
.Linfo_string16:
	.asciz	"luid"                          # string offset=260
.Linfo_string17:
	.asciz	"luidDeviceNodeMask"            # string offset=265
.Linfo_string18:
	.asciz	"unsigned int"                  # string offset=284
.Linfo_string19:
	.asciz	"totalGlobalMem"                # string offset=297
.Linfo_string20:
	.asciz	"unsigned long"                 # string offset=312
.Linfo_string21:
	.asciz	"size_t"                        # string offset=326
.Linfo_string22:
	.asciz	"sharedMemPerBlock"             # string offset=333
.Linfo_string23:
	.asciz	"regsPerBlock"                  # string offset=351
.Linfo_string24:
	.asciz	"warpSize"                      # string offset=364
.Linfo_string25:
	.asciz	"memPitch"                      # string offset=373
.Linfo_string26:
	.asciz	"maxThreadsPerBlock"            # string offset=382
.Linfo_string27:
	.asciz	"maxThreadsDim"                 # string offset=401
.Linfo_string28:
	.asciz	"maxGridSize"                   # string offset=415
.Linfo_string29:
	.asciz	"clockRate"                     # string offset=427
.Linfo_string30:
	.asciz	"totalConstMem"                 # string offset=437
.Linfo_string31:
	.asciz	"major"                         # string offset=451
.Linfo_string32:
	.asciz	"minor"                         # string offset=457
.Linfo_string33:
	.asciz	"textureAlignment"              # string offset=463
.Linfo_string34:
	.asciz	"texturePitchAlignment"         # string offset=480
.Linfo_string35:
	.asciz	"deviceOverlap"                 # string offset=502
.Linfo_string36:
	.asciz	"multiProcessorCount"           # string offset=516
.Linfo_string37:
	.asciz	"kernelExecTimeoutEnabled"      # string offset=536
.Linfo_string38:
	.asciz	"integrated"                    # string offset=561
.Linfo_string39:
	.asciz	"canMapHostMemory"              # string offset=572
.Linfo_string40:
	.asciz	"computeMode"                   # string offset=589
.Linfo_string41:
	.asciz	"maxTexture1D"                  # string offset=601
.Linfo_string42:
	.asciz	"maxTexture1DMipmap"            # string offset=614
.Linfo_string43:
	.asciz	"maxTexture1DLinear"            # string offset=633
.Linfo_string44:
	.asciz	"maxTexture2D"                  # string offset=652
.Linfo_string45:
	.asciz	"maxTexture2DMipmap"            # string offset=665
.Linfo_string46:
	.asciz	"maxTexture2DLinear"            # string offset=684
.Linfo_string47:
	.asciz	"maxTexture2DGather"            # string offset=703
.Linfo_string48:
	.asciz	"maxTexture3D"                  # string offset=722
.Linfo_string49:
	.asciz	"maxTexture3DAlt"               # string offset=735
.Linfo_string50:
	.asciz	"maxTextureCubemap"             # string offset=751
.Linfo_string51:
	.asciz	"maxTexture1DLayered"           # string offset=769
.Linfo_string52:
	.asciz	"maxTexture2DLayered"           # string offset=789
.Linfo_string53:
	.asciz	"maxTextureCubemapLayered"      # string offset=809
.Linfo_string54:
	.asciz	"maxSurface1D"                  # string offset=834
.Linfo_string55:
	.asciz	"maxSurface2D"                  # string offset=847
.Linfo_string56:
	.asciz	"maxSurface3D"                  # string offset=860
.Linfo_string57:
	.asciz	"maxSurface1DLayered"           # string offset=873
.Linfo_string58:
	.asciz	"maxSurface2DLayered"           # string offset=893
.Linfo_string59:
	.asciz	"maxSurfaceCubemap"             # string offset=913
.Linfo_string60:
	.asciz	"maxSurfaceCubemapLayered"      # string offset=931
.Linfo_string61:
	.asciz	"surfaceAlignment"              # string offset=956
.Linfo_string62:
	.asciz	"concurrentKernels"             # string offset=973
.Linfo_string63:
	.asciz	"ECCEnabled"                    # string offset=991
.Linfo_string64:
	.asciz	"pciBusID"                      # string offset=1002
.Linfo_string65:
	.asciz	"pciDeviceID"                   # string offset=1011
.Linfo_string66:
	.asciz	"pciDomainID"                   # string offset=1023
.Linfo_string67:
	.asciz	"tccDriver"                     # string offset=1035
.Linfo_string68:
	.asciz	"asyncEngineCount"              # string offset=1045
.Linfo_string69:
	.asciz	"unifiedAddressing"             # string offset=1062
.Linfo_string70:
	.asciz	"memoryClockRate"               # string offset=1080
.Linfo_string71:
	.asciz	"memoryBusWidth"                # string offset=1096
.Linfo_string72:
	.asciz	"l2CacheSize"                   # string offset=1111
.Linfo_string73:
	.asciz	"persistingL2CacheMaxSize"      # string offset=1123
.Linfo_string74:
	.asciz	"maxThreadsPerMultiProcessor"   # string offset=1148
.Linfo_string75:
	.asciz	"streamPrioritiesSupported"     # string offset=1176
.Linfo_string76:
	.asciz	"globalL1CacheSupported"        # string offset=1202
.Linfo_string77:
	.asciz	"localL1CacheSupported"         # string offset=1225
.Linfo_string78:
	.asciz	"sharedMemPerMultiprocessor"    # string offset=1247
.Linfo_string79:
	.asciz	"regsPerMultiprocessor"         # string offset=1274
.Linfo_string80:
	.asciz	"managedMemory"                 # string offset=1296
.Linfo_string81:
	.asciz	"isMultiGpuBoard"               # string offset=1310
.Linfo_string82:
	.asciz	"multiGpuBoardGroupID"          # string offset=1326
.Linfo_string83:
	.asciz	"hostNativeAtomicSupported"     # string offset=1347
.Linfo_string84:
	.asciz	"singleToDoublePrecisionPerfRatio" # string offset=1373
.Linfo_string85:
	.asciz	"pageableMemoryAccess"          # string offset=1406
.Linfo_string86:
	.asciz	"concurrentManagedAccess"       # string offset=1427
.Linfo_string87:
	.asciz	"computePreemptionSupported"    # string offset=1451
.Linfo_string88:
	.asciz	"canUseHostPointerForRegisteredMem" # string offset=1478
.Linfo_string89:
	.asciz	"cooperativeLaunch"             # string offset=1512
.Linfo_string90:
	.asciz	"cooperativeMultiDeviceLaunch"  # string offset=1530
.Linfo_string91:
	.asciz	"sharedMemPerBlockOptin"        # string offset=1559
.Linfo_string92:
	.asciz	"pageableMemoryAccessUsesHostPageTables" # string offset=1582
.Linfo_string93:
	.asciz	"directManagedMemAccessFromHost" # string offset=1621
.Linfo_string94:
	.asciz	"maxBlocksPerMultiProcessor"    # string offset=1652
.Linfo_string95:
	.asciz	"accessPolicyMaxWindowSize"     # string offset=1679
.Linfo_string96:
	.asciz	"reservedSharedMemPerBlock"     # string offset=1705
.Linfo_string97:
	.asciz	"cudaDeviceProp"                # string offset=1731
	.section	.debug_str_offsets,"",@progbits
	.long	.Linfo_string0
	.long	.Linfo_string1
	.long	.Linfo_string2
	.long	.Linfo_string3
	.long	.Linfo_string4
	.long	.Linfo_string5
	.long	.Linfo_string6
	.long	.Linfo_string7
	.long	.Linfo_string8
	.long	.Linfo_string9
	.long	.Linfo_string10
	.long	.Linfo_string11
	.long	.Linfo_string12
	.long	.Linfo_string13
	.long	.Linfo_string14
	.long	.Linfo_string15
	.long	.Linfo_string16
	.long	.Linfo_string17
	.long	.Linfo_string18
	.long	.Linfo_string19
	.long	.Linfo_string20
	.long	.Linfo_string21
	.long	.Linfo_string22
	.long	.Linfo_string23
	.long	.Linfo_string24
	.long	.Linfo_string25
	.long	.Linfo_string26
	.long	.Linfo_string27
	.long	.Linfo_string28
	.long	.Linfo_string29
	.long	.Linfo_string30
	.long	.Linfo_string31
	.long	.Linfo_string32
	.long	.Linfo_string33
	.long	.Linfo_string34
	.long	.Linfo_string35
	.long	.Linfo_string36
	.long	.Linfo_string37
	.long	.Linfo_string38
	.long	.Linfo_string39
	.long	.Linfo_string40
	.long	.Linfo_string41
	.long	.Linfo_string42
	.long	.Linfo_string43
	.long	.Linfo_string44
	.long	.Linfo_string45
	.long	.Linfo_string46
	.long	.Linfo_string47
	.long	.Linfo_string48
	.long	.Linfo_string49
	.long	.Linfo_string50
	.long	.Linfo_string51
	.long	.Linfo_string52
	.long	.Linfo_string53
	.long	.Linfo_string54
	.long	.Linfo_string55
	.long	.Linfo_string56
	.long	.Linfo_string57
	.long	.Linfo_string58
	.long	.Linfo_string59
	.long	.Linfo_string60
	.long	.Linfo_string61
	.long	.Linfo_string62
	.long	.Linfo_string63
	.long	.Linfo_string64
	.long	.Linfo_string65
	.long	.Linfo_string66
	.long	.Linfo_string67
	.long	.Linfo_string68
	.long	.Linfo_string69
	.long	.Linfo_string70
	.long	.Linfo_string71
	.long	.Linfo_string72
	.long	.Linfo_string73
	.long	.Linfo_string74
	.long	.Linfo_string75
	.long	.Linfo_string76
	.long	.Linfo_string77
	.long	.Linfo_string78
	.long	.Linfo_string79
	.long	.Linfo_string80
	.long	.Linfo_string81
	.long	.Linfo_string82
	.long	.Linfo_string83
	.long	.Linfo_string84
	.long	.Linfo_string85
	.long	.Linfo_string86
	.long	.Linfo_string87
	.long	.Linfo_string88
	.long	.Linfo_string89
	.long	.Linfo_string90
	.long	.Linfo_string91
	.long	.Linfo_string92
	.long	.Linfo_string93
	.long	.Linfo_string94
	.long	.Linfo_string95
	.long	.Linfo_string96
	.long	.Linfo_string97
	.section	.debug_addr,"",@progbits
	.long	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.short	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.L.str
	.quad	.Lfunc_begin0
.Ldebug_addr_end0:
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 159fb378f779ac79f7d456ea233892ad526b56d8)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
	.addrsig_sym cudaGetDevice
	.addrsig_sym cudaGetDeviceProperties
	.section	.debug_line,"",@progbits
.Lline_table_start0:
