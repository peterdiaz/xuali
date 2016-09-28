preguntas = function () {
  'use strict';

  if (!localStorage.basicAuth) {
    location.href = 'ingreso.html';
  }

  var app = {
    isLoading: true,
    visibleCards: {},
    spinner: document.querySelector('.loader'),
    cardTemplate: document.querySelector('.cardTemplate'),
    container: document.querySelector('.cardContainer')
  };

  app.updateQuestionCard = function (data) {
    var card = app.visibleCards[data.ID_PREGUNTA];
    if (!card) {
      card = app.cardTemplate.cloneNode(true);
      card.classList.remove('.cardTemplate');
      var title = card.querySelector('.title'); 
      title.textContent = data.DS_TITULO;
      title.href = 'pregunta.html?id=' + data.ID_PREGUNTA;

      card.querySelector('.title').textContent = data.DS_TITULO;
      card.querySelector('.fecha').textContent = data.DT_PREGUNTA; 
      app.container.appendChild(card);
      app.visibleCards[data.id] = card;
    }
    card.querySelector('.resumen').textContent = data.DS_PREGUNTA;    
    card.removeAttribute('hidden');
    card.classList.add('fadein');
  };

  app.init = function () {
    $.ajax({
        method: "GET",
        url: "http://127.0.0.1:8085/api/preguntas",
        data: {},
        beforeSend: function (xhr) {
          xhr.setRequestHeader("Authorization", "Basic " + localStorage.basicAuth);
        },
      })
      .done(function (data) {
        console.log('data..');
        console.log(data);
        data.forEach(function (question) {
          app.updateQuestionCard(question)
        });
      })
      .fail(function (err) {
        console.log(JSON.stringify(err));
        Materialize.toast('Ouch!... Disculpa hubo un problema buscando las preguntas.', 4000, 'rounded');
      });
  };

  app.init();

};

preguntas();  