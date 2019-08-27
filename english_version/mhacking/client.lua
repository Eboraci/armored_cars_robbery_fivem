----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- https://github.com/Eboraci
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local carf_hash = GetHashKey('stockade')
local security = GetHashKey("s_m_m_security_01")
local security_cars_hash = GetHashKey('cognoscenti2')

local local_hack_x = 1275.682
local local_hack_y = -1710.426
local local_hack_z = 54.771
local amount = 300000
local hacking = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- HACKING
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(1)
      local ped = PlayerPedId()
      local hack_distance = GetDistanceBetweenCoords(GetEntityCoords(ped), local_hack_x, local_hack_y, local_hack_z)
      if hack_distance <=1 and not IsEntityDead(ped) and not hacking then
        drawTxt("PRESS  ~b~E~w~  TO START HACKING",4,0.5,0.93,0.50,255,255,255,180)
        if IsControlJustPressed(0, 38) and (UpdateOnscreenKeyboard() ~= 0)then
          RequestAnimDict('anim@heists@prison_heistig1_p1_guard_checks_bus')
          while not HasAnimDictLoaded('anim@heists@prison_heistig1_p1_guard_checks_bus') do
						Wait(10)
          end
          SetEntityHeading(ped,310.46)
          TaskPlayAnim(ped,'anim@heists@prison_heistig1_p1_guard_checks_bus','loop',8.0,8.0,-1,1,0,false,false,false)
          Wait(1500)
          DoScreenFadeOut(1000)
          TriggerEvent('mhacking:show')
          TriggerEvent('mhacking:start',7,20,mycb)
	  hacking = true
        end
      end
  end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIP LESTER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    local blip_l = AddBlipForCoord(1275.682,-1710.426,54.771)
    SetBlipSprite(blip_l, 77)
    SetBlipDisplay(blip_l, 4)
    SetBlipScale(blip_l, 0.7)
    SetBlipColour(blip_l, 1)
    SetBlipAsShortRange(blip_l, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Lester')
    EndTextCommandSetBlipName(blip_l)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- TEXT 
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKING AND BUILDING
-----------------------------------------------------------------------------------------------------------------------------------------
function mycb(success, timeremaining)
  if success then
    local ped = PlayerPedId()
    --TriggerEvent('chatMessage', "O lugar do carro forte está no seu gps, corra e intercepte-o.")
    TriggerEvent("Notify","sucesso","Sistema hackeado com sucesso, o carro forte esta saindo do banco 3.")
    TriggerEvent('mhacking:hide')
    DoScreenFadeIn(1000)
    Wait(1350)
    ClearPedTasks(ped)
    setupModelo(carf_hash)
    setupModelo(security_cars_hash)
    local carf_spw = CreateVehicle(carf_hash, -2959.50, 492.623, 14.81, 88.75, true, false)
    local cars_spw = CreateVehicle(security_cars_hash, -2943.69, 492.69, 15.29, 88.75, true, false)  
    local cars_spw_2 = CreateVehicle(security_cars_hash, -2971.292,493.226,15.318, true, false)
    carsinfo(carf_spw)
    carsinfo(cars_spw)
    carsinfo(cars_spw_2)
    setupModelo(security)
    local security_spw = CreatePedInsideVehicle(carf_spw, 4, security, -1, true, false)
    local security_spw_2 = CreatePedInsideVehicle(carf_spw, 4, security, 0, true, false)
    local security_spw_3 = CreatePedInsideVehicle(cars_spw, 4, security, -1, true, false)
    local security_spw_4 = CreatePedInsideVehicle(cars_spw, 4, security, 0, true, false)
    local security_spw_5 = CreatePedInsideVehicle(cars_spw, 4, security, 1, true, false)
    local security_spw_6 = CreatePedInsideVehicle(cars_spw, 4, security, 2, true, false)
    local security_spw_7 = CreatePedInsideVehicle(cars_spw_2, 4, security, -1, true, false)
    local security_spw_8 = CreatePedInsideVehicle(cars_spw_2, 4, security, 0, true, false)
    local security_spw_9 = CreatePedInsideVehicle(cars_spw_2, 4, security, 1, true, false)
    local security_spw_10 = CreatePedInsideVehicle(cars_spw_2, 4, security, 2, true, false)
    SetEntityAsMissionEntity(security_spw, 0, 0) 
    SetEntityAsMissionEntity(security_spw_2, 0, 0)
    SetEntityAsMissionEntity(security_spw_3, 0, 0) 
    SetEntityAsMissionEntity(security_spw_4, 0, 0) 
    SetEntityAsMissionEntity(security_spw_5, 0, 0)
    SetEntityAsMissionEntity(security_spw_6, 0, 0)
    SetEntityAsMissionEntity(security_spw_7, 0, 0)
    SetEntityAsMissionEntity(security_spw_8, 0, 0)
    SetEntityAsMissionEntity(security_spw_9, 0, 0)
    SetEntityAsMissionEntity(security_spw_10, 0, 0) 
    guardsinfo(security_spw)
    guardsinfo(security_spw_2)
    guardsinfo(security_spw_3)
    guardsinfo(security_spw_4)
    guardsinfo(security_spw_5)
    guardsinfo(security_spw_6)
    guardsinfo(security_spw_7)
    guardsinfo(security_spw_8)
    guardsinfo(security_spw_9)
    guardsinfo(security_spw_10)
    local blip_carf = AddBlipForEntity(carf_spw)
    SetBlipColour(blip_carf, 1)
    SetBlipRoute(blip_carf, true)
    SetBlipRouteColour(blip_carf, 5)
    TaskVehicleDriveToCoordLongrange(security_spw, carf_spw, 1847.96, 2608.26, 45.59, 16.0, 447, 1)
    TaskVehicleDriveToCoordLongrange(security_spw_3, cars_spw, 1847.96, 2608.26, 45.59, 16.0, 447, 1)
    TaskVehicleDriveToCoordLongrange(security_spw_7, cars_spw_2, 1847.96, 2608.26, 45.59, 16.0, 447, 1)
    hacking = false
    while true do
      local final = { 1847.96, 2608.26, 45.59 }
      Wait(0)
      if GetEntityCoords(carf_spw) == final  then
        DeleteEntity(carf_spw)
      elseif GetEntityCoords(cars_spw) == final then
        DeleteEntity(cars_spw)
      elseif GetEntityCoords(carf_spw_2) == final then
        DeleteEntity(cars_spw_2)
      end
      if GetVehicleBodyHealth(carf_spw) < 5.0 then
        break
      end
      money_tick(carf_spw,cars_spw,cars_spw_2)
    end
  else
    print('Falha')
    local ped = PlayerPedId()
    TriggerEvent('mhacking:hide')
    DoScreenFadeIn(1000)
    Wait(1350)
    ClearPedTasks(ped)
    hacking = false
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUILDING MODELS
-----------------------------------------------------------------------------------------------------------------------------------------
function setupModelo(modelo)
  RequestModel(modelo)
  while not HasModelLoaded(modelo) do
    RequestModel(modelo)
    Wait(10)
  end
  SetModelAsNoLongerNeeded(modelo)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GUARDS
-----------------------------------------------------------------------------------------------------------------------------------------
function guardsinfo(inputPed)
  SetPedShootRate(inputPed,  700)
  AddArmourToPed(inputPed, GetPlayerMaxArmour(security_spw)- GetPedArmour(security_spw))
  SetPedAlertness(inputPed, 3)
  SetPedAccuracy(inputPed, 81)
  SetEntityHealth(inputPed,  200)
  SetPedFleeAttributes(inputPed, false, true)
  SetPedCombatAttributes(inputPed, 46, true)
  SetPedCombatAttributes(inputPed, 0, true)
  SetPedCombatAttributes(inputPed, 2, true)
  SetPedCombatAttributes(inputPed, 52, true)
  SetPedCombatAbility(inputPed,  2)
  SetPedCombatRange(inputPed, 2)
  SetPedPathAvoidFire(inputPed,  0)
  SetPedPathCanUseLadders(inputPed,1)
  SetPedPathCanDropFromHeight(inputPed, 1)
  SetPedPathPreferToAvoidWater(inputPed, 1)
  SetPedGeneratesDeadBodyEvents(inputPed, 1)
  GiveWeaponToPed(inputPed, GetHashKey("WEAPON_COMBATPISTOL"), 5000, false, true)
  GiveWeaponToPed(inputPed, GetHashKey("WEAPON_SMG"), 5000, false, true)
  SetPedRelationshipGroupHash(inputPed, GetHashKey("security_guard"))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINISHING UP THE CARS
-----------------------------------------------------------------------------------------------------------------------------------------
function carsinfo(inputcarro)
  RequestCollisionForModel(inputcarro)
  N_0x06faacd625d80caa(inputcarro)
  SetVehicleDoorsLocked(inputcarro , 7)
  SetEntityAsNoLongerNeeded(inputcarro)
  SetVehicleOnGroundProperly(inputcarro)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENT AND CLEANING THE REST
-----------------------------------------------------------------------------------------------------------------------------------------
function money_tick(variavel, variavel_2, variavel_3)
  for i=0, 1, 1 do
    local flag = 0
    if GetVehicleDoorAngleRatio(variavel, 2) > .1 or GetVehicleDoorAngleRatio(variavel, 3) > .1 and flag == 0 then
      flag = 1
      GetEntityCoords(variavel, 1)
      local a,b,c = table.unpack(GetEntityCoords(variavel_2))
      local d,e,f = table.unpack(GetEntityCoords(variavel_3))
      local x,y,z = table.unpack(GetEntityCoords(variavel))
      money_carf = CreateAmbientPickup(GetHashKey("PICKUP_MONEY_SECURITY_CASE"), GetOffsetFromEntityInWorldCoords(variavel, 0.0, -5.0, -0.3001), 0, 300000) 
      ClearAllBlipRoutes()
      Wait(9000)
      DeleteEntity(variavel)
      DeleteEntity(variavel_2)
      DeleteEntity(variavel_3)
      hacking = false
      break
    end
  end
end
