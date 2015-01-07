alias ll='ls -al'
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
alias tunnel.britannia="/usr/bin/ssh -N -v -p 5190 -C -c 3des -D 1080 hazen@britannia.dyndns.biz -L 5901/127.0.0.1/5900"
alias tunnel.iplayer="/usr/bin/ssh -N -v -p 5190 -C -c 3des -D ${MY_IP}:1080 hazen@britannia.dyndns.biz -L 5901/127.0.0.1/5900"
alias tunnel.telly="/usr/bin/ssh -N -v -p 5199 -C -c 3des -D 1080 hazen@britannia.dyndns.biz -L 3389/127.0.0.1/3389"
alias tunnel.mom="/usr/bin/ssh -N -v -p 5190 -C -c 3des hazen@heimat.dyndns.biz -L 5901/127.0.0.1/5900"
alias tunnel.dad="/usr/bin/ssh -N -v -p 5191 -C -c 3des hazen@espresso.dyndns.biz -L 5901/127.0.0.1/5900"
alias tunnel.candy="/usr/bin/ssh -N -v -p 5190 -C -c 3des hazen@espresso.dyndns.biz -L 5901/127.0.0.1/5900"
# Angie's host is Playtime
alias tunnel.angie="/usr/bin/ssh -N -v -p 5190 -C -c 3des hazen@peewee.dyndns.biz -L 5901/127.0.0.1/5900"
alias tunnel.home="/usr/bin/ssh -N -v -p 5190 -C -c 3des -D 1090 hazen@javajolt.dyndns.biz -L 5901/127.0.0.1/5900"
alias tunnel.direct="mv ~/.ssh/config ~/.ssh/config.off"
alias tunnel.proxy="mv ~/.ssh/config.off ~/.ssh/config"
alias reset.open="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user"
alias tunnel.mumble="ssh -f -L 6880:basho.mumble.com:6880 javajolt.dyndns.biz -N -p5190"
alias tunnel.fastmail="ssh -f -L 20465:mail.messagingengine.com:465 javajolt.dyndns.biz -N -p5190"
alias tunnel.gmail="ssh -f -L 30465:smtp.googlemail.com:465 javajolt.dyndns.biz -N -p5190"

alias unix="ssh -p 8890 localhost"
alias unixX="ssh -X -p 8890 localhost"
alias home="ssh -p 5190 javajolt.dyndns.biz"
alias minimus="ssh -p 5190 minimus.local"
alias britannia="ssh -p 5190 britannia.dyndns.biz"
alias startriak="for i in {1..5}; do ~/dev/riak/dev/dev\$i/bin/riak start; done"
alias stopriak="for i in {1..5}; do ~/dev/riak/dev/dev\$i/bin/riak stop; done"
alias colo="rsync -avz -e ssh riak-c-client hazen@r2s20:~/dev/clients/c"
alias h="history"

# Dev
if which otool > /dev/null; then
    alias ldd="otool -L"
fi
# otool -L /usr/local/libiconv-1.13.1/lib/libiconv.2.dylib
# lipo -info /usr/local/libiconv-1.13.1/lib/libiconv.2.dylib
function locate {
    find . -type f -exec grep -l "$1" {} \;
}
function upload_mumble {
    s3cmd put --acl-public $1 s3://share.basho/mumble/$1
#    s3cmd put --acl-public $1 s3://mumble/$1
}
function upload_talk {
    s3cmd put --acl-public $1 s3://share.basho/talks/$1
}
