
$(document).ready(function () {

  $('#ingresar').click(function () {

    var registro = {};
    registro.email = $('#email').val();
    registro.password = $('#password').val();

    $.ajax({
        method: "POST",
        url: "http://www.xualiapp.com:8085/api/usuario/login",
        data: {
          email: registro.email,
          password: registro.password
        }
      })
      .done(function (data) {
        console.log(data);
        localStorage.basicAuth = data.basicAuth; 
        localStorage.userName = data.nombre; 
        localStorage.userId = data.id;

        Materialize.toast( localStorage.userName + ' bienvenido a xuali!', 1000, 'rounded', function () {
          location.href = 'historias.html';
        });
      })
      .fail(function (err) {
        console.log(JSON.stringify(err));
        Materialize.toast('Ouch!... no hemos podido ingresar.', 4000, 'rounded');
      });
  });

});
