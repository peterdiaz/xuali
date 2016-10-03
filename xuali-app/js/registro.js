
$(document).ready(function () {

  $('#registrar').click(function () {

    var registro = {};
    registro.nombre = $('#nombre').val();
    registro.tipoDocumento = $('#tipoDocumento').val();
    registro.idDocumento = $('#idDocumento').val();
    registro.email = $('#email').val();
    registro.password = $('#password').val();

    $.ajax({
        method: "POST",
        url: "https://xualiapi.herokuapp.com/api/usuario/registro",
        data: {
          nombre: registro.nombre,
          tipoDocumento: registro.tipoDocumento,
          idDocumento: registro.idDocumento,
          email: registro.email,
          password: registro.password
        }
      })
      .done(function (data) {
        console.log(data);
        
        localStorage.basicAuth = data.basicAuth;
        localStorage.userName = data.nombre;

        Materialize.toast( data.nombre + ' bienvenido a xuali!', 1000, 'rounded', function () {
          location.href = 'historias.html';
        });
      })
      .fail(function (err) {
        console.log(JSON.stringify(err));
        Materialize.toast('Ouch!... Disculpa no hemos podido ingresar.', 4000, 'rounded');
      });
  });

});
