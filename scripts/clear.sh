docker system prune -a --volumes -f
sudo find /var/log -type f -name "*.log" -delete

#sudo journalctl --vacuum-size=200M