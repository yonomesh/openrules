.PHONY: adguardhome sing anti-ad clean push
adguardhome:
	- rm -rf ./adguardhome/*
	git clone  --depth=1 https://github.com/AdguardTeam/HostlistsRegistry.git
	bash -c 'mv ./HostlistsRegistry/{assets,filters} ./adguardhome/'

sing:
	- rm -rf ./sing/*
	git clone  --branch sing --depth=1 https://github.com/MetaCubeX/meta-rules-dat.git
	bash -c 'mv ./meta-rules-dat/* ./sing/'

anti-ad:
	- rm -rf anti-ad/*
	git clone --depth=1 https://github.com/privacy-protection-tools/anti-AD.git
	bash -c 'mv ./anti-AD/anti-ad-adguard.txt ./antiad/'

clean:
	- rm -rf HostlistsRegistry
	- rm -rf meta-rules-dat
	- rm -rf anti-AD

push:
	- git add --all
	- git commit -m "update $(shell date +'%Y%m%d%H%M%S')"
	- git push
