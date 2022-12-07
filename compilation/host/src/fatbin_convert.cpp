

#include "clang/AST/Decl.h"
#include "llvm/ADT/StringRef.h"

#include "clang/Basic/Cuda.h"
#include "clang/CodeGen/CodeGenABITypes.h"
#include "clang/CodeGen/ConstantInitBuilder.h"

#include "llvm/ADT/StringRef.h"
#include <llvm/Bitcode/BitcodeWriter.h>

#include "llvm/IR/Module.h"
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/ModuleSlotTracker.h>
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include <llvm/IRReader/IRReader.h>
#include "llvm/IR/Constant.h"
#include "llvm/IR/IRBuilder.h"


#include "llvm/Support/raw_ostream.h"
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/ToolOutputFile.h>


#include <fstream>
#include <iostream>

#include "fatbin_convert.hpp" 

using namespace std;

using namespace llvm;


// /// Helper function that generates a constant string and returns a pointer to
//   /// the start of the string.  The result of this function can be used anywhere
//   /// where the C code specifies const char*.
// llvm::Constant *makeConstantString(Module& M,
//                                      const std::string &Str,
//                                      const std::string &Name = "",
//                                      const std::string &SectionName = "",
//                                      unsigned Alignment = 0) {
    
  

//     std::cout << "return " << std::endl;

//     return dyn_cast<Constant>(stringConst);
//   }

void fatbin_convert(llvm::StringRef FileName, Module& M) {


   

  llvm::ErrorOr<std::unique_ptr<llvm::MemoryBuffer>> GpuBinaryOrErr =
      llvm::MemoryBuffer::getFileOrSTDIN(FileName);
  if (std::error_code EC = GpuBinaryOrErr.getError()) {
    errs() << " Fat binary file cannot open.\n";
  }

  // convert fat binary to string 
  std::unique_ptr< MemoryBuffer > mb = std::move(*GpuBinaryOrErr);
  const std::string str (mb->getBuffer());

  std::cout << "fatbin len: " << str.length() << std::endl;
  // Clang CodeGen
  const unsigned HIPCodeObjectAlign = 4096;
  const char * FatbinConstantName = ".hip_fatbin";
  const char * FatbinSectionName = ".hipFatBinSegment";
  constexpr unsigned HIPFatMagic = 0x48495046;

  std::cout << "return 22121 " << std::endl;


  std::cout << "return 21 " << std::endl;

  auto charType = llvm::IntegerType::get(M.getContext(), 8);
  auto stringType = llvm::ArrayType::get(charType, str.length());
  llvm::IRBuilder<> Builder(M.getContext());

  std::cout << "return 22 " << std::endl;

  StringRef myStr = llvm::StringRef(str);
  // lvm::Value *stringConst = Builder.CreateGlobalStringPtr
  std::cout << "return 22dd " << std::endl;

  llvm::GlobalVariable *GV = Builder.CreateGlobalString(myStr, "_cupbop_amdgpu_fatbin_wrapper");
  std::cout << "return 223" << std::endl;

  llvm::Value* stringConst = Builder.CreateConstGEP2_32(GV->getValueType(), GV, 0, 0, "cast");
  std::cout << "return 224" << std::endl;
   
  GV->setSection(FatbinSectionName );
  // Mark the address as used which make sure that this section isn't
  // merged and we will really have it in the object file.
  GV->setUnnamedAddr(llvm::GlobalValue::UnnamedAddr::None);
    
  GV->setAlignment(llvm::Align(HIPCodeObjectAlign));

  llvm::Constant* fatbin_const = dyn_cast<Constant>(stringConst);
    
  
  std::cout << "return 2 " << std::endl;

  auto cuda_fatbin_wrapper = M.getGlobalVariable("__cuda_fatbin_wrapper");

  if (!cuda_fatbin_wrapper) {
    // change the fat magic of the wrapper to 1212764230

    // change ptr @1 to ptr @_cupbop_amdgpu_fatbin_wrapper

    // change section to hipFatBinSegment 
  } else {
    errs() << " No __cuda_fatbin_wrapper or bug. \n";
  }



  // assigned the str to global variable in the host llvm
  for (auto &global : M.getGlobalList()) {
    if (global.hasName()) {
      printf("%s \n", global.getName());



    } else if (!global.getType()->isVoidTy()) {
      // SlotTracker *Machine = nullptr;
      // ModuleSlotTracker m = ModuleSlotTracker(&M, false);
      GlobalVariable * g = &global;
      llvm::Type *ty = g->getValueType();
      std::string type_str;
      llvm::raw_string_ostream rso(type_str);
      ty->print(rso);
      std::cout<<rso.str() << "\n";


//          vector<Constant*> strs;
//    strs.push_back(mk_string(M, Context, "s1"));
//    strs.push_back(mk_string(M, Context, "s2"));
//    ArrayType *Ty =
//  ArrayType::get(Type::getInt8Ty(Context)->getPointerTo(),2);
//    new llvm::GlobalVariable(
//      *M,
//      Ty,
//      true,
//      GlobalValue::InternalLinkage,


//      ConstantArray::get(Ty,strs),
//      "ss",
//      0,
//      false,
//     0)

      // Value* val = llvm::dyncast<Value*> (g);
      // int SlotNum =  ModuleSlotTracker(&M, false).getLocalSlot(val);
      // if (SlotNum == -1)
      //   errs() << "<badref> = ";
      // else
      //   errs() << '%' << SlotNum << " = ";

      }



  }

  // std::ofstream myfile;
  // myfile.open ("fatbintest.txt");
  // myfile << str;
  // myfile.close();
  

  // check the string fat binary


  
}