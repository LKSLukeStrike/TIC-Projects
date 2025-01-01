-- Nums object
-- Instance only once
-- Contains constants, globals and general functions
-- 


Nums = {
}


-- Conversions
function Nums:yes2int(_yes) -- convert a boolean to integer 0|1
    return _yes and 1 or 0
end


-- Numeric comparisons
function Nums:geAny(_num, ...) -- greater or equals than ... -- false by default
    for _, _v in ipairs({...}) do
        if _num >= _v then return true end
    end
    return false
end


-- END
return Nums
