//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <risto_widgets/risto_widgets_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) risto_widgets_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "RistoWidgetsPlugin");
  risto_widgets_plugin_register_with_registrar(risto_widgets_registrar);
}
