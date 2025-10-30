KitsuneUI::Engine.routes.draw do
  mount ::Lookbook::Engine, at: '/', as: :lookbook
end
