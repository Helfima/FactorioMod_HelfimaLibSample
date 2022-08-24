-------------------------------------------------------------------------------
---Class to build dialog
---@class MyFirstView : Form
MyFirstView = newclass(Form, function(base, classname)
    Form.init(base, classname)
    base.mod_menu = true
end)


-------------------------------------------------------------------------------
---On Style
---@param styles table
---@param width_main number
---@param height_main number
function MyFirstView:on_style(styles, width_main, height_main)
    styles.flow_panel = {
        width = 500,
        height = 400,
    }
end

-------------------------------------------------------------------------------
---On initialization
function MyFirstView:on_init()
    self.panel_caption = { "HelfimaLibSample-MyFirstView.title" }
end

-------------------------------------------------------------------------------
---Get Button Sprites
---@return string,string
function MyFirstView:get_button_sprites()
  return defines.sprites.favorite.white, defines.sprites.favorite.black
end

-------------------------------------------------------------------------------
---On Update
---@param event EventModData
function MyFirstView:on_update(event)
    self:update_content(event)
end

-------------------------------------------------------------------------------
---On event
---@param event EventModData
function MyFirstView:on_event(event)
end

---@param event EventModData
function MyFirstView:update_content(event)
    local flow_panel, content_panel, menu_panel = self:get_panel()
    GuiElement.add(content_panel,
            GuiLabel("label", 1):caption({ "HelfimaLibSample-MyFirstView.hello" }))
end
