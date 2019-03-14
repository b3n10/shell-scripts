if (yds = document.querySelector('.acp_content')) url = yds.children[0].src.slice(8);
if (document.querySelectorAll('.videodetailsinmainarea iframe')[0]) url = document.querySelectorAll('.videodetailsinmainarea iframe')[0].src.slice(8);
if (document.querySelectorAll('.contentVencher')[0]) url = document.querySelectorAll('.contentVencher')[0].src.slice(8);
window.open('http://' + url)

// browser bookmark
// with goalsarena
javascript:(function() { if (document.querySelector('.acp_content')[0]) url = document.querySelector('.acp_content')[0].src.slice(8); if (document.querySelectorAll('.videodetailsinmainarea iframe')[0]) url = document.querySelectorAll('.videodetailsinmainarea iframe')[0].src.slice(8); if (document.querySelectorAll('.contentVencher')[0]) url = document.querySelectorAll('.contentVencher')[0].src.slice(8); window.open('http://' + url); })()

// javascript:(function() { if (yds = document.querySelector('.acp_content')) url = yds.children[0].src.slice(8); if (document.querySelectorAll('.videodetailsinmainarea iframe')[0]) url = document.querySelectorAll('.videodetailsinmainarea iframe')[0].src.slice(8); if (document.querySelectorAll('.contentVencher')[0]) url = document.querySelectorAll('.contentVencher')[0].src.slice(8); window.open('http://' + url); })()

// javascript:(function(){if (yds = document.querySelector('.acp_content')) url = yds.children[0].src.slice(8); else if (document.querySelectorAll('.videodetailsinmainarea iframe')[0].src) url = document.querySelectorAll('.videodetailsinmainarea iframe')[0].src.slice(8); else url = document.querySelectorAll('.contentVencher')[0].src.slice(8);window.open('http://' + url)})()
