--
--  AppDelegate.applescript
--  Word Count
--
--  Created by tw on 10/8/18.
--  Copyright © 2018 Teddy Wing. All rights reserved.
--
--  This file is part of Word Count.
--
--  Word Count is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  Word Count is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with Word Count. If not, see <https://www.gnu.org/licenses/>.
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

	on applicationShouldTerminateAfterLastWindowClosed_(sender)
		return YES
	end applicationShouldTerminateAfterLastWindowClosed_

end script
