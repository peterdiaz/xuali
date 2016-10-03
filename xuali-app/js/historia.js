historia = function () {
    'use strict';

    if (!localStorage.basicAuth) {
        location.href = 'ingreso.html';
    } else {
        document.getElementById("userName").textContent = localStorage.userName;
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
        //video.src = 'video/' + data.url;
        //sources = video.querySelectorAll('source');
        //video.load();
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

$("#logoutButton").click(function (event) {
    event.preventDefault();
    localStorage.removeItem('userName');
    localStorage.removeItem('basicAuth');

    location.href = 'index.html';
});

historia();  