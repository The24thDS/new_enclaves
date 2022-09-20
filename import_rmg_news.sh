#!/bin/bash

rmg_news_location="../stellaris-utils/news-sidebar"
mod_folder=$1

shift;

if [[ $1 != -* ]]
then
  frontend_filename=$1
  shift;
else
  frontend_filename="frontend"
fi


copy_buttons() {
  echo "Copying gfx/interface files"
  cp -r "$rmg_news_location/gfx/interface/buttons/." "$mod_folder/gfx/interface/buttons/rmg"
  cp -r "$rmg_news_location/gfx/interface/tiles/." "$mod_folder/gfx/interface/tiles/rmg"
}

copy_gfx() {
  echo "Copying interface/rmg.gfx"
  cp "$rmg_news_location/interface/rmg.gfx" "$mod_folder/interface/rmg.gfx"
}

patch_gui_file() {
  echo "Patching $mod_folder/interface/$frontend_filename.gui"
  sed -e '/# JENKINS_IMPORT_RMG_NEWS #/ {' -e "r $rmg_news_location/interface/frontend.snippet.gui" -e 'd' -e '}' -i "$mod_folder/interface/$frontend_filename.gui"
}

echo "START: Importing RMG News from '$rmg_news_location' to '$mod_folder'"

if [[ $# -eq 0 ]]; then
  copy_buttons
  copy_gfx
  patch_gui_file
else
  for arg in $@; do
    case "$arg" in
      --onlyButtons)
        copy_buttons
        ;;
      --onlyGfx)
        copy_gfx
        ;;
      --onlyGui)
        patch_gui_file
        ;;
    esac
  done
fi

echo "DONE: RMG News imported"
