local MentionFormatter = {}

function MentionFormatter.mentionUser(userId : string) : string
	return "<@" .. userId .. ">"
end

function MentionFormatter.mentionRole(roleId : string) : string
	return "<@&" .. roleId .. ">"
end


function MentionFormatter.mentionChannel(channelId : string) : string
	return "<#" .. channelId .. ">"
end

return MentionFormatter