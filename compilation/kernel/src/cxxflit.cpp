//===-- llvm-c++filt.cpp --------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include <cstdlib>
#include <iostream>

#include "llvm/ADT/StringExtras.h"
#include "llvm/Demangle/Demangle.h"

using namespace llvm;

static bool StripUnderscore;
static bool Types;
static StringRef ToolName;

std::string demangle(const std::string &Mangled) {
    const char *DecoratedStr = Mangled.c_str();
    if (StripUnderscore)
        if (DecoratedStr[0] == '_')
            ++DecoratedStr;

    std::string Result;
    if (nonMicrosoftDemangle(DecoratedStr, Result))
        return Result;

    std::string Prefix;
    char *Undecorated = nullptr;
    if (Types)
        Undecorated = itaniumDemangle(DecoratedStr, nullptr, nullptr, nullptr);

    if (!Undecorated && strncmp(DecoratedStr, "__imp_", 6) == 0) {
        Prefix = "import thunk for ";
        Undecorated =
            itaniumDemangle(DecoratedStr + 6, nullptr, nullptr, nullptr);
    }
    Result = Undecorated ? Prefix + Undecorated : Mangled;
    free(Undecorated);
    return Result;
}

// Split 'Source' on any character that fails to pass 'IsLegalChar'.  The
// returned vector consists of pairs where 'first' is the delimited word, and
// 'second' are the delimiters following that word.
static void SplitStringDelims(
    StringRef Source,
    SmallVectorImpl<std::pair<StringRef, StringRef>> &OutFragments,
    function_ref<bool(char)> IsLegalChar) {
    // The beginning of the input string.
    const auto Head = Source.begin();
    // Obtain any leading delimiters.
    auto Start = std::find_if(Head, Source.end(), IsLegalChar);
    if (Start != Head)
        OutFragments.push_back({"", Source.slice(0, Start - Head)});
    // Capture each word and the delimiters following that word.
    while (Start != Source.end()) {
        Start = std::find_if(Start, Source.end(), IsLegalChar);
        auto End = std::find_if_not(Start, Source.end(), IsLegalChar);
        auto DEnd = std::find_if(End, Source.end(), IsLegalChar);
        OutFragments.push_back({Source.slice(Start - Head, End - Head),
                                Source.slice(End - Head, DEnd - Head)});
        Start = DEnd;
    }
}

// This returns true if 'C' is a character that can show up in an
// Itanium-mangled string.
static bool IsLegalItaniumChar(char C) {
    // Itanium CXX ABI [External Names]p5.1.1:
    // '$' and '.' in mangled names are reserved for private implementations.
    return isAlnum(C) || C == '.' || C == '$' || C == '_';
}

// If 'Split' is true, then 'Mangled' is broken into individual words and each
// word is demangled.  Otherwise, the entire string is treated as a single
// mangled item.  The result is output to 'OS'.
std::string demangleLine(const std::string MangledWords) {
    std::string Result;
    SmallVector<std::pair<StringRef, StringRef>, 16> Words;
    SplitStringDelims(MangledWords, Words, IsLegalItaniumChar);

    for (const auto &Word : Words)
        Result += ::demangle(std::string(Word.first)) + Word.second.str();

    return Result;
}
