
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", calculateFeeAndProfit);

function calculateFeeAndProfit() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  
  const price = parseFloat(priceInput.value);

  
  if (isNaN(price) || price < 300 || price > 9999999) {
    addTaxPrice.textContent = '';
    profit.textContent = '';
    return;
  }

  
  const fee = price * 0.1;

  
  const salesProfit = price - fee;

  
  addTaxPrice.textContent = fee.toFixed(0);
  profit.textContent = salesProfit.toFixed(0);
}


document.addEventListener('turbo:render', () => {
  console.log("OK");

  
  document.getElementById("item-price").addEventListener("input", calculateFeeAndProfit);
});


document.addEventListener('turbo:load', () => {
  console.log("OK");

  
  document.getElementById("item-price").addEventListener("input", calculateFeeAndProfit);
});
