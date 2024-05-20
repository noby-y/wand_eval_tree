local data_path = "/home/nathan/Documents/code/noitadata/"

---@type arg_parser
local arg_parser = require("arg_parser")
local options = arg_parser.parse(arg)

local fake_engine = require("fake_engine")
fake_engine.make_fake_api(data_path, options)

---@type renderer
local renderer = require("renderer")
local text_formatter = require("text_formatter")
---@diagnostic disable-next-line: lowercase-global
print_table = require("print")
local mod_interface = require("mod_interface")
---@type image
local image = require("image")
local csv_loader = require("extra.tcsv")
--print_table(options)
mod_interface.load_mods(options.mods)
fake_engine.initialise_engine(text_formatter, options)

text_formatter.set_colours(options.ansi)
fake_engine.evaluate(options)
image.render(fake_engine.calls, options.spells)
print(renderer.render(fake_engine.calls, fake_engine, text_formatter, options))
