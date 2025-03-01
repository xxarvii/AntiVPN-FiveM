-- Configuration
local vpnApi = "https://api.vpnapi.io/api/v1/ip/" -- Exemple d'API de vérification de VPN
local timeout = 5000 -- Délai d'attente pour la requête API en ms

-- Fonction pour vérifier si une adresse IP est associée à un VPN
function isVpn(ip)
    local headers = {
        ["User-Agent"] = "FiveM Anti-VPN"
    }
    local response = PerformHttpRequest(vpnApi.. ip, "GET", headers, "", true, timeout)
    
    if response == "404" then
        -- Si l'API retourne 404, cela signifie que l'IP n'est pas associée à un VPN
        return false
    elseif response == "200" then
        -- Si l'API retourne 200, cela signifie que l'IP est associée à un VPN
        return true
    else
        -- Si l'API retourne une autre réponse, on considère que l'IP n'est pas associée à un VPN
        return false
    end
end

-- Événement pour vérifier les joueurs lorsqu'ils se connectent
AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    local player = source
    local identifiers = GetPlayerIdentifiers(player)
    local ip = nil
    
    -- Récupération de l'adresse IP du joueur
    for _, identifier in ipairs(identifiers) do
        if string.match(identifier, "ip:") then
            ip = identifier:split(":")[2]
            break
        end
    end
    
    if ip then
        -- Vérification si l'adresse IP est associée à un VPN
        if isVpn(ip) then
            -- Si l'IP est associée à un VPN, on refuse la connexion
            deferrals.done("Vous utilisez un VPN, ce qui est interdit sur ce serveur.\n\nPour jouer sur notre serveur, vous devez désactiver votre VPN et essayer de vous reconnecter.\n\nSi vous avez des questions ou des problèmes, n'hésitez pas à contacter notre équipe de support.\n\nMerci de votre compréhension et à bientôt sur le serveur!")
        else
            -- Si l'IP n'est pas associée à un VPN, on autorise la connexion
            deferrals.done()
        end
    else
        -- Si on ne parvient pas à récupérer l'adresse IP, on refuse la connexion
        deferrals.done("Impossible de vérifier votre adresse IP.")
    end
end)