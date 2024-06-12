local MentionFormatter = {}

function MentionFormatter.MentionUser(userId : string) : string
	return "<@" .. userId .. ">"
end

function MentionFormatter.MentionRole(roleId : string) : string
	return "<@&" .. roleId .. ">"
end


function MentionFormatter.MentionChannel(channelId : string) : string
	return "<#" .. channelId .. ">"
end

return MentionFormatter