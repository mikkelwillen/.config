# Run this once to save the original cd:
# functions -c cd cd_wrapper

function cd
    # No arguments: behave like normal cd
    if test (count $argv) -eq 0
        cd_wrapper
        return
    end

    set -l arg $argv[1]

    # Split the first argument into:
    #   first = leading component (could be "...", "....", etc.)
    #   rest  = everything after the first "/"
    set -l parts (string split -m 1 / -- $arg)
    set -l first $parts[1]
    set -l rest ""
    if test (count $parts) -gt 1
        set rest $parts[2]
    end

    # Check if the first component is only dots (., .., ..., ...., ...)
    set -l num_dots (string match -r '^\.+$' -- $first)

    if test -n "$num_dots"
        # depth = number of dots - 1
        # "."  -> 0 (i.e. no "../")
        # ".." -> 1 ("../")
        # "..." -> 2 ("../../"), etc.
        set -l depth (math (string length $num_dots) - 1)

        # Build "../" repeated `depth` times
        set -l target_path (string repeat -n $depth "../")

        # If there is a trailing path after the dots, append it
        if test -n "$rest"
            set target_path "$target_path$rest"
        end

        cd_wrapper $target_path
    else
        # Fallback: behave like normal cd
        cd_wrapper $argv
    end
end
