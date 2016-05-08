stty intr ^X

if pgrep -f "python /home/ryanr/.autocopy.py" &>/dev/null; then
    :
else
    nohup python -u ~/autocopy.py &> nohup.out &
fi