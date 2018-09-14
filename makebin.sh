#!/bin/bash

mod="product-date-added"
zip="${mod}.ocmod.zip"

rm -rf "./bin" && mkdir "bin"

cp -v EULA.txt ./src/
cp -v README.md ./src/

cd "./src/"
zip -9 -r ${zip} "./"
mv ${zip} "../bin/"
cd ../

hideg ./bin/"${zip}"

echo DONE.
