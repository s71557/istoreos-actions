#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git passwallpackages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default

# echo 'src-git openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default
# echo 'src-git adguardhome https://github.com/rufengsuixing/luci-app-adguardhome' >>feeds.conf.default
# echo 'src-git mosdns https://github.com/sbwml/luci-app-mosdns' >>feeds.conf.default

# openclash
svn export https://github.com/s71557/lede-packages/trunk/luci-app-openclash  package/luci-app-openclash
# 加入OpenClash核心
chmod -R a+x $GITHUB_WORKSPACE/preset-clash-core.sh
if [ "$1" = "rk33xx" ]; then
    $GITHUB_WORKSPACE/preset-clash-core.sh arm64
elif [ "$1" = "rk35xx" ]; then
    $GITHUB_WORKSPACE/preset-clash-core.sh arm64
elif [ "$1" = "x86" ]; then
    $GITHUB_WORKSPACE/preset-clash-core.sh amd64
fi

# adguardhome
svn export https://github.com/s71557/lede-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome

# passwall
svn export https://github.com/s71557/lede-packages/trunk/luci-app-passwall package/luci-app-passwall
svn export https://github.com/s71557/lede-packages/trunk/openwrt-passwall-packages package/openwrt-passwall-packages
