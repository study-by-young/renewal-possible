/* ------------------------------------------------------------------------------
 *
 *  # Custom JS code
 *
 *  Place here all your custom js. Make sure it's loaded after app.js
 *
 * ---------------------------------------------------------------------------- */

function customAlert(title, message) {
    bootbox.alert({
        title: title,
        message: message,
        buttons: {
            ok : {
                label: '확인',
                className: 'btn-primary'
            }
        }
    });
}

function customConfirm(title, message, callbackFunc){
    bootbox.confirm({
        title: title,
        message: message,
        buttons: {
            confirm: {
                label: '확인',
                className: 'btn-primary'
            },
            cancel: {
                label: '취소',
                className: 'btn-link'
            }
        },
        callback: callbackFunc
    });
}

 jQuery.fn.serializeObject = function() {
      var obj = null;
      try {
          if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
              var arr = this.serializeArray();
              if(arr){ obj = {};
              jQuery.each(arr, function() {
                  obj[this.name] = this.value; });
              }
          }
      }catch(e) {
          alert(e.message);
      }finally {}
      return obj;
    }
