window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    if (inputValue.trim() !== '') {
      function calculateCommission(amount) {
        const commissionRate = 0.1;
        const commission = Math.floor(amount * commissionRate);
        return commission;
      }
      const amount = parseFloat(inputValue);
      const commission = calculateCommission(amount);
      const formattedCommission = commission.toLocaleString();
      addTaxDom.innerHTML = formattedCommission;
      const profit = amount - commission;
      const formattedProfit = profit.toLocaleString();
      profitDom.innerHTML = formattedProfit;
    } else {
      addTaxDom.innerHTML = "";
      profitDom.innerHTML = "";
    }
 });
});