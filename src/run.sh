SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# ダウンロード＆コンパイル
wget https://www.sqlite.org/2019/sqlite-autoconf-3290000.tar.gz
tar xf sqlite-autoconf-3290000.tar.gz
wget https://www.sqlite.org/contrib/download/extension-functions.c?get=25
mv ./extension-functions.c?get=25 ./extension-functions.c
gcc -shared -I "./sqlite-autoconf-3290000" -o libExtensionFunctions.so extension-functions.c

# 0.841470984807897
sqlite3 :memoy: \
".load ./libExtensionFunctions.so" \
"select sin(1);"

