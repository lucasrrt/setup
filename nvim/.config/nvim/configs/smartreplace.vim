" Replacing strings with the correct first letter case

" TODO interactive mode equivalent to :s in which the user can choose
" if should replace or keep the old value in all file
function! SmartCaseReplaceInline(old_string, new_string, capitalized_old_string, capitalized_new_string)
  let current_line = getline('.')
  execute "set noignorecase"
  let new_line = substitute(current_line, a:old_string, a:new_string, "g")
  let new_line = substitute(new_line, a:capitalized_old_string, a:capitalized_new_string, "g")
  execute "set ignorecase"
  call setline('.', new_line)
endfunction

function! SmartCaseReplace() range
  call inputsave()
  let old_string = input('Old string: ')
  let new_string = input('New string: ')
  call inputrestore()

  let capitalized_old_string = substitute(old_string, "^.", "\\u\\0", "")
  let capitalized_new_string = substitute(new_string, "^.", "\\u\\0", "")

  if a:firstline == a:lastline
    call SmartCaseReplaceInline(old_string, new_string, capitalized_old_string, capitalized_new_string)
  else
    '<,'>call SmartCaseReplaceInline(old_string, new_string, capitalized_old_string, capitalized_new_string)
  endif
endfunction
