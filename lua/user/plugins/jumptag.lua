return {
	"harrisoncramer/jump-tag",
	ft = "typescriptreact",
	config = function()
		local jumptag = require("jump-tag")

		Keymapper("tk", function()
			jumptag.jumpParent()
		end, "Jump to parent tag")

		Keymapper("tj", function()
			jumptag.jumpChild()
		end, "Jump to child tag")

		Keymapper("tl", function()
			jumptag.jumpNextSibling()
		end, "Jump to next sibling tag")

		Keymapper("th", function()
			jumptag.jumpPrevSibling()
		end, "Jump to previous sibling tag")
	end,
}
