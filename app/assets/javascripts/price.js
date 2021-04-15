
window.addEventListener("load", () => {
  const priceInput = document.getElementById('lending-period');
  if(priceInput != null){
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById('item-daily-price');
      const DailyPrice = gon.daily_price
    addTaxDom.innerHTML = DailyPrice ;

    const profitAmount = document.getElementById('amount');
    profitAmount.innerHTML = Math.floor(inputValue * DailyPrice); 

    
})
}})
;
