function WriteToLog(message)
	local home = os.getenv("HOME") or os.getenv("USERPROFILE")
	local log_path = home .. "/fidget.log"
	local log_file = io.open(log_path, "a")
	if log_file then
		local timestamp = os.date("%Y-%m-%d %H:%M:%S")
		log_file:write(string.format("[%s] %s\n", timestamp, message))
		log_file:close()
	else
		print("Error: Unable to open log file at " .. log_path)
	end
end
