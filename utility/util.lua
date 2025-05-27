function DC.register(items, path)
    for i = 1, #items do
        SMODS.load_file(path.."/"..items[i]..".lua")()
    end
end