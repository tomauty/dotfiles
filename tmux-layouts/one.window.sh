# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Work/app"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "Vim"

# Split window into panes.
run_cmd "vim"

# Set active pane.
select_pane 0
