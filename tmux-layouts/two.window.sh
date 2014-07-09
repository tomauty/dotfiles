# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Work/app"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "Develop"

# Split window into panes.

run_cmd "npm run supervise"
split_h 50    # split in half

select_pane 0     # split left pane vertically
split_v 50
select_pane 1
run_cmd "grunt"

# Set active pane.
select_pane 0
