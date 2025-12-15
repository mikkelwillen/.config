#!/usr/bin/env fish

# Add extra completions for cd that go through our dot-expander
complete -c cd -f -a '(__cd_dots_complete)'

