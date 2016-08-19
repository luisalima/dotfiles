fancy_echo "installing other binaries..."

BINARIES=('google-chrome' slack sourcetree gpgtools sketch rescuetime macdown dropbox whatsapp postman)
for BINARY in "${BINARIES[@]}"
do
    brew cask install $BINARY
done
