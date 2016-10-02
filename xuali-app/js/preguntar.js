
$(document).ready(function () {

  $('#preguntar').click(function () {

    var pregunta = {};
    pregunta.titulo = $('#titulo').val();
    pregunta.descripcion = $('#pregunta').val();

    $.ajax({
        method: "POST",
        url: "http://127.0.0.1:8085/api/pregunta",
        data: {
          titulo: pregunta.titulo,
          descripcion: pregunta.descripcion
        }
      })
      .done(function (data) {
        console.log(data);
        
        Materialize.toast( localStorage.userName + ' bienvenido a xuali!', 1000, 'rounded', function () {
          location.href = 'preguntas.html';
        });
      })
      .fail(function (err) {
        console.log(JSON.stringify(err));
        Materialize.toast('Ouch!... No hemos podido enviar tu pregunta', 4000, 'rounded');
      });
  });

});
