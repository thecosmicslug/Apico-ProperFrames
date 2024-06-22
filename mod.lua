MOD_NAME = "ProperFrames"

GLOBAL_RECIPE = {{ item = "log", amount = 1}, {item="sticks1", amount = 1}}

function register()
  return {
    name = MOD_NAME,
    hooks = {},
    modules = {}
  }
end

function init()
  api_log("init", "ProperFrames loaded!")
  api_log("init", "Defining Frame...")
  define_frame()
  return "Success"
end

function define_frame()
  api_define_item({
    id = "proper_frame",
    name = "Proper Frame",
    category = "Beekeeping",
    tooltip = "This Frame is decent!",
    shop_key = false,
    shop_buy = 10,
    shop_sell = 0,
    durability = 50,
    singular = true,
    machines = {"hive1", "hive2"}
  },"sprites/unbreaking_frame.png")
  res = api_define_recipe("beekeeping", MOD_NAME .. "_proper_frame", GLOBAL_RECIPE, 1)
end
