
function wifi
    set ssid (nmcli -f SSID d wifi list | sort | uniq | grep -v -F -e 'SSID' -e '--' | string trim | fzf --header "Please select a wifi network")
    if test -n "$ssid"
	nmcli d wifi connect -a $ssid
    end
end
