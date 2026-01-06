function strip_name(tag, timestamp, record)
    record["docker_tag"] = tag
    local name = record["container_name"]
    if name ~= nil then
        if string.sub(name, 1, 1) == "/" then
            record["container_name"] = string.sub(name, 2)
        end
    end
    return 1, timestamp, record
end
