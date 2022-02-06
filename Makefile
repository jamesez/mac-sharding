VERSION = 1.0
PRODUCT = shard

BINARY = shard
SWIFT_OUT = .build/apple/Products/Release/${PRODUCT}

CODESIGN_IDENTITY = "Developer ID Application: Pork Chop Software, LLC (PNC9632PM4)"

${BINARY}:
	swift build -c release --product ${PRODUCT}  --arch arm64 --arch x86_64 || /usr/bin/true
	xcrun codesign -s ${CODESIGN_IDENTITY} \
               --options=runtime \
               --timestamp \
               ${SWIFT_OUT}
	rm -rf out || true
	mkdir -p Binaries
	cp ${SWIFT_OUT} Binaries/${BINARY}

.PHONY: build
build: ${BINARY}

.PHONY: clean
clean:
	rm -rf Binaries .build
