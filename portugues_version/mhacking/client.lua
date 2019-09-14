----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- https://github.com/Eboraci
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local carrof_hash = GetHashKey('stockade')
local seguranca = GetHashKey("s_m_m_security_01")
local carro_segurancas_hash = GetHashKey('cognoscenti2')

local local_hack_x = 1275.682
local local_hack_y = -1710.426
local local_hack_z = 54.771 

local quantia = 300000
local hackeando = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- HACKEANDO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(1)
      local ped = PlayerPedId()
      local distancia_hack = GetDistanceBetweenCoords(GetEntityCoords(ped), local_hack_x, local_hack_y, local_hack_z)
      if distancia_hack <=1 and not IsEntityDead(ped) and not hackeando then
        drawTxt("PRESSIONE  ~b~E~w~  PARA HACKEAR",4,0.5,0.93,0.50,255,255,255,180)
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
	  hackeando = true
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
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- TEXTO
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
-- CHECANDO E CONSTRUINDO
-----------------------------------------------------------------------------------------------------------------------------------------
function mycb(successo, temporestante)
  if successo then
    local ped = PlayerPedId()
    --TriggerEvent('chatMessage', "O lugar do carro forte está no seu gps, corra e intercepte-o.")
    TriggerEvent("Notify","sucesso","Sistema hackeado com sucesso, o carro forte esta saindo do banco 3.")
    TriggerEvent('mhacking:hide')
    DoScreenFadeIn(1000)
    Wait(1350)
    ClearPedTasks(ped)
    setupModelo(carrof_hash)
    setupModelo(carro_segurancas_hash)
    local carrof_spw = CreateVehicle(carrof_hash, -2959.50, 492.623, 14.81, 88.75, true, false)
    local carros_spw = CreateVehicle(carro_segurancas_hash, -2943.69, 492.69, 15.29, 88.75, true, false)  
    local carros_spw_2 = CreateVehicle(carro_segurancas_hash, -2971.292,493.226,15.318, true, false)
    carrosinfo(carrof_spw)
    carrosinfo(carros_spw)
    carrosinfo(carros_spw_2)
    setupModelo(seguranca)
    local seguranca_spw = CreatePedInsideVehicle(carrof_spw, 4, seguranca, -1, true, false)
    local seguranca_spw_2 = CreatePedInsideVehicle(carrof_spw, 4, seguranca, 0, true, false)
    local seguranca_spw_3 = CreatePedInsideVehicle(carros_spw, 4, seguranca, -1, true, false)
    local seguranca_spw_4 = CreatePedInsideVehicle(carros_spw, 4, seguranca, 0, true, false)
    local seguranca_spw_5 = CreatePedInsideVehicle(carros_spw, 4, seguranca, 1, true, false)
    local seguranca_spw_6 = CreatePedInsideVehicle(carros_spw, 4, seguranca, 2, true, false)
    local seguranca_spw_7 = CreatePedInsideVehicle(carros_spw_2, 4, seguranca, -1, true, false)
    local seguranca_spw_8 = CreatePedInsideVehicle(carros_spw_2, 4, seguranca, 0, true, false)
    local seguranca_spw_9 = CreatePedInsideVehicle(carros_spw_2, 4, seguranca, 1, true, false)
    local seguranca_spw_10 = CreatePedInsideVehicle(carros_spw_2, 4, seguranca, 2, true, false)
    SetEntityAsMissionEntity(seguranca_spw, 0, 0) 
    SetEntityAsMissionEntity(seguranca_spw_2, 0, 0)
    SetEntityAsMissionEntity(seguranca_spw_3, 0, 0) 
    SetEntityAsMissionEntity(seguranca_spw_4, 0, 0) 
    SetEntityAsMissionEntity(seguranca_spw_5, 0, 0)
    SetEntityAsMissionEntity(seguranca_spw_6, 0, 0)
    SetEntityAsMissionEntity(seguranca_spw_7, 0, 0)
    SetEntityAsMissionEntity(seguranca_spw_8, 0, 0)
    SetEntityAsMissionEntity(seguranca_spw_9, 0, 0)
    SetEntityAsMissionEntity(seguranca_spw_10, 0, 0) 
    guardasinfo(seguranca_spw)
    guardasinfo(seguranca_spw_2)
    guardasinfo(seguranca_spw_3)
    guardasinfo(seguranca_spw_4)
    guardasinfo(seguranca_spw_5)
    guardasinfo(seguranca_spw_6)
    guardasinfo(seguranca_spw_7)
    guardasinfo(seguranca_spw_8)
    guardasinfo(seguranca_spw_9)
    guardasinfo(seguranca_spw_10)
    local blip_carrof = AddBlipForEntity(carrof_spw)
    SetBlipColour(blip_carrof, 1)
    SetBlipRoute(blip_carrof, true)
    SetBlipRouteColour(blip_carrof, 5)
    TaskVehicleDriveToCoordLongrange(seguranca_spw, carrof_spw, 1847.96, 2608.26, 45.59, 16.0, 447, 1)
    TaskVehicleDriveToCoordLongrange(seguranca_spw_3, carros_spw, 1847.96, 2608.26, 45.59, 16.0, 447, 1)
    TaskVehicleDriveToCoordLongrange(seguranca_spw_7, carros_spw_2, 1847.96, 2608.26, 45.59, 16.0, 447, 1)
    hackeando = false
    while true do
      local final = { 1847.96, 2608.26, 45.59 }
      Wait(0)
      if GetEntityCoords(carrof_spw) == final  then
        DeleteEntity(carrof_spw)
      elseif GetEntityCoords(carros_spw) == final then
        DeleteEntity(carros_spw)
      elseif GetEntityCoords(carrof_spw_2) == final then
        DeleteEntity(carros_spw_2)
      end
      if GetVehicleBodyHealth(carrof_spw) < 5.0 then
        break
      end
      dinheiro_tick(carrof_spw,carros_spw,carros_spw_2)
    end
  else
    print('Falha')
    local ped = PlayerPedId()
    TriggerEvent('mhacking:hide')
    DoScreenFadeIn(1000)
    Wait(1350)
    ClearPedTasks(ped)
    hackeando = false
  end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSTRUINDO MODELOS
-----------------------------------------------------------------------------------------------------------------------------------------
function setupModelo(modelo)
  RequestModel(modelo)
  while not HasModelLoaded(modelo) do
    RequestModel(modelo)
    Wait(50)
  end
  SetModelAsNoLongerNeeded(modelo)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GUARDAS
-----------------------------------------------------------------------------------------------------------------------------------------
function guardasinfo(inputPed)
  SetPedShootRate(inputPed,  700)
  AddArmourToPed(inputPed, GetPlayerMaxArmour(seguranca_spw)- GetPedArmour(seguranca_spw))
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
-- TERMINANDO DE BUILDAR OS CARROS
-----------------------------------------------------------------------------------------------------------------------------------------
function carrosinfo(inputcarro)
  RequestCollisionForModel(inputcarro)
  N_0x06faacd625d80caa(inputcarro)
  SetVehicleDoorsLocked(inputcarro , 7)
  SetEntityAsNoLongerNeeded(inputcarro)
  SetVehicleOnGroundProperly(inputcarro)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO E LIMPANDO O QUE SOBROU
-----------------------------------------------------------------------------------------------------------------------------------------
function dinheiro_tick(variavel, variavel_2, variavel_3)
  for i=0, 1, 1 do
    local flag = 0
    if GetVehicleDoorAngleRatio(variavel, 2) > .1 or GetVehicleDoorAngleRatio(variavel, 3) > .1 and flag == 0 then
      flag = 1
      GetEntityCoords(variavel, 1)
      local a,b,c = table.unpack(GetEntityCoords(variavel_2))
      local d,e,f = table.unpack(GetEntityCoords(variavel_3))
      local x,y,z = table.unpack(GetEntityCoords(variavel))
      dinheiro_carrof = CreateAmbientPickup(GetHashKey("PICKUP_MONEY_SECURITY_CASE"), GetOffsetFromEntityInWorldCoords(variavel, 0.0, -5.0, -0.3001), 0, 300000) 
      ClearAllBlipRoutes()
      Wait(9000)
      DeleteEntity(variavel)
      DeleteEntity(variavel_2)
      DeleteEntity(variavel_3)
      hackeando = false
      break
    end
  end
end
