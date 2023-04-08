#!/bin/bash -li

# -l makes this behave like a login shell
# -i makes it like a interactive shell

echo There are ${BASH_ALIASES[*]} aliases denied.

for ali in "${!BASH_ALIASES[@]}"; do
        printf "Alias %-10s triggers: %s\n" "$ali" "${BASH_ALIASES[$ali]}"
done
