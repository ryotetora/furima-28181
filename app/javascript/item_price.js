// 金額idをpriceInput変数に格納
function item_price() {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
})
}

const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
// ここから手数料計算できず途中
    
window.addEventListener('load', item_price);