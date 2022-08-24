Configuration = {}

-- Command
Configuration.Command = "axon" -- Command which activates bodycam. Only put alphabetical letters in or numbers, no /, @'s ect because I havent fully tested such thing.
Configuration.CommandSuggest = "/axon" -- Put command above after / or keep blank if you dont want any message to pop up when doing the command
Configuration.MessageSuggest = "Toggle the setup for the AXON Bodycam 2021 Model" -- Put message what comes in the command suggestion it will show like CommandSuggestion MessageSuggestion, example: "Toggle the setup for the AXON Bodycam 2021 Model"

-- Camera Modes
Configuration.FirstPerson = true -- Turn to false if you want people to not be able to activate their bodycam in First Person
Configuration.ThirdPersonClose = true -- Turn to false if you want people to not be able to activate their bodycam in Close Third Person
Configuration.ThirdPersonMid = true -- Turn to false if you want people to not be able to activate their bodycam in Medium Third Person
Configuration.ThirdPersonFar = true -- Turn to false if you want people to not be able to activate their bodycam in Far Third Person
Configuration.ThirdPersonCinematic = true -- Turn to false if you want people to not be able to activate their bodycam in Cinematic Third Person

-- Notify type
Configuration.Notify = "None" -- Check below for what things to put in "" for your type of notification
Configuration.Time = "0" -- Time for Notification to display (OkOk Notify, if not using keep to 0)

--[[

OkOk Notify - "OkOk"

Mythic Notify - "Mythic"

K5 Notify - "K5"

Infinity Notify - "Infinity"
]]
