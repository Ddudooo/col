function levelConvert(){
      var channelLevel=$('#level').val();
      var chnLv='';
      var style='';
      if(channelLevel==='')
         {
            alert('값이 없습니다.');
         }
      
      switch(channelLevel){
         case '0': chnLv='Level을 지정하지 않았습니다.';
                    style='btn-dark';
            break;
         case '1': chnLv='LEVEL.1';
                   style='btn-primary';
            break;
         case '2': chnLv='LEVEL.2';
                  style='btn-success';
            break;
         case '3': chnLv='LEVEL.3';
                  style='btn-info';
            break;
         case '4': chnLv='LEVEL.4';
                  style='btn-warning';
            break;
         case '5': chnLv='LEVEL.5';
                  style='btn-danger';
            break;
      }

      $("#level").attr('class','btn waves-effect waves-light '+style).val(chnLv);
   }
   
   function cateConvert(){
      var channelCate=$('#cate').val();;
      var chnCt='';
      var style='';
      
      if(channelCate==='')
      {
         alert('값이 없습니다.');
      }
   
      switch(channelCate){
      case '0': chnCt='카테고리를 지정하지 않았습니다.';
                 style='btn-dark';
         break;
      case '1': chnCt='Java';
                style='btn-primary';
         break;
      case '2': chnCt='C++';
               style='btn-success';
         break;
      case '3': chnCt='C';
               style='btn-info';
         break;
      case '4': chnCt='Python';
               style='btn-warning';
         break;
      case '5': chnCt='JavaScript';
               style='btn-danger';
         break;
      case '6': chnCt='CSS';
               style='btn-danger';
         break;
   }

      $("#cate").attr('class','btn waves-effect waves-light '+style).val(chnCt);
   }
