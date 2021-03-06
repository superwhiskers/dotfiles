;;;; neoformat.fnl - neoformat configuration
;;;;
;;;; Permission to use, copy, modify, and/or distribute this software for any
;;;; purpose with or without fee is hereby granted.
;;;;
;;;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
;;;; REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
;;;; AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
;;;; INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
;;;; LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
;;;; OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
;;;; PERFORMANCE OF THIS SOFTWARE.

(module config.neoformat {autoload {nvim aniseed.nvim}})

;;; formatter definitions

(set nvim.g.neoformat_haskell_ormolu {:exe :ormolu})
(set nvim.g.neoformat_fennel_fnlfmt {:exe :fnlfmt :args [:--fix] :replace 1})

;;; formatter selection

(set nvim.g.neoformat_enabled_haskell [:ormolu])
(set nvim.g.neoformat_enabled_fennel [:fnlfmt])
