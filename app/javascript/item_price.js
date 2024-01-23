// 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", calculateFeeAndProfit);

function calculateFeeAndProfit() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  // 入力された価格を取得
  const price = parseFloat(priceInput.value);

  // 価格が範囲外の場合には手数料と利益をクリア
  if (isNaN(price) || price < 300 || price > 9999999) {
    addTaxPrice.textContent = '';
    profit.textContent = '';
    return;
  }

  // 販売手数料（10%）の計算
  const fee = price * 0.1;

  // 販売利益の計算
  const salesProfit = price - fee;

  // 結果を表示
  addTaxPrice.textContent = fee.toFixed(0);
  profit.textContent = salesProfit.toFixed(0);
}

// turbo:render イベントが発生したときにも計算関数を呼び出す
document.addEventListener('turbo:render', () => {
  console.log("OK");

  // 価格が入力されたときに計算関数を呼び出す
  document.getElementById("item-price").addEventListener("input", calculateFeeAndProfit);
});

// turbo:load イベントが発生したときにも計算関数を呼び出す
document.addEventListener('turbo:load', () => {
  console.log("OK");

  // 価格が入力されたときに計算関数を呼び出す
  document.getElementById("item-price").addEventListener("input", calculateFeeAndProfit);
});
