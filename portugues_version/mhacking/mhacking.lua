mhackingCallback = {}
showHelp = false
helpTimer = 0
helpCycle = 4000

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if showHelp then
			if helpTimer > GetGameTimer() then
				showHelpText("Navegue com ~y~W,A,S,D~s~ e confirme com ~y~SPACE~s~ para o bloco esquerdo.")
			elseif helpTimer > GetGameTimer()-helpCycle then
				showHelpText("Use as setas ~y~Arrow Keys~s~ e confirme com ~y~ENTER~s~ para o bloco direito.")
			else
				helpTimer = GetGameTimer()+helpCycle
			end
			if IsEntityDead(PlayerPedId()) then
				nuiMsg = {}
				nuiMsg.fail = true
				SendNUIMessage(nuiMsg)
			end
		end
	end
end)

function showHelpText(s)
	SetTextComponentFormat("STRING")
	AddTextComponentString(s)
	EndTextCommandDisplayHelp(0,0,0,-1)
end

AddEventHandler('mhacking:show', function()
    nuiMsg = {}
	nuiMsg.show = true
	SendNUIMessage(nuiMsg)
	SetNuiFocus(true, false)
end)

AddEventHandler('mhacking:hide', function()
    nuiMsg = {}
	nuiMsg.show = false
	SendNUIMessage(nuiMsg)
	SetNuiFocus(false, false)
	showHelp = false
end)

AddEventHandler('mhacking:start', function(solutionlength, duration, callback)
    mhackingCallback = callback
	nuiMsg = {}
	nuiMsg.s = solutionlength
	nuiMsg.d = duration
	nuiMsg.start = true
	SendNUIMessage(nuiMsg)
	showHelp = true
end)

AddEventHandler('mhacking:setmessage', function(msg)
    nuiMsg = {}
	nuiMsg.displayMsg = msg
	SendNUIMessage(nuiMsg)
end)

RegisterNUICallback('callback', function(data, cb)
	mhackingCallback(data.success, data.remainingtime)
    cb('ok')
end)