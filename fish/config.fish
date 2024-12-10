if status is-interactive
    # Commands to run in interactive sessions can go here
	set -Ue GPG_TTY
	set -Ux GPG_TTY (tty)
end

set fish_greeting
