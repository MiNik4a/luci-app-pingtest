m = Map("pingtest", translate("Ping Test Settings"))

s = m:section(TypedSection, "settings", translate("Settings"))
s.anonymous = true

o = s:option(Value, "domain", translate("Domain"))
o.default = "www.baidu.com"
o.datatype = "hostname"

o = s:option(Value, "count", translate("Ping Count"))
o.default = 5
o.datatype = "uinteger"

o = s:option(Value, "sleep_time", translate("Ping Count"))
o.default = 300
o.datatype = "uinteger"


o = s:option(Flag, "restart_wan", translate("Restart WAN on IPv6 failure"))
o.default = 0

return m