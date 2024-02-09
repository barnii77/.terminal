# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .terminal/bashrc if it exists
    if [ -f "$HOME/.terminal/bashrc" ]; then
	. "$HOME/.terminal/bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Cargo
. "$HOME/.cargo/env"

# create openai api key env var
. "$HOME/.terminal/.bash_openai_api_key"

# Create a tmux session on startup
if [ -z "$ONROOTSHELLINIT" ]; then
  # create env var to avoid recursion
  export ONROOTSHELLINIT=1
  # launch with env var inheritance
  # NOTE: will launch with name 0 regardless of specified name
  tmux -L 0
fi
