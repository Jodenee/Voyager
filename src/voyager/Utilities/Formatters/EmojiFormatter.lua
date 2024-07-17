local EmojiFormatter = {}

function EmojiFormatter.Emoji(emojiName : string) : string 
	return ":" .. emojiName .. ":"
end

function EmojiFormatter.CustomEmoji(emojiName : string, emojiId : string) : string 
	return "<:" .. emojiName .. ":" .. emojiId .. ">"
end

function EmojiFormatter.AnimatedEmoji(emojiName : string, emojiId : string) : string 
	return "<a:" .. emojiName .. ":" .. emojiId .. ">"
end

return EmojiFormatter