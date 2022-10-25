GARRYSMOD_COMMON="garrysmod_common"
GARRYSMOD_COMMON_REPOSITORY="https://github.com/danielga/garrysmod_common.git"

if [ ! -f "$GARRYSMOD_COMMON/premake5.lua" ]; then 
	echo "garrysmod_common directory is empty, doing git clone of the remote repo"
	git clone --recursive "$GARRYSMOD_COMMON_REPOSITORY" "$GARRYSMOD_COMMON"
else
	echo "garrysmod_common directory is good, pulling any latest changes"
	git -C "$GARRYSMOD_COMMON" pull
	git -C "$GARRYSMOD_COMMON" submodule update --init --recursive
fi

./premake5 --os=linux --gmcommon=./garrysmod_common gmake2

cd projects/linux/gmake2/
make
