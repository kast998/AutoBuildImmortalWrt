#!/bin/sh

# 网络设置
if [ "$count" -eq 1 ]; then
  uci set network.lan.proto='dhcp'
elif [ "$count" -gt 1 ]; then
  uci set network.lan.ipaddr='192.168.1.1'
fi

# 设置所有网口可访问网页终端
uci delete ttyd.@ttyd[0].interface

# 设置所有网口可连接 SSH
uci set dropbear.@dropbear[0].Interface=''
uci commit

# 设置编译作者信息
FILE_PATH="/etc/openwrt_release"
NEW_DESCRIPTION="Compiled by wukongdaily"
sed -i "s/DISTRIB_DESCRIPTION='[^']*'/DISTRIB_DESCRIPTION='$NEW_DESCRIPTION'/" "$FILE_PATH"

exit 0
