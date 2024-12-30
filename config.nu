# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# Ensure date string is not affected by current locale.

def create_right_prompt [] {
    let time_segment = ([
        (date now | format date "%Y-%m-%dT%H:%M")
    ] | str join)

    $time_segment
}

def create_left_prompt [] {
    ([
        '['
        (whoami)
        '@'
        (pwd | path basename)
        ']'
      ] | str join
    )
}

$env.PROMPT_INDICATOR = '$ '
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }
