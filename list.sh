#!/bin/bash
#====================================================
#	SCRIPT: CONEXAO DARKSSH MANAGER
#   DATA ATT:   28 de Set 2020
#	DESENVOLVIDO POR:	CRAZY_VPN
#	CONTATO TELEGRAM:	http://t.me/crazy_vpn
#	CANAL TELEGRAM:	http://t.me/darkssh
#====================================================
_lvk=$(wget -qO- https://raw.githubusercontent.com/sbatrow/DARKSSH-MANAGER/master/Install/versao)
IP=$(wget -qO- darqkssh.xyz/meuip.php)
IP2=$(wget -qO- http://whatismyip.akamai.com/)
[[ "$IP" != "$IP2" ]] && ipdovps="$IP2" || ipdovps="$IP"
echo -e "$ipdovps" >/etc/IP
lst=$1 && lst1=$2 && lst2=$3 && key1=$4 && key2=crz
echo -e "Asia/Jakarta" >/etc/timezone
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime >/dev/null 2>&1
dpkg-reconfigure --frontend noninteractive tzdata >/dev/null 2>&1
[[ -z $lst1 ]] && {
	rm -rf $_Ink/list >/dev/null 2>&1 && cat /dev/null >~/.bash_history && history -c && exit 0
}
[[ ! -d /etc/DARKssh ]] && mkdir /etc/DARKssh
[[ ! -d /etc/DARKssh/senha ]] && mkdir /etc/DARKssh/senha
[[ ! -e /etc/DARKssh/Exp ]] && touch /etc/DARKssh/Exp
[[ ! -d /etc/DARKssh/userteste ]] && mkdir /etc/DARKssh/userteste
[[ ! -d /etc/DARKssh/.tmp ]] && mkdir /etc/DARKssh/.tmp
[[ ! -d /etc/bot ]] && mkdir /etc/bot
[[ ! -d /etc/bot/info-users ]] && mkdir /etc/bot/info-users
[[ ! -d /etc/bot/arquivos ]] && mkdir /etc/bot/arquivos
[[ ! -d /etc/bot/revenda ]] && mkdir /etc/bot/revenda
[[ ! -d /etc/bot/suspensos ]] && mkdir /etc/bot/suspensos
[[ ! -e /etc/bot/lista_ativos ]] && touch /etc/bot/lista_ativos
[[ ! -e /etc/bot/lista_suspensos ]] && touch /etc/bot/lista_suspensos
echo -e 'by: @CRAZY_VPN' >/usr/lib/darkssh && cat /usr/lib/darkssh >$lst2/licence && cat /usr/lib/darkssh > /etc/DARKssh/.tmp/crazy
netstat -nplt | grep -w 'apache2' | grep -w '80' && sed -i "s/Listen 80/Listen 81/g" /etc/apache2/ports.conf && service apache2 restart
[[ "$(grep -o '#Port 22' /etc/ssh/sshd_config)" == "#Port 22" ]] && sed -i "s;#Port 22;Port 22;" /etc/ssh/sshd_config && service ssh restart
grep -v "^PasswordAuthentication" /etc/ssh/sshd_config >/tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >>/etc/ssh/sshd_config
_dir1='/bin'
_dir2='/etc/DARKssh'
rm $_dir2/ShellBot.sh $_dir2/cabecalho $_dir2/open.py $_dir2/proxy.py >/dev/null 2>&1
_mdls=("addhost" "delhost" "alterarsenha" "criarusuario" "expcleaner" "mudardata" "remover" "criarteste" "verifbot" "droplimiter" "alterarlimite" "ajuda" "sshmonitor" "badvpn" "userbackup" "instsqd" "blockt" "otimizar" "menu" "speedtest" "banner" "senharoot" "reiniciarservicos" "reiniciarsistema" "attscript" "conexao" "delscript" "detalhes" "botssh" "infousers" "slow_dns" "verifatt" "limiter" "uexpired" "cabecalho" "bot" "open.py" "proxy.py")
for _arq in ${_mdls[@]}; do
	[[ -e $_dir1/$_arq ]] && rm $_dir1/$_arq >/dev/null 2>&1
	wget -c -P $_dir1 https://raw.githubusercontent.com/sbatrow/DARKSSH-MANAGER/master/Modulos/$_arq
	chmod +x $_dir1/$_arq
done
mv $_dir1/cabecalho $_dir1/bot $_dir1/open.py $_dir1/proxy.py $_dir2
_arq_host="/etc/hosts"
_host[0]="d1n212ccp6ldpw.cloudfront.net"
_host[1]="dns.whatsapp.net"
_host[2]="portalrecarga.vivo.com.br/recarga"
_host[3]="navegue.vivo.com.br/controle/"
_host[4]="navegue.vivo.com.br/pre/"
_host[5]="www.whatsapp.net"
_host[6]="/SSHPLUS?"
for host in ${_host[@]}; do
	if [[ "$(grep -w "$host" $_arq_host | wc -l)" = "0" ]]; then
		sed -i "3i\127.0.0.1 $host" $_arq_host
	fi
done
[[ ! -e /etc/autostart ]] && {
	echo '#!/bin/bash
clear
#INICIO AUTOMATICO' >/etc/autostart
	chmod +x /etc/autostart
} || {
	[[ $(ps x | grep "bot_plus" | grep -v grep | wc -l) != '0' ]] && wget -qO- https://raw.githubusercontent.com/shellscriptx/shellbot/master/ShellBot.sh >/etc/DARKssh/ShellBot.sh
	for proc in $(ps x | grep 'dmS' | grep -v 'grep' | awk {'print $1'}); do
		screen -r -S "$proc" -X quit
	done
	screen -wipe >/dev/null
	echo '#!/bin/bash
clear
#INICIO AUTOMATICO' >/etc/autostart
	chmod +x /etc/autostart
}
crontab -r >/dev/null 2>&1
(
	crontab -l 2>/dev/null
	echo "@daily /bin/verifatt"
	echo "@reboot /etc/autostart"
	echo "* * * * * /etc/autostart"
	echo "0 */6 * * * /bin/uexpired"
) | crontab -
echo "$_lvk" | sed -n '1 p' | cut -d' ' -f2 >/bin/versao && cat /bin/versao >/home/darkssh
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 >/dev/null 2>&1
chmod +x jq-linux64 && mv jq-linux64 $(which jq)
service cron restart >/dev/null 2>&1
service ssh restart >/dev/null 2>&1
[[ -d /var/www/html/openvpn ]] && service apache2 restart >/dev/null 2>&1
rm -rf $lst1/list >/dev/null 2>&1
