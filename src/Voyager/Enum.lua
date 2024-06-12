return {
	PublicUserFlag = {
		Staff = bit32.lshift(1, 0),
		Partner = bit32.lshift(1, 1),
		Hypesquad = bit32.lshift(1, 2),
		BugHunterLevelOne = bit32.lshift(1, 3),
		BugHunterLevelTwo = bit32.lshift(1, 14),
		HouseOfBraveryMember = bit32.lshift(1, 6),
		HouseOfBrillianceMember = bit32.lshift(1, 7),
		HouseOfBalanceMember = bit32.lshift(1, 8),
		PremiumEarlySupporter = bit32.lshift(1, 9),
		VerifiedBot = bit32.lshift(1, 16),
		VerifiedDeveloper = bit32.lshift(1, 17),
		CertifiedModerator = bit32.lshift(1, 18),
		ActiveDeveloper = bit32.lshift(1, 22)
	},
	MessageFlag = {
		SuppressEmbeds = bit32.lshift(1, 2),
		SuppressNotifications = bit32.lshift(1, 12)
	},
	ImageFormat = {
		Jpeg = ".jpeg",
		Png = ".png",
		WebP = ".webp",
		Gif = ".gif",
		Lottie = ".json"
	},
	RatelimitScope = {
		User = "user",
		Shared = "shared",
		Global = "global"
	}
} :: {
	PublicUserFlag : {
		Staff : number,
		Partner : number,
		Hypesquad : number,
		BugHunterLevelOne : number,
		BugHunterLevelTwo : number,
		HouseOfBraveryMember : number,
		HouseOfBrillianceMember : number,
		HouseOfBalanceMember : number,
		PremiumEarlySupporter : number,
		VerifiedBot : number,
		VerifiedDeveloper : number,
		CertifiedModerator : number,
		ActiveDeveloper : number		
	},
	MessageFlag : {
		SuppressEmbeds : number,
		SuppressNotifications : number
	},
	ImageFormat : {
		Jpeg : ".jpeg",
		Png : ".png",
		WebP : ".webp",
		Gif : ".gif",
		Lottie : ".json"
	},
	RatelimitScope : {
		User : "user",
		Shared : "shared",
		Global : "global"
	}
}