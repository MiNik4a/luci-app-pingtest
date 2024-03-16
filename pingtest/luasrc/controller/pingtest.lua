module("luci.controller.pingtest", package.seeall)

function index()
    entry({"admin", "network", "pingtest"}, cbi("pingtest"), _("Ping Test"), 60)
    entry({"admin", "network", "pingtest", "status"}, call("action_status")).leaf = true
end

function action_status()
    local uci = require "luci.model.uci".cursor()
    local domain = uci:get("pingtest", "settings", "domain") or "www.baidu.com"
    local count = uci:get("pingtest", "settings", "count") or 5
    local sleep_time = uci:get("pingtest", "settings", "sleep_time") or 300
    local restart_wan = uci:get("pingtest", "settings", "restart_wan") or 0

    local ipv4_status = os.execute("ping -c " .. count .. " " .. domain .. " > /dev/null 2>&1")
    local ipv6_status = os.execute("ping6 -c " .. count .. " " .. domain .. " > /dev/null 2>&1")

    if ipv6_status ~= 0 and restart_wan == "1" then
        os.execute("ifup wan_6")
    end

    luci.http.prepare_content("application/json")
    luci.http.write_json({ ipv4 = ipv4_status == 0, ipv6 = ipv6_status == 0 })
end