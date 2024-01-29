--/* 
-- ██████╗░██╗░░░██╗██████╗░███████╗██╗░░░██╗███████╗░██████╗████████╗███╗░░██╗██╗██╗░░██╗
-- ██╔══██╗██║░░░██║██╔══██╗██╔════╝██║░░░██║██╔════╝██╔════╝╚══██╔══╝████╗░██║██║██║░██╔╝
-- ██████╦╝██║░░░██║██████╔╝█████╗░░╚██╗░██╔╝█████╗░░╚█████╗░░░░██║░░░██╔██╗██║██║█████═╝░
-- ██╔══██╗██║░░░██║██╔══██╗██╔══╝░░░╚████╔╝░██╔══╝░░░╚═══██╗░░░██║░░░██║╚████║██║██╔═██╗░
-- ██████╦╝╚██████╔╝██║░░██║███████╗░░╚██╔╝░░███████╗██████╔╝░░░██║░░░██║░╚███║██║██║░╚██╗
-- ╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══╝╚═╝╚═╝░░╚═╝*/

Config = {}

--The ability to embed your own exports to hide the hud
Config.useHudOffOnEvents = true
function hudOnEvent()
    DisplayRadar(true)
    --exports.Burevestnik_hud:Burevestnik_hud_on() -- Uncomment if you use Burevestnik_HUD system (https://burevestnik.tebex.io/package/5371893)
end
function hudOffEvent()
   DisplayRadar(false)
   --exports.Burevestnik_hud:Burevestnik_hud_off() -- Uncomment if you use Burevestnik_HUD system (https://burevestnik.tebex.io/package/5371893)
end

--Translation config
Config.Translation = {
	['translationText1'] = 'Turn the lock',
	['translationText2'] = 'Turn the lock pick',
	['translationText3'] = 'Exit',
}

--Exports
--exports.Burevestnik_lockpick_minigame:Burevestnik_lockpick_minigame_start()  --Export to start
--exports.Burevestnik_lockpick_minigame:Burevestnik_lockpick_minigame_stop()  --Export to close