if (document.URL.match( /new/ )) {
// 金額idをpriceInput変数に格納
window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  const tax = Math.floor(inputValue / 10);
  addTaxDom.innerHTML = tax
  // 手数料計算
  
  const profit = document.getElementById("profit")
  profit.innerHTML = Math.floor(inputValue - tax);
  // 利益計算
})
})
}
