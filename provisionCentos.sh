line=""
n=0

loopAccounts() {
	for line in "alan" "ansible";do 
		n=$((n+1))
		createAccount 
		getsshKey
		if [ $n -eq 1 ]; then
			createDoDir
		fi
	done
	updateSystem
	#installTools
	sudoersAllow
	flushIptables
}


# For development goals all these accounts are provided with sudo rights
createAccount() {
	useradd -d /home/$line -m -c "$line account" -U -G wheel -s /bin/bash $line
	mkdir /home/$line/.ssh
	chmod 700 /home/$line/.ssh
	touch /home/$line/.ssh/authorized_keys
	chmod 600 /home/$line/.ssh/authorized_keys
	chown -R $line.$line /home/$line/.ssh
}

getsshKey() {
	if [ -f /tmp/key.pub ]; then
		cat /tmp/key.pub > /home/$line/.ssh/authorized_keys
	else
		curl -fLo /tmp/key.pub https://raw.githubusercontent.com/alangomezhuerta/dotfiles/master/utils/wsl01_id_rsa.pub	
		cat /tmp/key.pub > /home/$line/.ssh/authorized_keys	
	fi
}

updateSystem() {
	#yum -y update
	echo "Nothing here"
}

createDoDir() {
	mkdir /do && chown $line.$line /do
}

installTools() {
	echo "TODO"
}

sudoersAllow() {
	# TODO:  adapt this code--> perl -pi.bak -e 's/,tcp,/,udp,/' /etc/sudoers
	echo "%wheel   ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
}

flushIptables() {
	iptables -F
}

echo "+------------------------------------------------+"
echo "|Script for provisioning is starting             |"
echo "+------------------------------------------------+"

loopAccounts
echo "+------------------------------------------------+"
echo "|Provisioning is done                            |"
echo "+------------------------------------------------+"

