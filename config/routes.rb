Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # Localhost3000に繋いだときにどこを動かすかの指定をする
  # １個のアプリに１つ

  resources :items, only: [ :new, :create, :show, :edit, :update, :destroy]


   # Orders を購入機能にするためのコントローラーにする→購入機能の際のメインになる
  resources :items do
    resources :order
  end



  # ルーティングのネスト
  # ネストは、ある記述の中に別の記述をして、親子関係を示す方法です。
  # 「入れ子構造」とも呼ばれます。
  
  # ルーティングにおけるネストとは、あるコントローラーのルーティングの中に、別のコントローラーのルーティングを記述することです。
  
  # 【例】ルーティングのネスト
  # Rails.application.routes.draw do
  #   resources :親となるコントローラー do
  #     resources :子となるコントローラー
  #   end
  # end

  # まとめると、ルーティングをネストさせる一番の理由は、アソシエーション先のレコードのidをparamsに追加してコントローラーに送るためです。
  # →例. Tweetがあればコメントできるの様に親がいないと子が成り立たないものにはNESTをする必要性がある


end
