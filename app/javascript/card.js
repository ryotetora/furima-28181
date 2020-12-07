if (document.URL.match( /orders/ )) {
  // 適用するページを出品時に限定
const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  // form全体の要素を取得
  form.addEventListener("submit", (e) => {
    // 発火タイミングを購入したときに指定
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    // charge-formの情報を取得しそれをFormDataオブジェクトとし生成

    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
      // 各name属性から情報を取得し変数代入する
      // form_withでインスタンス変数を使うとname属性の変化に注意
    };

    Payjp.createToken(card, (status, response) => {
      // トークン化するためのメソッド、cardは直前の取得した変数
      // statusで適切にトークン化できたかを確認するステータスコードをかえす
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // トークンをフォームに追加
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      // カード情報を削除、idで指定

      document.getElementById("charge-form").submit();
      // フォーム情報をサーバーサイドに送信
    });
  });
};
window.addEventListener("load", pay);
}