if (yds = document.querySelector('.acp_content')) url = yds.children[0].src.slice(8);
else url = document.querySelectorAll('.contentVencher')[0].src.slice(8);
window.open('http://' + url)

// browser bookmark
javascript:(function(){if (yds = document.querySelector('.acp_content')) url = yds.children[0].src.slice(8); else url = document.querySelectorAll('.contentVencher')[0].src.slice(8);window.open('http://' + url)})()
