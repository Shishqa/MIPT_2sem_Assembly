#ifndef UTILS_HPP
#define UTILS_HPP

#include <cstdio>

#include "simple_vector/vector.hpp"
#include "instructions/instruction.hpp" 
#include "instructions/argument.hpp"

namespace Utils {

    static bool optimize_flag = false;
    /*
     * Change optimize_flag value
     */
    void use_optimization(bool value); 

    static bool info_flag = true;
    /*
     * Change info_flag value
     */
    void extra_info(bool value);

    /*
     * Print msg to the screen
     * with cyan "$$" at the beginning
     */
    void print_info(const char* msg);

    /* sas_to_elf64:
     *      Read sas binary file from <in_path>,
     *      convert it to x86-64 elf format and
     *      write to <out_path>
     */
    void sas_to_elf64(const char* in_path, const char* out_path);
    
    /* read_from_file:
     *      Read binary information from file at <path>,
     *      allocate buffer for info and store it there
     */ 
    size_t read_from_file(const char* path, char*& buf);

    /* encode_sas:
     *      Convert buffer to array of instructions
     */
    Vector<Instruction> encode_sas(const char* buf, const size_t& buf_size);

    /* optimize:
     *      Optimize some moments:
     *
     *      | push <arg1>       
     *      | pop  <arg2> ---> | mov <arg2>, <arg1>
     *
     *      | jmp .next
     *      | .next:      ---> | <...>
     *      | <...>
     * 
     */
    void optimize_codes(Vector<Instruction>& codes);

    /* write elf:
     *      Write an array of instructions to elf file
     */
    void write_elf(const char* path, const Vector<Instruction>& codes);
    
    /* codes_to_buf:
     *      Convert array of unstructions to x86-64 
     *      opcodes and write to buf
     */
    size_t codes_to_buf(const Vector<Instruction>& codes, char*& buf);
};

#endif //UTILS_HPP
