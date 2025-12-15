#!/usr/bin/env fish

function __cd_dots_complete
    # Current token being completed (the argument to cd)
    set -l token (commandline -ct)

    # If it doesn't start with dots, just fall back to normal directory completion
    if not string match -rq '^\.+(/.*)?$' -- $token
        __fish_complete_directories $token "Directory"
        return
    end

    # Split "....../rest/of/path" into the dot-part and the rest
    set -l parts (string split -m 1 / -- $token)
    set -l dots $parts[1]
    set -l rest ""
    if test (count $parts) -gt 1
        set rest $parts[2]
    end

    # depth = number of dots - 1 (so ".." -> 1, "..." -> 2, etc.)
    set -l depth (math (string length $dots) - 1)
    if test $depth -lt 0
        set depth 0
    end

    # Build the real prefix: "../" repeated depth times
    set -l prefix (string repeat -n $depth "../")

    # Combine with the remainder after the slash (if any)
    set -l base "$prefix$rest"

    # Ask fish's built-in helper to complete directories for that expanded path
    __fish_complete_directories $base "Directory"
end

