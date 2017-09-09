/*
 * Copyright (c) 2017 Rory McGuire <rjmcguire@gmail.com>
 * Based on c version
 * Copyright (c) 2010 Devin Smith <devin@devinsmith.net>
 * Based on early versions of Spreadsheet::WriteExcel
 * Copyright (c) 2000-2001 John McNamara <jmcnamara@cpan.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
module excel.biffwriter;

import std.stdint;

extern (C):

struct bwctx {
  int byte_order;
  ubyte* data;
  uint32_t _sz;  /* Don't touch */
  uint32_t datasize;

  void function (void* xlsctx, void* data, size_t size) append;
}

bwctx*  bw_new();
void bw_destroy(bwctx* bw);
void bw_store_eof(bwctx* bw);
void bw_store_bof(bwctx* bw, uint16_t type);
void bw_append(void *xlsctx, void* data, size_t size);
void bw_prepend(bwctx* bw, void* data, size_t size);

void reverse(ubyte* data, int size);