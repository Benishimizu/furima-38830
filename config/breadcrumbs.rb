crumb :root do
  link "Top", root_path
end

crumb :items do
  link "商品詳細", items_path
  parent :root
end

crumb :item_orders do 

  link "購入ページ", item_orders_path
  parent :items
end
