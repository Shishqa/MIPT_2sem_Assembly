#include <fstream>
#include <iostream>
#include <string>
#include <nmmintrin.h>

#include "c_HashTable.h"

class HashCRC32 {
public:

    uint64_t operator()(const std::string& str_key) const;

};

class StrEqual {
public:

    inline bool operator()(const std::string& str1, const std::string& str2) const __attribute__((always_inline));

};


int main() {

    HashTable<std::string, int, HashCRC32, StrEqual> hash_table(0x4000);

    std::ifstream fin("DATA");

    size_t find_request_count = 0;
    fin >> find_request_count;

    std::string str;

    while (fin >> str) {

        ++hash_table[str];

    }

    fin.close();

    const size_t MAX_STR_LEN = 15;

    std::string requests[MAX_STR_LEN] = {
            "a",
            "aa",
            "aaa",
            "aaaa",
            "aaaaa",
            "aaaaaa",
            "aaaaaaa",
            "aaaaaaaa",
            "aaaaaaaaa",
            "aaaaaaaaaa",
            "aaaaaaaaaaa",
            "aaaaaaaaaaaa",
            "aaaaaaaaaaaaa",
            "aaaaaaaaaaaaaa",
            "aaaaaaaaaaaaaaa"
    };

    for (size_t i = 0; i < find_request_count; ++i) {

        hash_table.find(requests[i % MAX_STR_LEN]);

    }

//    std::cout << "Done\n";
//
//    std::ofstream fout("dispersion_change.csv");
//
//    for (auto bucket : hash_table) {
//
//        std::cout << bucket.size() << " ; \n";
//        fout << bucket.size() << " ; \n";
//
//    }
//
//    fout.close();

    return 0;
}


bool StrEqual::operator()(const std::string& str1, const std::string& str2) const {

    const size_t str1_len = str1.length();

    if (str1_len != str2.length()) {
        return false;
    }

    const char* str1_c = str1.c_str();
    const char* str2_c = str2.c_str();
    const char* str1_end = str1_c + str1_len;

    for (;str1_c < str1_end; ++str1_c, ++str2_c) {
        if (*str1_c != *str2_c) {
            return false;
        }
    }

    return true;
}

uint64_t HashCRC32::operator()(const std::string& str_key) const {

    const void* key = str_key.c_str();
    int len = str_key.length();

    __asm__ (".intel_syntax noprefix\n"
             "xor       rax, rax\n"
             ".loop_crc32_qword:\n"
             "cmp       rcx, 8\n"
             "jb        .crc32_dword\n"
             "mov       rdi, [rsi]\n"
             "crc32     rax, rdi\n"
             "add       rsi, 8\n"
             "sub       rcx, 8\n"
             "jmp       .loop_crc32_qword\n"
             ".crc32_dword:\n"
             "cmp       rcx, 4\n"
             "jb        .crc32_word\n"
             "mov       edi, [rsi]\n"
             "crc32d    eax, edi\n"
             "add       rsi, 4\n"
             "sub       rcx, 4\n"
             ".crc32_word:\n"
             "cmp       rcx, 2\n"
             "jb        .crc32_byte\n"
             "mov       di, [rsi]\n"
             "crc32w    eax, di\n"
             "add       rsi, 2\n"
             "sub       rcx, 2\n"
             ".crc32_byte:\n"
             "cmp       rcx, 0\n"
             "jz        .exit\n"
             "mov       dil, [rsi]\n"
             "crc32b    rax, dil\n"
             ".exit:\n"
             ".att_syntax prefix\n"
            :
            : "S" (key), "c" (len)
            : "rax"
            );

//    while (len >= 8) {
//        hash = _mm_crc32_u64(hash, *reinterpret_cast<const uint64_t*>(key));
//        len -= 8;
//        key += sizeof(uint64_t);
//    }

//    if (len >= 4) {
//        hash = _mm_crc32_u32(hash, *reinterpret_cast<const uint32_t*>(key));
//        len -= 4;
//        key += sizeof(uint32_t);
//    }
//
//    if (len >= 2) {
//        hash = _mm_crc32_u16(hash, *reinterpret_cast<const uint16_t*>(key));
//        len -= 2;
//        key += sizeof(uint16_t);
//    }
//
//    if (len) {
//        hash = _mm_crc32_u8(hash, *reinterpret_cast<const uint8_t*>(key));
//    }
//
//    return hash;
}