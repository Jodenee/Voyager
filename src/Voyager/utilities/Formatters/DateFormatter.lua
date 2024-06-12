local DateFormatter = {}

function DateFormatter.RelativeTime(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":R>";
end

function DateFormatter.LongDate(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":D>";
end

function DateFormatter.ShortDate(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":d>";
end

function DateFormatter.LongTime(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":T>";
end

function DateFormatter.ShortTime(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":t>";
end

function DateFormatter.LongDateTime(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":F>";
end

function DateFormatter.ShortDateTime(datetime : DateTime) : string
	return "<t:" .. datetime.UnixTimestamp .. ":f>";
end

return DateFormatter