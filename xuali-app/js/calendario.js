var calendario = function () {
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

};

$("#logoutButton").click(function (event) {
    event.preventDefault();
    localStorage.removeItem('userName');
    localStorage.removeItem('basicAuth');

    location.href = 'index.html';
});

calendario();  