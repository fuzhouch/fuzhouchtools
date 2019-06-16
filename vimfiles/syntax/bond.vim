" Vim syntax file
" Cosmos:     Microsoft Bond schema definition
" Maintainer: Fuzhou Chen <fuzhouch@microsoft.com>
" LastChange: 18 January 2019

" quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

let filename = 'bond'

" Check for overrides. Buffer viariables have the highest priority
if exists("b:bond_type_override")
    " Check the runtimepath to see if the file exists
    if globpath(&runtimepath, 'syntax/'.b:bond_type_override.'.vim') != ''
        let filename = b:bond_type_override
    endif
elseif exists("g:bond_type_default")
    if globpath(&runtimepath, 'syntax/'.g:bond_type_default.'.vim') != ''
        let filename = g:bond_type_default
    endif
endif

" Unlike SQL, Cosmos script is case sensitive
syn case match


syn keyword bondType              int8 int16 int32 int64
syn keyword bondType              uint8 uint16 uint32 uint64
syn keyword bondType              bool
syn keyword bondType              float double
syn keyword bondType              nullable
syn keyword bondType              string wstring
syn keyword bondType              vector map set
syn keyword bondKeyword           nothing true false
syn keyword bondKeyword           struct enum namespace import
syn keyword bondKeyword           optional required

syn region  bondString            start=+"+  end=+"+ skip=+\\\\\|\\"+
syn match bondId                  "[0-9][0-9]*[ \t]*:"

" A very simplified version of comment region
syn keyword bondTodo             contained TODO FIXME XXX
syn region  bondComment          start=+/\*+ end=+\*/+ contains=bondTodo
syn match   bondLineComment      "//.*" contains=bondTODO

hi def link bondType           Type
hi def link bondCommonUsedType Type
hi def link bondKeyword        Statement
hi def link bondString         String
hi def link bondId             Label
hi def link bondLineComment    Comment
hi def link bondComment        Comment
hi def link bondTodo           Todo

let b:current_syntax = "bond"

" vim:sw=4:
