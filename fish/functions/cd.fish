function cd
    set -l num_dots (string match -r '^\.+$' $argv[1])
    if test -n "$num_dots"
        set -l depth (math (string length $num_dots) - 1)
        # Create a string with the correct number of "../"
        set -l target_path (string repeat -n $depth "../")
        # Use eval to expand the path and call cd with the repeated "../"
        eval builtin cd $target_path
    else
        # If it's a regular 'cd' command, pass the arguments normally
        builtin cd $argv
    end
end
