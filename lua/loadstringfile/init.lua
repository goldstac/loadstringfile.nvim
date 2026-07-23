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

	-- Register with LuaSnip if available
	local ok, luasnip = pcall(require, "luasnip")
	if ok then
		luasnip.add_snippets("cpp", {
			luasnip.snippet("!loadstringfile", {
				luasnip.text_node(M.snippet_text),
			}),
		})
	end

	-- Write snippet file for blink.cmp / friendly-snippets format
	local snippet_dir = vim.fn.stdpath("config") .. "/snippets"
	local snippet_path = snippet_dir .. "/cpp.json"

	vim.fn.mkdir(snippet_dir, "p")

	local existing = {}
	local ok2, f = pcall(vim.fn.readfile, snippet_path)
	if ok2 and type(f) == "table" then
		ok2, existing = pcall(vim.json.decode, table.concat(f))
		if not ok2 then existing = {} end
	end

	if not existing["!loadstringfile"] then
		existing["!loadstringfile"] = {
			prefix = "!loadstringfile",
			body = M.snippet_text,
			description = "Insert read_file function",
		}
		vim.fn.writefile({ vim.json.encode(existing, { indent = true }) }, snippet_path)
	end
end

return M
