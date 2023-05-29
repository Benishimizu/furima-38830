crumb :root do
  link "Toppage", root_path
end

crumb :item do
  link "商品詳細", item_path
  parent :root
end

crumb :item_orders do
  link "購入ページ", item_orders_path.find(params[:id])

  # item_orders_path(@item.id)
  # :@itemからidをとる

  # .find(params[:id])
  # :パラムスからidをとる
  # MVCの流れを考えた時にビューから飛んでコントローラーで値を取ってくるから一番自然な書き方
  # FIND:モデルがあってそのPARAMSから探す

  # .find_by(id: params[:id])
  # :.find(params[:id])と似ているがfind_byになるとID以外も検索できる
  # つまり類似している



  parent :item
end
