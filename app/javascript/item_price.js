

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

  const fee = Math.floor(price * 0.1);  
  const salesProfit = Math.floor(price - fee);

  addTaxPrice.textContent = fee.toString();
  profit.textContent = salesProfit.toString();
}

document.addEventListener('turbo:render', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", calculateFeeAndProfit);
});

document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", calculateFeeAndProfit);
});
