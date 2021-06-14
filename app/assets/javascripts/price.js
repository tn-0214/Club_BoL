
window.addEventListener("load", () => {
  const priceInput = document.getElementById('lending-period');
  if(priceInput != null){
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById('item-daily-price');
      const DailyPrice = gon.daily_price
    addTaxDom.innerHTML = DailyPrice ;

    const PriceAmount = document.getElementById('amount');
    PriceAmount.innerHTML = Math.floor(inputValue * DailyPrice); 

    
})
}})
;
