" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim
syn keyword vanaStatement	False, None, True
syn keyword vanaStatement	as assert break continue del exec global
syn keyword vanaStatement	lambda nonlocal pass print return with yield
syn keyword vanaStatement	class def nextgroup=vanaFunction skipwhite
syn keyword vanaConditional	elif else if
syn keyword vanaRepeat	for while
syn keyword vanaOperator	and in is not or
syn keyword vanaException	except finally raise try
syn keyword vanaInclude	from import
syn keyword vanaAsync		async await
syn match   vanaDecorator	"@" display nextgroup=vanaFunction skipwhite
syn match   vanaFunction
      \ "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained
syn match   vanaComment	"#.*$" contains=vanaTodo,@Spell
syn keyword vanaTodo		FIXME NOTE NOTES TODO XXX contained
syn region  vanaString matchgroup=vanaQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=vanaEscape,@Spell
syn region  vanaString matchgroup=vanaTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
      \ contains=vanaEscape,vanaSpaceError,vanaDoctest,@Spell
syn region  vanaRawString matchgroup=vanaQuotes
      \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=@Spell
syn region  vanaRawString matchgroup=vanaTripleQuotes
      \ start=+[uU]\=[rR]\z('''\|"""\)+ end="\z1" keepend
      \ contains=vanaSpaceError,vanaDoctest,@Spell

syn match   vanaEscape	+\\[abfnrtv'"\\]+ contained
syn match   vanaEscape	"\\\o\{1,3}" contained
syn match   vanaEscape	"\\x\x\{2}" contained
syn match   vanaEscape	"\%(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match   vanaEscape	"\\N{\a\+\%(\s\a\+\)*}" contained
syn match   vanaEscape	"\\$"

if exists("vana_highlight_all")
  if exists("vana_no_builtin_highlight")
    unlet vana_no_builtin_highlight
  endif
  if exists("vana_no_doctest_code_highlight")
    unlet vana_no_doctest_code_highlight
  endif
  if exists("vana_no_doctest_highlight")
    unlet vana_no_doctest_highlight
  endif
  if exists("vana_no_exception_highlight")
    unlet vana_no_exception_highlight
  endif
  if exists("vana_no_number_highlight")
    unlet vana_no_number_highlight
  endif
  let vana_space_error_highlight = 1
endif

if !exists("vana_no_number_highlight")
  " numbers (including longs and complex)
  syn match   vanaNumber	"\<0[oO]\=\o\+[Ll]\=\>"
  syn match   vanaNumber	"\<0[xX]\x\+[Ll]\=\>"
  syn match   vanaNumber	"\<0[bB][01]\+[Ll]\=\>"
  syn match   vanaNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
  syn match   vanaNumber	"\<\d\+[jJ]\>"
  syn match   vanaNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
  syn match   vanaNumber
	\ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
  syn match   vanaNumber
	\ "\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

if !exists("vana_no_builtin_highlight")
  syn keyword vanaBuiltin	False True None
  syn keyword vanaBuiltin	NotImplemented Ellipsis __debug__
  syn keyword vanaBuiltin	abs all any bin bool bytearray callable chr
  syn keyword vanaBuiltin	classmethod compile complex delattr dict dir
  syn keyword vanaBuiltin	divmod enumerate eval filter float format
  syn keyword vanaBuiltin	frozenset getattr globals hasattr hash
  syn keyword vanaBuiltin	help hex id input int isinstance
  syn keyword vanaBuiltin	issubclass iter len list locals map max
  syn keyword vanaBuiltin	memoryview min next object oct open ord pow
  syn keyword vanaBuiltin	print property range repr reversed round set
  syn keyword vanaBuiltin	setattr slice sorted staticmethod str
  syn keyword vanaBuiltin	sum super tuple type vars zip __import__
  syn keyword vanaBuiltin	basestring cmp execfile file
  syn keyword vanaBuiltin	long raw_input reduce reload unichr
  syn keyword vanaBuiltin	unicode xrange
  syn keyword vanaBuiltin	ascii bytes exec
  syn keyword vanaBuiltin	apply buffer coerce intern
  syn match   vanaAttribute	/\.\h\w*/hs=s+1 contains=ALLBUT,vanaBuiltin transparent
endif

if !exists("vana_no_exception_highlight")
  syn keyword vanaExceptions	BaseException Exception
  syn keyword vanaExceptions	ArithmeticError BufferError
  syn keyword vanaExceptions	LookupError
  syn keyword vanaExceptions	EnvironmentError StandardError
  syn keyword vanaExceptions	AssertionError AttributeError
  syn keyword vanaExceptions	EOFError FloatingPointError GeneratorExit
  syn keyword vanaExceptions	ImportError IndentationError
  syn keyword vanaExceptions	IndexError KeyError KeyboardInterrupt
  syn keyword vanaExceptions	MemoryError NameError NotImplementedError
  syn keyword vanaExceptions	OSError OverflowError ReferenceError
  syn keyword vanaExceptions	RuntimeError StopIteration SyntaxError
  syn keyword vanaExceptions	SystemError SystemExit TabError TypeError
  syn keyword vanaExceptions	UnboundLocalError UnicodeError
  syn keyword vanaExceptions	UnicodeDecodeError UnicodeEncodeError
  syn keyword vanaExceptions	UnicodeTranslateError ValueError
  syn keyword vanaExceptions	ZeroDivisionError
  syn keyword vanaExceptions	BlockingIOError BrokenPipeError
  syn keyword vanaExceptions	ChildProcessError ConnectionAbortedError
  syn keyword vanaExceptions	ConnectionError ConnectionRefusedError
  syn keyword vanaExceptions	ConnectionResetError FileExistsError
  syn keyword vanaExceptions	FileNotFoundError InterruptedError
  syn keyword vanaExceptions	IsADirectoryError NotADirectoryError
  syn keyword vanaExceptions	PermissionError ProcessLookupError
  syn keyword vanaExceptions	RecursionError StopAsyncIteration
  syn keyword vanaExceptions	TimeoutError
  syn keyword vanaExceptions	IOError VMSError WindowsError
  syn keyword vanaExceptions	BytesWarning DeprecationWarning FutureWarning
  syn keyword vanaExceptions	ImportWarning PendingDeprecationWarning
  syn keyword vanaExceptions	RuntimeWarning SyntaxWarning UnicodeWarning
  syn keyword vanaExceptions	UserWarning Warning
  syn keyword vanaExceptions	ResourceWarning
endif

if exists("vana_space_error_highlight")
  syn match   vanaSpaceError	display excludenl "\s\+$"
  syn match   vanaSpaceError	display " \+\t"
  syn match   vanaSpaceError	display "\t\+ "
endif

if !exists("vana_no_doctest_highlight")
  if !exists("vana_no_doctest_code_highlight")
    syn region vanaDoctest
	  \ start="^\s*>>>\s" end="^\s*$"
	  \ contained contains=ALLBUT,vanaDoctest,@Spell
    syn region vanaDoctestValue
	  \ start=+^\s*\%(>>>\s\|\.\.\.\s\|"""\|'''\)\@!\S\++ end="$"
	  \ contained
  else
    syn region vanaDoctest
	  \ start="^\s*>>>" end="^\s*$"
	  \ contained contains=@NoSpell
  endif
endif

syn sync match vanaSync grouphere NONE "^\s*\%(def\|class\)\s\+\h\w*\s*("

if version >= 508 || !exists("did_vana_syn_inits")
  if version <= 508
    let did_vana_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink vanaStatement	Statement
  HiLink vanaConditional	Conditional
  HiLink vanaRepeat		Repeat
  HiLink vanaOperator		Operator
  HiLink vanaException	Exception
  HiLink vanaInclude		Include
  HiLink vanaAsync		Statement
  HiLink vanaDecorator	Define
  HiLink vanaFunction		Function
  HiLink vanaComment		Comment
  HiLink vanaTodo		Todo
  HiLink vanaString		String
  HiLink vanaRawString	String
  HiLink vanaQuotes		String
  HiLink vanaTripleQuotes	vanaQuotes
  HiLink vanaEscape		Special
  if !exists("vana_no_number_highlight")
    HiLink vanaNumber		Number
  endif
  if !exists("vana_no_builtin_highlight")
    HiLink vanaBuiltin	Function
  endif
  if !exists("vana_no_exception_highlight")
    HiLink vanaExceptions	Structure
  endif
  if exists("vana_space_error_highlight")
    HiLink vanaSpaceError	Error
  endif
  if !exists("vana_no_doctest_highlight")
    HiLink vanaDoctest	Special
    HiLink vanaDoctestValue	Define
  endif

  delcommand HiLink
endif

let b:current_syntax = "vana"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=8 noet:
