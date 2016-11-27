
$(document).ready(function () {

  $('#preguntar').click(function () {

    var pregunta = {};
    
    pregunta.userId = localStorage.userId;
    pregunta.titulo = $('#titulo').val();
    pregunta.descripcion = $('#pregunta').val();

    $.ajax({
        method: "POST",
        url: "http://www.xualiapp.com:8085/api/preguntas",
        data: {
          userId: pregunta.userId,
          titulo: pregunta.titulo,
          pregunta: pregunta.descripcion
        }
      })
      .done(function (data) {
        Materialize.toast( 'Pronto te responderemos!', 1000, 'rounded', function () {
          location.href = 'preguntas.html';
        });
      })
      .fail(function (err) {
        console.log(JSON.stringify(err));
        Materialize.toast('Ouch!... Algo no salió bien!', 4000, 'rounded');
      });
  });

});
