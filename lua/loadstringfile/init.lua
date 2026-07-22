local M = {}

M.snippet_text = {
	"std::string read_file(const std::string& filepath) {",
	"    std::ifstream file(filepath);",
	"    std::stringstream buffer;",
	"    buffer << file.rdbuf();",
	"    return buffer.str();",
	"}",
}

function M.setup(opts)
	opts = opts or {}

	-- Method A: Register as a native Neovim snippet (Neovim 0.10+)
	if vim.snippet then
		vim.snippet.add("!loadstringfile", function()
			return M.snippet_text
		end, { trig = "!loadstringfile" })
	end

	-- Method B: Register via LuaSnip if it's installed
	local ok, luasnip = pcall(require, "luasnip")
	if ok then
		luasnip.add_snippets("cpp", {
			luasnip.snippet("!loadstringfile", {
				luasnip.text_node(M.snippet_text),
			}),
		})
	end
end

return M
