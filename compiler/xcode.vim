" Vim compiler file
" Language:   Xcode
" Function:   Syntax check and/or error reporting
" Maintainer: shoebillk <shoebillk@gmail.com>
" URL:      https://github.com/shoebillk/vim-xcode
" Release Coordinator: shoebillk <shoebillk@gmail.com> 
"
" ----------------------------------------------------------------------------

if exists("current_compiler")
  finish
endif
let current_compiler = "xcode"

if exists(":CompilerSet") != 2   " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=xcodebuild\ $*

CompilerSet errorformat=
      \%E%f:%l:%c:{%*[^}]}:\ error:\ %m,
      \%E%f:%l:%c:{%*[^}]}:\ fatal\ error:\ %m,
      \%W%f:%l:%c:{%*[^}]}:\ warning:\ %m,
      \%E%f:%l:%c:\ error:\ %m,
      \%E%f:%l:%c:\ fatal\ error:\ %m,
      \%W%f:%l:%c:\ warning:\ %m,
      \%E%f:%l:\ Error:\ %m,
      \%E%f:%l:\ error:\ %m,
      \%E%f:%l:\ fatal\ error:\ %m,
      \%W%f:%l:\ warning:\ %m

"      \%+E%f:%l:%c:\ error:\ %m,
"      \%W%f:%l:%c:\ note:\ %m,
"      \%-C%\t.*,
"      \%-Z%p^

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8:
