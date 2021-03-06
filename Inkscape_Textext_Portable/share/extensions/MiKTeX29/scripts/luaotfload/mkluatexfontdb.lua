#!/usr/bin/env texlua
--[[
This file is copyright 2010 Elie Roux and Khaled Hosny and is under CC0
license (see http://creativecommons.org/publicdomain/zero/1.0/legalcode).

This file is a wrapper for the luaotfload's font names module. It is part of the
luaotfload bundle, please see the luaotfload documentation for more info.
--]]

kpse.set_program_name("luatex")

require("lualibs")
require("otfl-font-nms")
require("alt_getopt")

local name = 'mkluatexfontdb'
local version = '1.07' -- same version number as luaotfload

local names    = fonts.names

-- the directory in which the database will be saved, can be overwritten
local output_directory = names.path.localdir

local log      = logs.report

local function help_msg()
    texio.write(string.format([[
Usage: %s [OPTION]...
    
Rebuild the LuaTeX font database.

Valid options:
  -d --database-dir=DIRECTORY  install the database in the specified directory
  -f --force                   force re-indexing all fonts
  -q --quiet                   don't output anything
  -v --verbose=LEVEL           be more verbose (print the searched directories)
  -vv                          print the loaded fonts
  -vvv                         print all steps of directory searching
  --sys                        install the database system-wide
                               (default is only for the current user)
  -V --version                 print version and exit
  -h --help                    print this message

Fonts are searched in directories on Windows or Linux that have been
searched with fontconfig.

On Mac OS X, only fonts located in the following standard font locations are
included in the font database:
    ~/Library/Fonts          /Library/Fonts
    /System/Library/Fonts    /Network/Library/Fonts
In particular, fonts installed in other locations with "Font Book" will not
be available.

Rather than using the fontconfig locations or, in Mac OS X, searching the
default system font locations, you may specify where fonts are located by
setting the OSFONTDIR environment variable. Doing so will override the use of
fontconfig or scanning the system font locations. If you wish to continue to
include them while also including other font locations, simply include them in
the list. For example (using a bash shell),

   export OSFONTDIR='/path/to/other/fonts:/Users/will/Library/Fonts:...'

The output database file is named otfl-fonts.lua. By default it is placed
in $TEXMFVAR/luatex-cache/generic/names."
]], name))
end

local function version_msg()
    texio.write(string.format(
        "%s version %s, database version %s.\n", name, version, names.version))
end

--[[
Command-line processing.
Here we fill cmdargs with the good values, and then analyze it.
--]]

local long_opts = {
    ['database-dir'] = "d",
    force            = "f",
    quiet            = "q",
    help             = "h",
    sys              = 0  ,
    verbose          = 1  ,
    version          = "V",
}

local short_opts = "d:fqpvVh"

local force_reload = nil

local function process_cmdline()
    local opts, optind, optarg = alt_getopt.get_ordered_opts (arg, short_opts, long_opts)
    local log_level = 1
    for i,v in ipairs(opts) do
        if     v == "q" then
            log_level = 0
        elseif v == "v" then
            if log_level > 0 then
                log_level = log_level + 1
            else
                log_level = 2
            end
        elseif v == "V" then
            version_msg()
            os.exit(0)
        elseif v == "h" then
            help_msg()
            os.exit(0)
        elseif v == "d" then
            output_directory = optarg [i]
        elseif v == "f" then
            force_reload = 1
        elseif v == "sys" then
            output_directory = names.path.systemdir
        end
    end
    if string.match(arg[0], '-sys') then
        output_directory = names.path.systemdir
    end
    output_directory = fonts.path_normalize(output_directory)
    names.set_log_level(log_level)
end

process_cmdline()

local function generate(force)
    local savepath = output_directory
    if not lfs.isdir(savepath) then
        log("creating directory %s", savepath)
        dir.mkdirs(savepath)
        if not lfs.isdir(savepath) then
            texio.write_nl(string.format("Error: cannot create directory '%s', exiting.\n", savepath))
            os.exit(1)
        end
    end
    savepath = file.join(savepath, names.path.basename)
    local fh = io.open(savepath, 'a+')
    if not fh then
        texio.write_nl(string.format("Error: cannot write file '%s', exiting.\n", savepath))
        os.exit(1)
    end
    fh:close()
    local fontnames
    if not force_reload and file.isreadable(savepath) then
        fontnames = dofile(savepath)
    else
        fontnames = nil
    end
    fontnames = names.update(fontnames, force)
    log("%s fonts in the database", #fontnames.mappings)
    table.tofile(savepath, fontnames, true)
    log("saved font names database in %s\n", savepath)
end

generate(force_reload)
