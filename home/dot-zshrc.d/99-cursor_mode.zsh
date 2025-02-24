# See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
function zle-keymap-select {
  if
    [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]];
  then
    echo -ne '\e[2 q'
  elif
    [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]];
  then
    echo -ne '\e[5 q'
  fi
}

zle-line-init() {
  echo -ne '\e[5 q'
}

zle -N zle-keymap-select
zle -N zle-line-init
