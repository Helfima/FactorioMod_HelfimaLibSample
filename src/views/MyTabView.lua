-------------------------------------------------------------------------------
---Class to build dialog
---@class MyTabView : Form
MyTabView = newclass(Form, function(base, classname)
    Form.init(base, classname)
    base.inner_frame = defines.mod.styles.frame.inner_tab
    base.auto_clear = false
    base.mod_menu = true
end)


-------------------------------------------------------------------------------
---On Style
---@param styles table
---@param width_main number
---@param height_main number
function MyTabView:on_style(styles, width_main, height_main)
    styles.flow_panel = {
        width = 500,
        height = 400,
    }
end

-------------------------------------------------------------------------------
---On initialization
function MyTabView:on_init()
    self.panel_caption = { "HelfimaLibSample-MyTabView.title" }
end

-------------------------------------------------------------------------------
---Get Button Sprites
---@return string,string
function MyTabView:get_button_sprites()
  return defines.sprites.list_view.white, defines.sprites.list_view.black
end

-------------------------------------------------------------------------------
---Get or create tab panel
---@return LuaGuiElement
function MyTabView:get_tab_one()
    return self:get_tab("tab-one-panel", { "HelfimaLibSample-MyTabView.tab-one-title" })
end

-------------------------------------------------------------------------------
---Get or create tab panel
---@return LuaGuiElement
function MyTabView:get_tab_two()
    return self:get_tab("tab-two-panel", { "HelfimaLibSample-MyTabView.tab-two-title" })
end

-------------------------------------------------------------------------------
---On Update
---@param event EventModData
function MyTabView:on_update(event)
    self:update_tab_one(event)
    self:update_tab_two(event)

    self:get_tab_pane().selected_tab_index = User.get_parameter("my_tab_selected_tab_index") or 1
end

-------------------------------------------------------------------------------
---On event
---@param event EventModData
function MyTabView:on_event(event)
    if event.action == "change-tab" then
        User.set_parameter("my_tab_selected_tab_index", event.element.selected_tab_index)
    end
end

---@param event EventModData
function MyTabView:update_tab_one(event)
    local tab_panel = self:get_tab_one()
    GuiElement.add(tab_panel,
            GuiLabel("label", 1):caption({ "HelfimaLibSample-MyTabView.tab-one-hello" }))
end

---@param event EventModData
function MyTabView:update_tab_two(event)
    local tab_panel = self:get_tab_two()
    GuiElement.add(tab_panel,
            GuiLabel("label", 1):caption("Second hello"))
end
