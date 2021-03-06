// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
// 動作を高速化するgem 一部発火の妨げになるようなので一時コメントアウト
require("@rails/activestorage").start()
require("channels")
require("../item_price");
// 利益、手数料自動計算のファイル読み込み
require("../card")
// クレジット関連のファイル読み込み
require('./preview')
// 画像プレビューのためのファイル読み込み

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

