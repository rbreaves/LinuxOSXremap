stty intr ^X

if pgrep -f "python /home/user/.autocopy.py" &>/dev/null; then
    :
else
    nohup python -u ~/.autocopy.py &> nohup.out &
fi