echo "Path used to search for executables:"
echo $PATH
echo ""
read -p "Press [Enter] key to continue..."
echo ""
echo "IP address for FIU.EDU:"
nslookup fiu.edu | tail -3
echo "" 
read -p "Press [Enter] key to continue..."
echo ""
netstat -natp 2> /dev/null
echo ""
read -p "Press [Enter] key to continue..."
echo ""
echo "Routers used to reach google:"
mtr --report-cycles=1 --split --raw google.com
echo ""
read -p "Press [Enter] key to continue..."
echo ""
echo "Local IP Addresses:"
ifconfig | grep "inet addr:"
echo ""

