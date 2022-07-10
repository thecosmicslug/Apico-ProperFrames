MOD_NAME = "beemo"

GLOBAL_RECIPE = {{ item = "log", amount = 1}, {item="sticks1", amount = 1}}

function register()
  return {
    name = MOD_NAME,
    hooks = {},
    modules = {"minimizer", "maximizer", "enabler"}
  }
end

function init()
  api_log("init", "BeeMO loaded")
  api_log("init", "Beginning defines")
  
  api_log("init", "Defining Frame")
  define_frame()

  api_log("init", "Defining Minimizer")
  define_minimizer()

  api_log("init", "Defining Maximizer")
  define_maximizer()

  api_log("init", "Defining Enabler")
  define_enabler()
  
  return "Success"
end

function define_frame()
  api_define_item({
    id = "unbreaking_frame",
    name = "Unbreaking Frame",
    category = "Beekeeping",
    tooltip = "This Frame is Unbreakable!",
    shop_key = false,
    shop_buy = 0,
    shop_sell = 0,
    durability = 10000,
    singular = true,
    machines = {"hive1", "hive2"}
  },"sprites/unbreaking_frame.png")
  res = api_define_recipe("beekeeping", MOD_NAME .. "_unbreaking_frame", GLOBAL_RECIPE, 1)
end