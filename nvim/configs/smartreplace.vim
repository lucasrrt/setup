" Replacing strings with the correct first letter case

" TODO interactive mode equivalent to :s in which the user can choose
" if should replace or keep the old value in all file
function! SmartCaseReplaceInline(old_string, new_string)
  let capitalized_old_string = substitute(a:old_string, "^.", "\\u\\0", "")
  let capitalized_new_string = substitute(a:new_string, "^.", "\\u\\0", "")

  let current_ignorecase_setting = &ignorecase
  set noignorecase

  let current_line = getline('.')
  let new_line = substitute(current_line, a:old_string, a:new_string, "g")
  let new_line = substitute(new_line, capitalized_old_string, capitalized_new_string, "g")
  call setline('.', new_line)

  let &ignorecase = current_ignorecase_setting
endfunction

function! SmartCaseReplace() range
  call inputsave()
  let old_string = input('Old string: ')
  let new_string = input('New string: ')
  call inputrestore()

  if a:firstline == a:lastline
    call SmartCaseReplaceInline(old_string, new_string)
  else
    '<,'>call SmartCaseReplaceInline(old_string, new_string)
  endif
endfunction
