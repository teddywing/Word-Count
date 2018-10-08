release:
	xcodebuild -scheme 'Word Count' -configuration Release

clean-release:
	xcodebuild -project 'Word Count.xcodeproj' \
		-configuration Release \
		clean

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
