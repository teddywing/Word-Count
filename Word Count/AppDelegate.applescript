--
--  AppDelegate.applescript
--  Word Count
--
--  Created by tw on 10/8/18.
--  Copyright © 2018 tw. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property theWindow : missing value
    property fileName : missing value
	property theCharacters : missing value
	property theWords : missing value
	property theParagraphs : missing value
	
	on applicationWillFinishLaunching_(aNotification)
		tell application "TextEdit"
			set top_document to document 1

            set l_name to name of top_document
			set l_chars to count characters of top_document
			set l_words to count words of top_document
			set l_paragraphs to count paragraphs of top_document
		end tell

        fileName's setStringValue_(l_name)
		theCharacters's setStringValue_(l_chars)
		theWords's setStringValue_(l_words)
		theParagraphs's setStringValue_(l_paragraphs)
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script
