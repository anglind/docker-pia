#!/bin/sh
OPENVPN_OPTIONS=""
DEFAULT_VPN_REGION="ireland"

if [ -n "$REGION" ]; then
    OPENVPN_OPTIONS="$OPENVPN_OPTIONS --config ${REGION}.openvpn"
else
    echo "No VPN region set. Defaulting to $DEFAULT_VPN_REGION"
    OPENVPN_OPTIONS="$OPENVPN_OPTIONS --config $DEFAULT_VPN_REGION.ovpn"
fi

if [ -n "$USERNAME" -a -n "$PASSWORD" ]; then
    echo "$USERNAME" > auth.conf
    echo "$PASSWORD" >> auth.conf
    OPENVPN_OPTIONS="$OPENVPN_OPTIONS --auth-user-pass auth.conf"
else
    echo "No credentials passed"
fi

echo "OpenVPN options: $OPENVPN_OPTIONS"
openvpn $OPENVPN_OPTIONS
