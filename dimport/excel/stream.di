/* Copyright (C) 2003-2005, Claudio Leite
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 *  3. Neither the name of the BSF Software Project nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
 */

/* This code is based on Claudio Leite's packet.c file inside the
 * imcomm module of his bsflite program. Claudio states that his code was
 * inspired by libfaim's (now defunct) bstream (binary stream)
 * implementation.
 */
module excel.stream;

import std.stdint;

extern (C):

enum VARIABLE_PACKET = 1;
enum FIXED_PACKET    = 2;

struct pkt {
  ubyte* data;
  size_t offset;
  size_t len;
}

struct pkt_rdr
{
	ubyte* data;
	size_t len;
	int offset;
}

/* packet creation functions */
void pkt_addraw(pkt* p, const ubyte* bytes, size_t len);
void pkt_addzero(pkt* p, int num_zeros);
void pkt_add8(pkt* p, uint8_t val);
void pkt_add16(pkt* p, uint16_t val);
void pkt_add16_le(pkt* p, uint16_t val);
void pkt_add32(pkt* p, uint32_t val);
void pkt_add32_le(pkt* p, uint32_t val);
void pkt_write_data_len(pkt* p);
void pkt_addstring(pkt* p, const char *bytes);
void pkt_free(pkt*  p);

/* Raw routines */
pkt*  pkt_init(size_t len, int type);
