
function define_minimizer()  
  define_obj = api_define_menu_object({
    id = "minimizer",
    name = "Minimizer",
    category = "Mechanism",
    tooltip = "Alters a bee to have minimal traits.",
    shop_key = false,
    shop_buy = 0,
    shop_sell = 0,
    layout = {
      {17, 27, "Input", {"bee"} }
    },
    buttons = { "Help", "Target", "Close" },
    info = { 
      {"1. Insert Bee", "GREEN"} 
    },
    tools = {"mouse1", "hammer1"},
    placeable = true
  }, "sprites/minimizer_item.png", "sprites/minimizer_menu.png", {
    change = "minimizer_change"
  })
    
  define_recipe = api_define_recipe("beekeeping", MOD_NAME .. "_minimizer", GLOBAL_RECIPE, 1)  
  
  if (define_obj == "Success" and define_recipe == "Success") then
    return "Success"
  end  
  api_log("beemo init", "Failed to define Minimizer")
  return nil
end

function minimizer_change(menu_id)
  input_slot = api_get_slot(menu_id, 1)
  if (input_slot["item"] == nil or input_slot["item"] == "") then
    return
  end
  
  new_stats = input_slot["stats"]

  new_stats["d_traits"]["lifespan"] = "Rapid"
  new_stats["d_traits"]["productivity"] = "Slowest"
  new_stats["d_traits"]["fertility"] = "Infertile"
  new_stats["d_traits"]["stability"] = "Erratic"
  
  new_stats["r_traits"]["lifespan"] = "Rapid"
  new_stats["r_traits"]["productivity"] = "Slowest"
  new_stats["r_traits"]["fertility"] = "Infertile"
  new_stats["r_traits"]["stability"] = "Erratic"
  
  api_slot_set(input_slot["id"],input_slot["item"],1,new_stats)
end
