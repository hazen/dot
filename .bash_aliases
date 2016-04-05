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

# Thomson Reuters
alias authoxy="sudo networksetup -setwebproxy 'Thunderbolt Ethernet' 127.0.0.1 8080; sudo networksetup -setsecurewebproxy 'Thunderbolt Ethernet' 127.0.0.1 8080; sudo networksetup -setwebproxy Wi-Fi 127.0.0.1 8080; sudo networksetup -setsecurewebproxy Wi-Fi 127.0.0.1 8080"
alias noproxy="sudo networksetup -setautoproxystate 'Thunderbolt Ethernet' off; sudo networksetup -setautoproxystate Wi-Fi off; sudo networksetup -setwebproxystate 'Thunderbolt Ethernet' off; sudo networksetup -setsecurewebproxystate 'Thunderbolt Ethernet' off; sudo networksetup -setwebproxystate Wi-Fi off; sudo networksetup -setsecurewebproxystate Wi-Fi off"
alias mtufix="sudo ifconfig ppp0 mtu 1300; sudo dscacheutil -flushcache"

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
# Angie's host is Playtime
alias tunnel.angie="/usr/bin/ssh -N -v -p 5190 -C hazen@peewee.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.tethys="/usr/bin/ssh -N -v -p 5190 -C -D 1090 hazen@javajolt.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.hyperion="/usr/bin/ssh -N -v -p 5191 -C -D 1090 hazen@javajolt.dyndns.biz -L 5901:127.0.0.1:5900"
alias tunnel.direct="mv ~/.ssh/config ~/.ssh/config.off"
alias tunnel.proxy="mv ~/.ssh/config.off ~/.ssh/config"
alias reset.open="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user"
alias tunnel.mumble="ssh -f -L 6880:basho.mumble.com:6880 javajolt.dyndns.biz -N -p5190"
alias tunnel.fastmail="ssh -f -L 20465:mail.messagingengine.com:465 javajolt.dyndns.biz -N -p5190"
alias tunnel.gmail="ssh -f -L 30465:smtp.googlemail.com:465 javajolt.dyndns.biz -N -p5190"

alias unixX="ssh -X -p 8890 localhost"
alias tethys="ssh -p 5190 javajolt.dyndns.biz"
alias hyperion="ssh -p 5191 javajolt.dyndns.biz"
alias britannia="ssh -p 5190 britannia.dyndns.biz"
alias startriak="for i in {1..5}; do ~/dev/riak/dev/dev\$i/bin/riak start; done"
alias stopriak="for i in {1..5}; do ~/dev/riak/dev/dev\$i/bin/riak stop; done"
alias colo="rsync -avz -e ssh riak-c-client hazen@r2s20:~/dev/clients/c"
alias h="history"
alias git-scoreboard="git log | grep '^Author' | sort | uniq -ci | sort -r"
alias virtualbox="export VAGRANT_DEFAULT_PROVIDER=virtualbox"
alias make_list="rm list; echo -n "time ./riak_test -c rtdev " > list ; ls -1 tests/ts_* tests/riak_shell* | cut -d/ -f2 | cut -d. -f1 | awk '{print "-t",$1;}' | sed ':a;N;$!ba;s/\n/ /g' >> list; chmod 755 list"

# Dev
if which otool > /dev/null; then
    alias ldd="otool -L"
fi
# otool -L /usr/local/libiconv-1.13.1/lib/libiconv.2.dylib
# lipo -info /usr/local/libiconv-1.13.1/lib/libiconv.2.dylib
function locate {
    find . -type f -exec grep -l "$1" {} \;
}
function sync-hyperion {
    rsync -avz --delete -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress "$PWD/$1" "hyperion.local:$PWD"
}
function sync-satyr {
    rsync -avz --delete -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress "$PWD/$1" "satyr.local:$PWD"
}
export S3CMD=s3cmd
if [ -f /usr/local/Cellar/s3cmd/1.0.1/bin/s3cmd ]; then
    export S3CMD=/usr/local/Cellar/s3cmd/1.0.1/bin/s3cmd
fi
function upload_mumble {
    ${S3CMD} put --acl-public $1 s3://share.basho/mumble/$1
}
function upload_talk {
    ${S3CMD} put --acl-public $1 s3://share.basho/talks/$1
}
