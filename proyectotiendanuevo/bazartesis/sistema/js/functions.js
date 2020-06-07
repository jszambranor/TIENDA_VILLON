$(document).ready(function(){

    //--------------------- SELECCIONAR FOTO PRODUCTO ---------------------
    $("#foto").on("change",function(){
    	var uploadFoto = document.getElementById("foto").value;
        var foto       = document.getElementById("foto").files;
        var nav = window.URL || window.webkitURL;
        var contactAlert = document.getElementById('form_alert');
        
            if(uploadFoto !='')
            {
                var type = foto[0].type;
                var name = foto[0].name;
                if(type != 'image/jpeg' && type != 'image/jpg' && type != 'image/png')
                {
                    contactAlert.innerHTML = '<p class="errorArchivo">El archivo no es válido.</p>';                        
                    $("#img").remove();
                    $(".delPhoto").addClass('notBlock');
                    $('#foto').val('');
                    return false;
                }else{  
                        contactAlert.innerHTML='';
                        $("#img").remove();
                        $(".delPhoto").removeClass('notBlock');
                        var objeto_url = nav.createObjectURL(this.files[0]);
                        $(".prevPhoto").append("<img id='img' src="+objeto_url+">");
                        $(".upimg label").remove();
                        
                    }
              }else{
              	alert("No selecciono foto");
                $("#img").remove();
              }              
    }); 


    $('.delPhoto').click(function(){
    	$('#foto').val('');
    	$(".delPhoto").addClass('notBlock');
    	$("#img").remove();

      if($("#foto_actual") && $("#foto_remove")){
          $("#foto_remove").val('image_producto-png');
      }

    });

// Modal form add product

$('.add_product').click(function(e) {
        /* ACT on the event*/
        e.preventDefault();
        var producto = $(this).attr('product');
        var action = 'infoProducto';

        $.ajax({
         url: 'ajax.php',
         type: 'POST',
         async: true,
         data: {action:action,producto:producto},

         succes: function(response)
         {
            
         },
         error: function(error){
            console.log(error);
         }
     });

     

       
        $('.modal').fadeIn();
    });
  $('#search_proveedor').change(function(e){
    e.preventDefault();
    var sistema = getUrl();
    location.href = sistema+'buscar_producto.php?proveedor='+$(this).val();
  });
  // cambiar password
  $('.newPass').keyup(function(){
      validPass();
  });

  //fomr cambiar contraseña
  $('#frmChangePass').submit(function(e){
    e.preventDefault();

    var passActual = $('#txtPassUser').val();
    var passNuevo =  $('#txtNewPassUser').val();
    var confirmPassNuevo = $('#txtPassConfirm').val();
    var action = "changePassword";

    if(passNuevo != confirmPassNuevo){
         $('.alertChangePass').html('<p style=color:red;"color:">Las contraseñas no son iguales.</p>');
         $('.alertChangePass').slideDown();
         return false;
  }

    if(passNuevo.length < 6 ){
         $('.alertChangePass').html('<p>La nueva contraseña debe ser de 6 caracteres como minimo.</p>');
         $('.alertChangePass').slideDown();
         return false;
  }

  $.ajax({
      url : 'ajax.php',
      type: "POST",
      async : true,
      data: {action:action,passActual:passActual,passNuevo:passNuevo},

      succes : function(response)
    {
          if(response != 'error')
            {
                var info = JSON.parse(response);
                if(info.cod == '00'){
                  $('.alertChangePass').html('<p style="color:green;">'+info.msg+'</p>');
                  $('#frmChangePass')[0].reset();
                }else{
                  $('.alertChangePass').html('<p style="color:red;">'+info.msg+'</p>');
                }
                  $('.alertChangePass').slideDown();
            }   
    },
    error: function(error){
    }
  });

  });

});
//end ready

function validPass(){
  var passNuevo = $('#txtNewPassUser').val();
  var confirmPassNuevo = $('#txtPassConfirm').val();
  if(passNuevo != confirmPassNuevo){
    $('.alertChangePass').html('<p style=color:red;"color:">Las contraseñas no son iguales.</p>');
    $('.alertChangePass').slideDown();
    return false;
  }

  if(passNuevo.length < 6 ){
    $('.alertChangePass').html('<p style=color:red>La nueva contraseña debe ser de 6 caracteres como minimo.</p>');
    $('.alertChangePass').slideDown();
    return false;
  }

  $('.alertChangePass').html('');
  $('.alertChangePass').slideUp();
}


function getUrl () {
  var loc = window.location;
  var pathName = loc.pathname.substring(0,loc.pathname.lastIndexOf('/') + 1);
  return loc.href.substring(0,loc.href.length - ((loc.pathname + loc.search + loc.hash).length - pathName.length));
}


function coloseModal(){
    $('.modal').fadeOut();

}