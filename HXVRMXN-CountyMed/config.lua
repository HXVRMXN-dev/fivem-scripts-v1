config = {}
config.Webhook = "Discord Only Suckas" -- Put your discord webhook to log who sends who to hospital or unhospitalizes someone.

-- Time Features
config.MaxTime = 300 -- Max limit of months if someone goes over this they will still only do this amount of time in hospital.
config.DefaultTime = 50 -- Default Time of months if someone doesn't put a number.

-- Ace Perms Features
config.EnableAce = true
config.AllPerms = "cm.allperms" -- The ace perm to give a certain ace group or person access to both /uncm and /cm (Hospitalize or unhospitalize)
config.SendPerms = "cm.hospitalize" -- The ace perm to give a certain ace group or person access to /cm (Hospitalize)
config.ReleasePerms = "cm.unhospitalize" -- The ace perm to give a certain ace group or person access to /uncm (unhospitalize)

-- Notify Features

--[[
  ______                          __                             ______                                
 /      \                        |  \                           /      \                               
|  $$$$$$\ ______   ______ ____   \$$ _______    ______        |  $$$$$$\  ______    ______   _______  
| $$   \$$/      \ |      \    \ |  \|       \  /      \       | $$___\$$ /      \  /      \ |       \ 
| $$     |  $$$$$$\| $$$$$$\$$$$\| $$| $$$$$$$\|  $$$$$$\       \$$    \ |  $$$$$$\|  $$$$$$\| $$$$$$$\
| $$   __| $$  | $$| $$ | $$ | $$| $$| $$  | $$| $$  | $$       _\$$$$$$\| $$  | $$| $$  | $$| $$  | $$
| $$__/  \ $$__/ $$| $$ | $$ | $$| $$| $$  | $$| $$__| $$      |  \__| $$| $$__/ $$| $$__/ $$| $$  | $$
 \$$    $$\$$    $$| $$ | $$ | $$| $$| $$  | $$ \$$    $$       \$$    $$ \$$    $$ \$$    $$| $$  | $$
  \$$$$$$  \$$$$$$  \$$  \$$  \$$ \$$ \$$   \$$ _\$$$$$$$        \$$$$$$   \$$$$$$   \$$$$$$  \$$   \$$
                                               |  \__| $$                                              
                                                \$$    $$                                              
                                                 \$$$$$$                                               
]]