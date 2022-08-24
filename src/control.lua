require("__HelfimaLib__.lib_require")
require("__HelfimaLibSample__.core.defines")
require("__HelfimaLibSample__.views.Views")

local handler = require("event_handler")
handler.add_lib(Dispatcher)

Form.views["HLSMyFirstView"] = MyFirstView("HLSMyFirstView")
Form.views["HLSMyTabView"] = MyTabView("HLSMyTabView")

