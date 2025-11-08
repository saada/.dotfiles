# Clockify CLI Helper Functions
#
# Quick time tracking functions for clockify-cli
#
# CONFIGURATION:
# Set your default project here (change "Diffuse" to your project name)
set -g CLOCKIFY_DEFAULT_PROJECT "Diffuse"
#
# USAGE:
#   cin "description"        - Clock in to default project with description
#   cin                      - Clock in interactively (prompts for details)
#   cout                     - Clock out of current timer
#   ctimer                   - Show current timer (table view)
#   ctimer --live            - Show live updating timer with colors
#   cedit "new description"  - Edit current timer's description
#   cedit                    - Edit current timer interactively
#
# EXAMPLES:
#   cin "webapp auth work"
#   ctimer --live
#   cedit "webapp auth and user sessions"
#   cout
#
# REQUIREMENTS:
#   - clockify-cli (https://github.com/lucassabreu/clockify-cli)
#   - jq (for ctimer --live)
#   - watch (for ctimer --live)

function cin --description 'Clock in to default project'
    if test (count $argv) -eq 0
        # Interactive mode if no description
        clockify-cli in -p $CLOCKIFY_DEFAULT_PROJECT
    else
        # Non-interactive with description
        clockify-cli in -i=0 -p $CLOCKIFY_DEFAULT_PROJECT -d "$argv"
    end
end

function cout --description 'Clock out of current timer'
    clockify-cli out
end

function ctimer --description 'Show current timer (pass --live for live updating view)'
    if test "$argv[1]" = "--live"
        watch -t -n 1 --color 'clockify-cli show current -j | jq -r ".[] | \"\u001b[1;35m⏱\u001b[0m  \u001b[1;32m\" + (now - (.timeInterval.start | fromdateiso8601) | floor | . as \$s | ((\$s/3600)|floor|tostring) + \"h \" + (((\$s%3600)/60)|floor|tostring) + \"m \" + ((\$s%60)|tostring) + \"s\") + \"\u001b[0m  \u001b[1;35m│\u001b[0m  \u001b[1;36m\" + .description + \"\u001b[0m  \u001b[1;35m│\u001b[0m  \u001b[0;35m\" + .project.name + \"\u001b[0m\""'
    else
        clockify-cli show current
    end
end

function cedit --description 'Edit current timer description'
    if test (count $argv) -eq 0
        # Interactive mode
        clockify-cli edit current
    else
        # Non-interactive with new description
        clockify-cli edit current -i=0 -d "$argv"
    end
end
