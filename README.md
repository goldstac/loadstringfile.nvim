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

Requires `#include <fstream>` and `#include <sstream>` at the top of your file.

Place the cursor at file scope (outside any function) when expanding the snippet.

## Issues & Suggestions

Found a bug or have an idea? Open an [issue](https://github.com/goldstac/loadstringfile.nvim/issues).

- Use the **enhancement** tag for feature requests.
- Should the plugin auto-add `#include <fstream>` and `#include <sstream>`? Let us know in an enhancement issue!
