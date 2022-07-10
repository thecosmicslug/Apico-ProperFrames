
function define_enabler()  
  define_obj = api_define_menu_object({
    id = "enabler",
    name = "Enabler",
    category = "Mechanism",
    tooltip = "Enables a bee to bee the best worker it can bee.",
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
  }, "sprites/enabler_item.png", "sprites/enabler_menu.png", {
    change = "enabler_change"
  })
  
  define_recipe = api_define_recipe("beekeeping", MOD_NAME .. "_enabler", GLOBAL_RECIPE, 1)  
  
  if (define_obj == "Success" and define_recipe == "Success") then
    return "Success"
  end  
  api_log("beemo init", "Failed to define Enabler")
  return nil
end

function enabler_change(menu_id)
  input_slot = api_get_slot(menu_id, 1)
  if (input_slot["item"] == nil or input_slot["item"] == "") then
    return
  end
  
  new_stats = input_slot["stats"]

  new_stats["d_traits"]["behaviour"] = "Cathemeral"
  new_stats["d_traits"]["climate"] = "Any"
  new_stats["d_traits"]["pluviophile"] = 1
  new_stats["d_traits"]["chionophile"] = 1
  new_stats["d_traits"]["aggressive"] = 0
  
  new_stats["r_traits"]["behaviour"] = "Cathemeral"
  new_stats["r_traits"]["climate"] = "Any"
  new_stats["r_traits"]["pluviophile"] = 1
  new_stats["r_traits"]["chionophile"] = 1
  new_stats["r_traits"]["aggressive"] = 0
  
  api_slot_set(input_slot["id"],input_slot["item"],1,new_stats)
end
