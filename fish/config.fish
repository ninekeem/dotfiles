if status is-interactive
    # Commands to run in interactive sessions can go here
	set -Ue GPG_TTY
	set -Ux GPG_TTY (tty)
	set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end

set fish_greeting
