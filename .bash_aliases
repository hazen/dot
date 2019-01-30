alias ll='ls -al'
alias ls='gls --color=auto'
alias egrep='gegrep --color=auto'
alias grep='ggrep --color=auto'

alias hibernateon="sudo pmset -a hibernatemode 5"
alias hibernateoff="sudo pmset -a hibernatemode 0"
alias hibernatedefault="sudo pmset -a hibernatemode 3"
alias nodashboard="defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Show/Hide Desktop icons during presentations or when overwhelmed
alias HideDesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias ShowDesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Turn on/off notification center
alias SoAnnoying="launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist"
alias BugMeAgain="launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist"

# SSH
if [ -n "`ifconfig | grep ^en0`" ]; then
    # Mac
    MY_IP=`ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}'`
fi
if [ -n "`ifconfig | grep ^eth0`" ]; then
    # Debian
    MY_IP=`ifconfig eth0 | grep inet | grep -v inet6 | awk '{print $2}' | cut -d: -f2`
fi
alias flush="sudo discoveryutil mdnsflushcache; sudo discoveryutil udnsflushcaches"
alias tunnel.britannia="/usr/bin/ssh -N -v -p 5190 -C -D 1080 hazen@britannia.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.iplayer="/usr/bin/ssh -N -v -p 5190 -C -D ${MY_IP}:1080 hazen@britannia.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.telly="/usr/bin/ssh -N -v -p 5191 -C -D 1080 hazen@britannia.dyndns.biz -L 3389:127.0.0.1:3389"
alias tunnel.mom="/usr/bin/ssh -N -v -p 5190 -C hazen@heimat.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.mom2="/usr/bin/ssh -N -v -p 5191 -C hazen@heimat.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.dad="/usr/bin/ssh -N -v -p 5191 -C hazen@espresso.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.candy="/usr/bin/ssh -N -v -p 5190 -C hazen@espresso.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.angie="/usr/bin/ssh -N -v -p 5190 -C hazen@peewee.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.eurybia="/usr/bin/ssh -N -v -p 5190 -C -D 1090 hazen@javajolt.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.scylla="/usr/bin/ssh -N -v -p 5191 -C -D 1090 hazen@javajolt.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.direct="mv ~/.ssh/config ~/.ssh/config.off"
alias tunnel.proxy="mv ~/.ssh/config.off ~/.ssh/config"
alias reset.open="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user"
alias tunnel.fastmail="ssh -f -L 20465:mail.messagingengine.com:465 javajolt.dyndns.biz -N -p5190"
alias tunnel.gmail="ssh -f -L 30465:smtp.googlemail.com:465 javajolt.dyndns.biz -N -p5190"
alias tunnel.reverse="ssh -R 19999:localhost:22 -p5190 javajolt.dyndns.biz"

alias unixX="ssh -X -p 8890 localhost"
alias eurybia="ssh -p 5190 javajolt.dyndns.biz"
alias scylla="ssh -p 5191 javajolt.dyndns.biz"
alias sftp_eurybia="sftp -oPort=5190 javajolt.dyndns.biz"
alias sftp_hyperion="sftp -oPort=5191 javajolt.dyndns.biz"
alias britannia="ssh -p 5190 britannia.dyndns.biz"
alias sftp_britannia="sftp -oPort=5190 britannia.dyndns.biz"
alias h="history"
alias git-scoreboard="git log | grep '^Author' | sort | uniq -ci | sort -r"
alias g="git"
alias d="docker"
alias dc="docker-compose"
alias pg"PGPASSWORD=postgres psql -U postgres -h localhost -d gigsmart_dev"
alias virtualbox="export VAGRANT_DEFAULT_PROVIDER=virtualbox"
alias safe_reboot="sudo fdesetup authrestart -delayminutes -1"

# Dev
if which otool > /dev/null; then
    alias ldd="otool -L"
fi
# otool -L /usr/local/libiconv-1.13.1/lib/libiconv.2.dylib
# lipo -info /usr/local/libiconv-1.13.1/lib/libiconv.2.dylib
function locate {
    find . -type f -exec grep -l "$1" {} \;
}
function sync-scylla {
    rsync -avz --delete -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress "$PWD/$1" "scylla.local:$PWD"
}
function sync-themis {
    rsync -avz --delete -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress "$PWD/$1" "themis.local:$PWD"
}
function image-clean {
   docker rmi `docker images | grep "$1" | awk '{print $3;}'`
}
