"============================================================================
" File:        x9g.vim
" Author:      Chris
" Version:     0.1
" Description: Scripted vim customizations
"============================================================================

function! s:CJDelTagsOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/^[^\t]*\t[^\t]*' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! g:CJUpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  call s:CJDelTagsOfFile(f)
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  let resp = system(cmd)
endfunction

function! s:CJInitTags()
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -R -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q'
  let resp = system(cmd)
endfunction

fu! g:CJTexRevInc()
	let l:winview = winsaveview()
	%s/\(\\myrevision}{\)\@<=\(\d\+\)/\=(submatch(0)+1)/e
	call winrestview(l:winview)
endfu

fu! SaveSess()
	if argc() == 0 && filereadable(getcwd() . '/.session.vim')
		execute 'mksession! ' . getcwd() . '/.session.vim'
	endif
endfunction

fu! RestoreSess()
	if argc() == 0 && filereadable(getcwd() . '/.session.vim')
		execute 'so ' . getcwd() . '/.session.vim'
		if bufexists(1)
			for l in range(1, bufnr('$'))
				if bufwinnr(l) == -1
					exec 'sbuffer ' . l
				endif
			endfor
		endif
	endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * call RestoreSess()

command! -nargs=0 CJUpdateTags call g:CJUpdateTags()
command! -nargs=0 CJInitTags call s:CJInitTags()
command! -nargs=0 CJX call s:CJDelTagsOfFile('a')
command! -nargs=0 CJTexRevInc call g:CJTexRevInc()

autocmd BufWritePost *.c,*.cc,*.cpp,*.h,*.hh,*.hpp call g:CJUpdateTags()
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd BufWritePre *.tex call g:CJTexRevInc()
