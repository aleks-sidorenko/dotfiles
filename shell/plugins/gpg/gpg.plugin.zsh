#!/usr/bin/env bash
 


gpg_fix() {
   gpg_agent_update_tty
   gpg_agent_restart
}

gpg_auth_socket() {
    gpgconf --list-dirs agent-ssh-socket
}

gpg_agent_update_tty() {
   gpg-connect-agent updatestartuptty /bye >/dev/null
}

gpg_agent_reload() {
   gpg-connect-agent reloadagent /bye
}

gpg_agent_restart() {
   gpg_agent_kill
   gpg_agent_launch
}

gpg_agent_service_restart() {
   systemctl --user restart gpg-agent.service gpg-agent.socket gpg-agent-ssh.socket
}

gpg_agent_kill() {
   gpgconf --kill gpg-agent
}

gpg_agent_launch() {
   gpgconf --launch gpg-agent
}


# https://musigma.blog/2021/05/09/gpg-ssh-ed25519.html
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

gpg_agent_update_tty
gpg_agent_launch
