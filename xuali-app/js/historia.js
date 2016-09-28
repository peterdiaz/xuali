historia = function () {
    'use strict';

    if (!localStorage.basicAuth) {
        location.href = 'ingreso.html';
    }

    var app = {
        isLoading: true,
        spinner: document.querySelector('.loader'),
        cardTemplate: document.querySelector('.video-container')
    };


    app.updateHistoryCard = function (data) {
        var card = app.cardTemplate;
        var video = document.getElementById("videoSource");
        console.log(data);
        video.src = 'video/' + data.url;
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
        var urlhistoria = app.getQueryVariable('url');
        app.updateHistoryCard({ url: urlhistoria });
    }

    app.init();

};

historia();  