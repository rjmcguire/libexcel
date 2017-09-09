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
module excel.workbook;

import excel.biffwriter;
import excel.format;
import excel.olewriter;
import excel.worksheet;
import excel.io_handler;

extern (C):

struct wbookctx {
  bwctx* biff;

  int store_in_memory;
  owctx* OLEwriter;
  int epoch1904;
  int activesheet;
  int firstsheet;
  int fileclosed;
  int biffsize;
  int codepage;
  char* sheetname;
  xl_format* tmp_format;
  xl_format* url_format;
  int xf_index;

  int sheetcount;
  wsheetctx** sheets;

  int formatcount;
  xl_format* *formats;
};

wbookctx* wbook_new(const char *filename, int store_in_memory);
wbookctx* wbook_new_ex(xl_io_handler io_handler, const char* filename, int store_in_memory);
void wbook_close(wbookctx* wb);
void wbook_destroy(wbookctx* wb);
wsheetctx*wbook_addworksheet(wbookctx* wbook, immutable(char)* sname);
xl_format* wbook_addformat(wbookctx* wbook);
