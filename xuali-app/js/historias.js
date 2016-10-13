historias = function () {
  'use strict';

  if (!localStorage.basicAuth) {
    location.href = 'ingreso.html';
  } else {
        document.getElementById("userName").textContent = localStorage.userName;
    }

  var app = {
    isLoading: true,
    visibleCards: {},
    spinner: document.querySelector('.loader'),
    cardTemplate: document.querySelector('.cardTemplate'),
    container: document.querySelector('.cardContainer')
  };

  app.updateHistoryCard = function (data) {
    var card = app.visibleCards[data.ID_HISTORIA];
    if (!card) {
      card = app.cardTemplate.cloneNode(true);
      card.classList.remove('cardTemplate');
      card.querySelector('#img').src = 'img/' + data.URL_PORTADA;
      card.querySelector('#link').href = 'historia.html?id=' + data.ID_HISTORIA +  '&url=' + data.URL_HISTORIA +  '&title=' + data.TITLE_HISTORIA; 
      app.container.appendChild(card);
      app.visibleCards[data.id] = card;
    }
    card.querySelector('#title').textContent = data.TITLE_HISTORIA;
    card.querySelector('#description').textContent = data.DS_INTRO;
    card.removeAttribute('hidden');
    card.classList.add('fadein');
    card.querySelector('#img').classList.add('fadeinleft');
  };

  app.init = function () {
    $.ajax({
        method: "GET",
        url: "https://xualiapi.herokuapp.com/api/historias",
        data: {},
        beforeSend: function (xhr) {
          xhr.setRequestHeader("Authorization", "Basic " + localStorage.basicAuth);
        },
      })
      .done(function (data) {
        data.forEach(function (historia) {
          app.updateHistoryCard(historia);
        });
      })
      .fail(function (err) {
        console.log(JSON.stringify(err));
        Materialize.toast('Ouch!... Disculpa hubo un problema buscando las historias.', 4000, 'rounded');
      });
  };

  app.init();

};

historias();  

$("#logoutButton").click(function (event) {
    event.preventDefault();
    localStorage.removeItem('userName');
    localStorage.removeItem('basicAuth');

    location.href = 'index.html';
});
