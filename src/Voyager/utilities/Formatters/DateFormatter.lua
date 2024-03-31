local DateFormatter = {}

function DateFormatter.relativeTime(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":R>";
end

function DateFormatter.longDate(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":D>";
end

function DateFormatter.shortDate(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":d>";
end

function DateFormatter.longTime(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":T>";
end

function DateFormatter.shortTime(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":t>";
end

function DateFormatter.longDateTime(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":F>";
end

function DateFormatter.shortDateTime(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":f>";
end

return DateFormatter