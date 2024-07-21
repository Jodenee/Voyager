--[[
	Packages up all Voyager classes in one table and exposes them publicly.
]]

local voyager = {
    Bases = {
        BaseFlags = require(script.Bases.BaseFlags)
    },

    Utilities = {
        Formatters = {
            DateFormatter = require(script.Utilities.Formatters.DateFormatter),
            EmojiFormatter = require(script.Utilities.Formatters.EmojiFormatter),
            MentionFormatter = require(script.Utilities.Formatters.MentionFormatter)
        }
    },

    Embed = require(script.Embed),
    EmbedAuthor = require(script.EmbedAuthor),
    EmbedField = require(script.EmbedField),
    EmbedFooter = require(script.EmbedFooter),
    EmbedImage = require(script.EmbedImage),
    EmbedThumbnail = require(script.EmbedThumbnail),
    Enum = require(script.Enum),
    Message = require(script.Message),
    MessageFlags = require(script.MessageFlags),
    OptionalSendMessageInfo = require(script.OptionalSendMessageInfo),
    PublicUserFlags = require(script.PublicUserFlags),
    User = require(script.User),
    Webhook = require(script.Webhook)
}

return voyager