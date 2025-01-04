function removeWindowsR --description 'remove windows return carriage'
  sudo find . -type f -exec dos2unix {} \;
        
end
