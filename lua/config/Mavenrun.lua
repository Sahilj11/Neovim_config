-- Function to get the package name from a Java file
local fileName = vim.fn.expand(%)
local function get_package_and_file_name(file_path)
    local f = io.open(file_path, "r")
    if not f then
        return nil, nil
    end

    local package_name, file_name = nil, nil

    for line in f:lines() do
        -- Match the package declaration line
        local package_match = line:match("^%s*package%s+([^%s;]+)%s*;%s*$")
        if package_match then
            package_name = package_match
        end

        -- Match the file name (class declaration line)
        local class_match = line:match("^%s*public%s+class%s+([^%s{]+)%s*{")
        if class_match then
            file_name = class_match
            break  -- Break after finding the class name
        end
    end

    f:close()
    return package_name, file_name
end

-- Example usage

vim.api.nvim_create_user_command('Test',get_package_and_file_name(fN))


