# How to configure private keys for Git use under Tmux in Ubuntu and derivatives using Systemd

References:
* https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login/38980986#38980986

First we need to create an SSH socket through an agent


```
# ~/.config/systemd/user/ssh-agent.service

[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
```

Add it to the bash profile

```
# ~/.bash_profile 

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
```

Enable it
```bash
systemctl --user enable ssh-agent
systemctl --user start ssh-agent
```


Add keys to agent through ssh config
```
# ~/.ssh/config
AddKeysToAgent  yes
```

Create the git credential helper and add it to gitconfig

```bash
sudo apt-get install libsecret-1-0 libsecret-1-dev
cd /usr/share/doc/git/contrib/credential/libsecret
sudo make
git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
```

Forward all environment variables when Tmux starts

```
# ~/.tmux.conf
set -g update-environment -r
```
