
$(document).ready(function () {

  $('#ingresar').click(function () {

    var registro = {};
    registro.email = $('#email').val();
    registro.password = $('#password').val();

    $.ajax({
        method: "POST",
        url: "http://127.0.0.1:8085/api/usuario/login",
        data: {
          email: registro.email,
          password: registro.password
        }
      })
      .done(function (data) {
        console.log(data);
        localStorage.basicAuth = data.basicAuth;    
        Materialize.toast('Ingreso exitoso!', 1000, 'rounded', function () {
          location.href = 'historias.html';
        });
      })
      .fail(function (err) {
        console.log(JSON.stringify(err));
        Materialize.toast('Ouch!... Disculpa hubo un problema en el proceso.', 4000, 'rounded');
      });
  });

});
