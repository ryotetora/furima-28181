// 金額idをpriceInput変数に格納
window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
})
})
// const addTaxDom = document.getElementById("add-tax-price");
//     addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
// ここの計算の仕方が意味わからんあとできく