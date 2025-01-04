function haskc --wraps='stack ghc -- -w' --description 'alias haskc=stack ghc -- -w'
  stack ghc -- -w $argv
end
