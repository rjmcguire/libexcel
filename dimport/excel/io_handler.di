/*
 * Copyright (c) 2017 Rory McGuire <rjmcguire@gmail.com>
 * Based on c version
 * Copyright (c) 2014 Guilherme Steinmann <guidefloripa@gmail.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BELIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
module excel.io_handler;

extern (C):

struct xl_io_handler {
  void* function (const char* filename) create;
  int   function(void* handle, const void* buffer, size_t size) write;
  int   function(void* handle) close;
}

void* xl_file_create(const char* filename);
int   xl_file_write(void *handle,const void* buffer,size_t size);
int   xl_file_close(void *handle);

alias xl_io_handler xl_file_handler;
