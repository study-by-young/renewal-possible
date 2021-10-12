/* ------------------------------------------------------------------------------
 *
 *  # Custom JS code
 *
 *  Place here all your custom js. Make sure it's loaded after app.js
 *
 * ---------------------------------------------------------------------------- */

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
