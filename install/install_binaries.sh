fancy_echo "installing other binaries..."

BINARIES=('google-chrome' slack sourcetree gpgtools sketch rescuetime macdown dropbox whatsapp postman skype flux kindle send-to-kindle evernote)
for BINARY in "${BINARIES[@]}"
do
    brew cask install $BINARY
done
