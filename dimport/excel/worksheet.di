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
module excel.worksheet;

import excel.biffwriter;
//- #include "bsdqueue.h"
import excel.format;

extern (C):

struct col_info {
  int first_col;
  int last_col;
  int col_width;
  int xf;
  int grbit;

  //- TAILQ_ENTRY(col_info) cis;
}

struct wsheetctx {
  bwctx base;
  char* name;
  int index;
  int activesheet;
  int firstsheet;
  xl_format* url_format;
  int using_tmpfile;

  void* fp; // FILE*
  int fileclosed;
  int offset;
  int xls_rowmax;
  int xls_colmax;
  int xls_strmax;
  int dim_rowmin;
  int dim_rowmax;
  int dim_colmin;
  int dim_colmax;

  int sel_frow;
  int sel_fcol;
  int sel_lrow;
  int sel_lcol;

  //- TAILQ_HEAD(colinfo_list, col_info) colinfos;
}

wsheetctx*  wsheet_new(char *name, int index, int activesheet, int firstsheet, xl_format* url, int store_in_memory);
void wsheet_destroy(wsheetctx* xls);
int xls_write_number(wsheetctx* xls, int row, int col, double num);
int xls_write_string(wsheetctx* xls, int row, int col, immutable(char) *str);
int xls_writef_string(wsheetctx* xls, int row, int col, immutable(char) *str, xl_format* fmt);
int xls_writef_number(wsheetctx* xls, int row, int col, double num, xl_format* fmt);
int xls_write_blank(wsheetctx* xls, int row, int col, xl_format* fmt);
int wsheet_writef_formula(wsheetctx* xls, int row, int col, immutable(char) *formula, xl_format* fmt);
int wsheet_write_url(wsheetctx* wsheet, int row, int col, char *url, immutable(char) *str, xl_format* fmt);
void wsheet_close(wsheetctx* xls);
ubyte* wsheet_get_data(wsheetctx* ws, size_t *sz);
void wsheet_set_column(wsheetctx* ws, int fcol, int lcol, int width);
void wsheet_set_selection(wsheetctx* ws, int frow, int fcol, int lrow, int lcol);
void wsheet_set_row(wsheetctx* ws, int row, int height, xl_format* fmt);
