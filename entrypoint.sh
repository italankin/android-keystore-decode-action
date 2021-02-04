#!/bin/sh

mkdir -p $INPUT_OUTPUT_DIR
SECRET_PLAIN="$INPUT_OUTPUT_DIR/.secret_plain"

echo "$INPUT_ENCRYPTED_KEYSTORE" | base64 -d > $SECRET_PLAIN || exit 1
gpg --quiet --batch --yes --decrypt --passphrase="$INPUT_DECRYPT_PASSWORD" \
    --output "$INPUT_OUTPUT_DIR/$INPUT_KEYSTORE_NAME" $SECRET_PLAIN || exit 1
rm $SECRET_PLAIN

PROPS="$INPUT_OUTPUT_DIR/$INPUT_PROPERTIES_NAME"
echo "keystore=keystore-release/release.keystore" > $PROPS
echo "keystore_password=$INPUT_KEYSTORE_PASSWORD" >> $PROPS
echo "alias=$INPUT_KEY_ALIAS" >> $PROPS
echo "alias_password=$INPUT_KEY_ALIAS_PASSWORD" >> $PROPS