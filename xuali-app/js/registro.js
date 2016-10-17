$(document).ready(function () {

  $('#tipoDocumento').material_select();

  $('#registrar').click(function () {

    var registro = {};
    registro.nombre = $('#nombre').val();
    registro.email = $('#email').val();
    registro.tipoDocumento = $('#tipoDocumento').val();
    registro.idDocumento = $('#idDocumento').val();
    registro.password = $('#password').val();
    registro.password2 = $('#password2').val();

    if (validarFormulario(registro)) {
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
          localStorage.userId = data.id;

          Materialize.toast(data.nombre + ' bienvenido a xuali!', 1000, 'rounded', function () {
            location.href = 'historias.html';
          });
        })
        .fail(function (err) {
          console.log(JSON.stringify(err));
          Materialize.toast(err.responseJSON.message, 4000, 'rounded');
        });
    } else {

    }
  });

  function validarFormulario(data){

    if (data.email == null || data.email.length == 0){
      Materialize.toast('Ingresa un correo', 4000, 'rounded');
      return false;
    }

    if (data.password == null || data.password.length == 0){
      Materialize.toast('Ingresa una clave', 4000, 'rounded');
      return false;
    }

    if (data.password.length < 4){
      Materialize.toast('La clave debe tener al menos 4 caracteres', 4000, 'rounded');
      return false;
    }

    if(data.password != data.password2){
      Materialize.toast('Las claves no coinciden', 4000, 'rounded');
      return false;
    }

    return true;
  }

});