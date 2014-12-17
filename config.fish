set fish_greeting ""

function yu
	yaourt -Syua --devel --noconfirm
end

function proxyon
	gsettings set org.gnome.system.proxy mode 'manual'
end

function proxyoff
	gsettings set org.gnome.system.proxy mode 'none'
end

function please
	eval sudo $history[1]
end

function whatismyip
	curl http://ipecho.net/plain; echo;
end

function Misc
    cd /home/damien/Seafile/Personal/Misc
end

function Seafile
    cd /home/damien/Seafile/Personal/
end

function NCCU
    cd /home/damien/Seafile/Personal/NCCU
end

function to-do
    vim /home/damien/Seafile/Personal/Misc/todo.txt
end

function todo
    vim /home/damien/Seafile/Personal/Misc/todo.txt
end

function sshconfig
    vim /home/damien/.ssh/config
end

function reboot
    sudo systemctl reboot
end

function shutdown
    sudo systemctl poweroff
end

function poweroff
    sudo systemctl poweroff
end

function halt
    sudo systemctl halt
end

function note
    vim /home/damien/Seafile/Personal/Misc/notes.txt
end

function notes
    vim /home/damien/Seafile/Personal/Misc/notes.txt
end
