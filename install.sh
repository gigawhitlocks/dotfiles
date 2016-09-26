#!/usr/bin/env bash
# This is free and unencumbered software released into the public domain.

# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.

# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

# For more information, please refer to <http://unlicense.org>

#                                         ......
#                                .,;;xOkk0NWNNNN0c.
#                           ...cONWWWWMMMMMMMMMMMWXd:;cxOkol:.
#                        .cOXNWMMMMWNWMMMMMMMMMMMMMMMWMMMMWNWXl:,.
#                   ..,lkKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNWWNWNXKOx;
#               .'cx0KXNNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMWNWWNWMWXkoc.
#              .dkk0XWMWWWWWWNNWMMMMMMMMMMMMMMMMMWWWWWWWNNNNXXKKNWWMMMMMMMNo.
#          .;cclOKkxx0NWMWNKXNNWMMMMWWWWWWWWWWNXXNNWNX000KK0OOOOXXXWMMMMMMMMNd.
#         :k0OxkX0kdodk0K0K000KXKKNWWNNKK0O0KKXK00OOkOOkxk0XNWWWMWWMMMMMMMMMMMK'
#        :kk0KXNWNNX0OKNNX0kdddllodk0KXNWWWNXKXXKOOOKNN0OOKNWMMMMMMMMMMMMWWWWMMo
#     .coxONWMMWWWWNXXNX0xoodd:.  ..,cox0KNX0XNK0xdkKXX0OkOXNWWMMMMMMMMMMWWMMMM0.
#     .oOKWMWWWWWWN0ddl'..,cc,.         ..'lkKN0o;,:dkxooooxO00XWMMMMWNWMMMMMMMWO'
#      .OWMWWWMWXd:'..    .,,.               '::'....',,';ccclldOKNWWNXKNMMMMMMMMK'
#      :NMMMMMW0c'..                                 .....,;;:cloxO0KXXKKNWWWWMMMWd
#      cWMMMWXx;,'..                                  ....',;:::loxO00KKKNXXNXNMMWK;
#    oOKWMMM0l;''...                                 ....'',;:::clokKXXXNMWXXKKNNN0'
#   ;NWMMMMNd;,.....                                  ...',,;::::cokXWMMMMMMWWNWNNO'
#  .OWWMMMWKd:,....                                ......'',,;:::clxXMMMMMMMMMMMMWW0'
# .OWMMMMMN0xc;'...                          ..';codkkxolldxxxkkOOOO0WMMMMMMMMMMMMMMK,
# .kNMMMMWKOkdc'......                ...,:oxO0KNWMMMMMMMMMMMMMMMMWXWMMNNNWMMMMMMMMMM0'
#   ;NMMMN0Okdc'... .................';cokKWMMMMMMMMMMMMMMMMMMMMMMMMMMMWXXXMMMMMMMMMMX,
#   'XMMMWKkdl;,;:::clooollllcc:;,'',ckKNWMMMMMMMMMMMMMMMMMMMMMMMMMMW00XWNXWMMMMMMMMMX;
#   cMMMMWKOxdx0NWWWWWMMWWWWWWWNXXKXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKXNMMWWMMMMMMMMNc
#   oMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWc
#   dMMMMWXONMMMMMMMMMMMMMMMMMMMMMMX00WMMMMMMMMMMMMMMMMMMMMMMMMMMN0WMMMMMMMMMMMMMMW0,
#   dWWMMXOXWMMMMMMMMMMMMMMMMMMMMKc.  'oXMMMMMMMMMMMMMMMMMMMMMMMMXKWX00OO0NMMMMMMMNOl;.
#   ;NMMMMMMMMMMMMMMMMMMMMMMMMMMMo.     ,KMMMMMMMMMMMMMMNNMMMMMMMMMKllloodKMMMMMMMWWX0o.
#    oMMMMMMMMMMMMMMMMMMMMMMMMMMNc.      'xNMMMMMMMMMMMMMMMMMMMMMW0lclooodkKXNWWXxldXO;.
#    .xWMMMMMMMMMMMMMMMMMMMMMMMWO:.       .:kXMMMMMMMMMMMMMMMMMMMNxcllooddddddXMXOd;;,..
#      dMMMMMMMMMMMMMMMMMMMMMMMKo,.      ....;OWMMMMMMMMMMMMMMMMWXdllloodxddold0KK0l'...
#      ,NMMMMMMMMMMMMMMMMMMMMW0xl,.      ..'',;lk00K0Okxdooooodxxolclloddxddol;.'lo;'''.
#      ,XMMMMMMMMMMMMMMMMMW0dloxl'.     .......,lolc:,''..'',,;::ccclloodxdddl'..'''';Oc
#     .xWMMMMMMMMMMMWX0xoc'..;:coc,....'';,,''.'clllllc::;;;;;:ccclllloodddddl'......;l.
#     ,XMMMWWWMMW0dc'.      ':cxXX0xddddxk0K0Okdc..';loollcccccccllllloodddddl,....'.
#      xMMMMWWWKl.          ;kKWMMMMWWMMMMWWWMWO,...',:loodooolllllllloodddxxdl;;;,.
#      cXWMMWWNx,..         oNWMMMMMMMMMXd:;ccc,'''''';:coddddooooolllooddddxxc.'..
#      .c0MMMWNkc'..       .OMMMMMMMMNOdc'........''',;::cloddooolllllloodxxxd'
#        cNMMWNKd:,'.......'oO0XWNX0o'..'.........'',,:cclooollllcllooooodxkkx;
#         ,cxXWNOoc;'''''..',,,:c::;,'..';::;;::c:::::ccloooolcccccloodddxkkkxl
#           .oXNKxl:,''''',;::;,;;cox00kkkOO0KXXNXXXKKOkxollllccclloodddxkOOOkd.
#             dNKxo:'...';:codddOXNWMWWNXKK0OkOOOOkkxooollooollllooddxxkkO00Okx.
#             .KNOoc'. ..'clxKNWWWNXKOkkxxdolcc:;,'''',,;:codooddddxkkOO0KK0Okk;
#              lNXko;.    .:dkkxxxdddolcc:;;,,'..''''',;;:lodddxxkkOO00KXXX0Oxx:
#               cdOOo;..   .,:::cc::;,,,;;:::::;;;;;;::clloddxkk00KKKXXNNNX0kxxl
#                 cX0d:'....,::,,;:cllccclooolllcccccloodddxxkO0KXNNNWWWWNKkdddo.
#                .dNWXOdc:;;coollccloddddoolllccccclloddddxxkO0XNWWWMMMMWXOdoodo.
#                 .cKMWNKOxdxkOOkxxxxdoolc::cc:;,,;;:cllodxkOKNWWMMMMMMMXkdloooo'
#                   .cOWMMWXK0KK000Oxooc:,',;;;;,,,,:cloddxOKNWWMMMMMMWXkoollloo:...
#                      l0NWMMWWNKOkxdoloc:,;;:lllccldxxxkk0XNMMMMMMMMXOdllcllooolokNOdoc,
#                        .;KMMMMWX0OkkdddolllodxxxxkkOO00KNWMMMMMMMWKxocccclloolcco0MMWWNx.
#                          .lXMMMMWWNXXXK0OkkkOKXXXKXXNWWMMMMMMMMWXkolccccclllcccclxXWX0KX0l.
#                            ;0WMMMMMMMMMMWWNWWMMMMMMMMMMMMMMMMMXkollllllllcccccccldKNX00OOKKo.
#                              ':OMMMMMMMMMMMMMMMMMMMMMMMMMMMMXOdooooollolc:::::cccOWNX000OkOKk'
#                                ;XMMMMMMMMMMMMMMMMMMMMMMMMWXOdddoooloolc::::::::coXWNX0K000OkOkd,
#                                 :XMMMMMMMMMMMMMMMMMMMMMMNOxddddooollcc::;;:::::dXMMMWNXKK0OOOkkx;
#                                 .0MMMMMMMMMMMMMMMMMMMMWKkdddddoollcc::::::::::dNMMMMMMWXKOOOOOxxxl'.
#                                  :XMMMMMMMMMMMMMMMMMMNOxxxxdddollcccc::::;;;;lXMMMMMMMMMNK0OkkkkOxkkxxxxxdc;,;:;'
#                                   :0NMMMMMMMMMMMMMMMXkxxxxddoolcccccc:::;;;::0MMMMMMMMMMMMMWKOkkOk00XXXXKOdcloood
#                                     lWMMMMMMMMMMMMWKkxxxddooolllccccc:::::::oNMMMMMMMMMMMMMMMWNXKOO0KXXdlllloooxx
#                                     .0MMMMMMMMMMWXOxxddddoooolllcccccc::c::o0MMMMMMMMMMMMMMMMMMMWWNNX0Ooc:cooccol
#                                     .kWMMMMMMMMN0kxdxddddoooolllccccccccccoKWMMMMMMMMMMMWWWMMMWMMMMMWXK0OOOOxlloc
#                                  ,kocOWMMMMMMWKOkkxxxddddddooolllclllllcoONWWMMMMMMMMMMMWWWWWWWMMWMMMMMMWNNNXXKKK
#                                  :WMMMMMMMMMN0OOkkkxxxxxddddoooollllooldXMMMMMMMMMMMMMMMMMMWWWWWWWMMMMWX0000K000N
#                                 .0MMMMMMMMMWKOOOOkkkkkkxxxdddooooooloookWMMMMMMMMMMMMMMMMMMMWWWMWNWWWWN0OO00KKKKW

set -euo pipefail
IFS=$'\n\t'
source .layers.sh # customize what you want by changing the layers in this untracked file
INSTALL_COMMAND=""

bindkey -v
bindkey '^R' history-incremental-search-backward
# detect OS
if [[ -e /etc/redhat-release ]]; then
   # dnf install -yq python emacs
    echo 'fedora or cent'
    if [[ $(grep Fedora /etc/redhat-release) ]]; then
        echo 'fedora'
        dnf install python3 python3-pip python3-virtualenv
        # set up rpmfusion & set `dnf install` as INSTALL_COMMAND
    else
        echo 'centos'
        # packages are the same but repos are not
    fi
fi

if [[ -e /etc/lsb-release ]]; then
    apt-get install -yq python emacs
fi

if [[ $(uname -a | grep Darwin) ]]; then
    echo 'osx wamp wamp'
    # not implemented
fi

# spacemacs
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
ln -s $(pwd)/emacs/spacemacs ~/.spacemacs


# functions that work everywhere
function md () {
    # requires pandoc
	  pandoc -s -f markdown -t man "$@" | groff -T utf8 -man
}

