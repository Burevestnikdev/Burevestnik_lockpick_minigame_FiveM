-- /* 
-- ██████╗░██╗░░░██╗██████╗░███████╗██╗░░░██╗███████╗░██████╗████████╗███╗░░██╗██╗██╗░░██╗
-- ██╔══██╗██║░░░██║██╔══██╗██╔════╝██║░░░██║██╔════╝██╔════╝╚══██╔══╝████╗░██║██║██║░██╔╝
-- ██████╦╝██║░░░██║██████╔╝█████╗░░╚██╗░██╔╝█████╗░░╚█████╗░░░░██║░░░██╔██╗██║██║█████═╝░
-- ██╔══██╗██║░░░██║██╔══██╗██╔══╝░░░╚████╔╝░██╔══╝░░░╚═══██╗░░░██║░░░██║╚████║██║██╔═██╗░
-- ██████╦╝╚██████╔╝██║░░██║███████╗░░╚██╔╝░░███████╗██████╔╝░░░██║░░░██║░╚███║██║██║░╚██╗
-- ╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══╝╚═╝╚═╝░░╚═╝*/

---------------------------------------Function
local Promise = nil

RegisterNUICallback('bur_exit_lockpick_minigame', function(data)
	if Config.useHudOffOnEvents then
		hudOnEvent()
	end
    burevestnikGameDone()
end)

RegisterNUICallback('bur_done_lockpick_minigame', function(data)
	if Config.useHudOffOnEvents then
		hudOnEvent()
	end
	burevestnikGameDone()
	Promise:resolve(true)
end)

RegisterNUICallback('bur_undone_lockpick_minigame', function(data)
	if Config.useHudOffOnEvents then
		hudOnEvent()
	end
	burevestnikGameDone()
	Promise:resolve(false)
end)

burevestnikGameDone = function()
	SendNUIMessage({showUI = false;})
    SetNuiFocus(false,false)
end

burevestnikGameStart = function()
	if Config.useHudOffOnEvents then
		hudOffEvent()
	end
	SendNUIMessage({
		showUI = true, 
		text1 = Config.Translation['translationText1'],
		text2 = Config.Translation['translationText2'],
		text3 = Config.Translation['translationText3'],
	})
	SetNuiFocus(true,true)

	Promise = promise.new()

    local result = Citizen.Await(Promise)
    return result
end

exports('Burevestnik_lockpick_minigame_start', function()
	return burevestnikGameStart()
end)

exports('Burevestnik_lockpick_minigame_stop', function()
    burevestnikGameDone()
end)