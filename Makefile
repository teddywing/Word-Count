.PHONY: release
release:
	xcodebuild -scheme 'Word Count' -configuration Release

.PHONY: clean-release
clean-release:
	xcodebuild -project 'Word Count.xcodeproj' \
		-configuration Release \
		clean

.PHONY: archive
archive: clean-release release
	xcodebuild -project 'Word Count.xcodeproj' \
		-scheme 'Word Count' \
		-configuration Release \
		archive \
		-archivePath build/Release.xcarchive

	xcodebuild \
		-exportArchive \
		-archivePath build/Release.xcarchive \
		-exportOptionsPlist export-options.plist \
		-exportPath build

.PHONY: zip
zip: archive
	cd build; \
	zip -r 'Word Count.zip' 'Word Count.app'
