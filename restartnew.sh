#!/bin/bash                                                                     
                                                                                
##                                                                              
## Reloads Wireguard tunnel when a physical interface change happens            
## Intended for use with always active full tunnels                             
##                                                                              
## Also when using a second VPN, disables the WG tunnel when                    
## enabling the alternate and vice versa                                        
##                                                                              
                                                                                
# interface names as shown by 'ip a'                                                                                           
ETH_INTERFACE=''                                                         
WIFI_INTERFACE=''                                                           
                                                         
                                                                                
if [[ "$1" == "$ETH_INTERFACE" ]] || [[ "$1" == "$WIFI_INTERFACE" ]] && [[ "$2" == "up" ]]; then
    echo "running $0: $1 $2" | systemd-cat -t nm-dispatcher                     
    sleep 2                                                                     
    wg-quick down wg0
    wg-quick up wg0                                                 
    resolvectl flush-caches                                                                                                     
fi                                                                              
                                                                                
exit 0