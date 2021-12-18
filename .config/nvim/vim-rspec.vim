Plug 'thoughtbot/vim-rspec'

let g:rspec_command = '!bundle exec rspec {spec}'
map ,t :call RunCurrentSpecFile()<CR>
map ,s :call RunNearestSpec()<CR>
map ,l :call RunLastSpec()<CR>
map ,a :call RunAllSpecs()<CR>


