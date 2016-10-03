pregunta = function () {
    'use strict';

    if (!localStorage.basicAuth) {
        location.href = 'ingreso.html';
    } else {
        document.getElementById("userName").textContent = localStorage.userName;
    }

    var app = {
        isLoading: true,
        spinner: document.querySelector('.loader'),
        cardTemplate: document.querySelector('.container')
    };


    app.updateChatCard = function (data) {
        var card = app.cardTemplate;
        var pregunta =  card.querySelector('.pregunta');
        var respuesta =  card.querySelector('.respuesta');
        pregunta.textContent = data.DS_PREGUNTA;
        respuesta.textContent = data.DS_RESPUESTA;
        card.querySelector('.chatTitulo').textContent = data.DS_TITULO; 
    }

    app.getQueryVariable =  function (variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) {
                return pair[1];
            }
        }
        return false;
    }

    app.init = function () {
        var urlChatId = app.getQueryVariable('id');
        console.log('urlChatId: ' + urlChatId);
         $.ajax({
        method: "GET",
        url: "https://xualiapi.herokuapp.com/api/preguntas/" + urlChatId,
        data: {},
        beforeSend: function (xhr) {
          xhr.setRequestHeader("Authorization", "Basic " + localStorage.basicAuth);
        },
      })
      .done(function (data) {
        console.log('data..');
        console.log(data);
        data.forEach(function (chat) {
          app.updateChatCard(chat);
        });
      })
      .fail(function (err) {
        console.log(JSON.stringify(err));
        Materialize.toast('Ouch!... Disculpa hubo un problema buscando la pregunta.', 4000, 'rounded');
      });
        
    }

    app.init();

};

$("#logoutButton").click(function (event) {
    event.preventDefault();
    localStorage.removeItem('userName');
    localStorage.removeItem('basicAuth');

    location.href = 'index.html';
});

pregunta();  