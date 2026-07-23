# loadstringfile.nvim

A lightweight Neovim plugin that adds a `!loadstringfile` snippet to scaffold a C++ file-reading utility function.

```
std::string read_file(const std::string& filepath) {
    std::ifstream file(filepath);
    std::stringstream buffer;
    buffer << file.rdbuf();
    return buffer.str();
}
```

## Installation

```lua
{
  "goldstac/loadstringfile.nvim",
  ft = "cpp",
  dependencies = { "L3MON4D3/LuaSnip" },
}
```

## Usage

Open a `.cpp` file, type `!loadstringfile`, and select it from the completion menu.
