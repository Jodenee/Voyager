local EmojiFormatter = {}

function EmojiFormatter.emoji(emojiName : string) : string 
	return ":" .. emojiName .. ":"
end

function EmojiFormatter.customEmoji(emojiName : string, emojiId : string) : string 
	return "<:" .. emojiName .. ":" .. emojiId .. ">"
end

function EmojiFormatter.animatedEmoji(emojiName : string, emojiId : string) : string 
	return "<a:" .. emojiName .. ":" .. emojiId .. ">"
end

return EmojiFormatter