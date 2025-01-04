function haski --wraps='stack exec ghci -- -w' --description 'alias haski=stack exec ghci -- -w'
  stack exec ghci -- -w $argv
end
