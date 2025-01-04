function syncconf --description 'pulls and pushes my .config directory'
  git -C ~/.config pull
  git -C ~/.config add ~/.config
  git -C ~/.config commit -m "sync"
  git -C ~/.config push

end

