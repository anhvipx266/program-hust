$(document).ready(function(){
    $("#product-name").on("keyup",function(){
        var text = $(this).val();
        console.log(text);
        if(text.length<3 || text.length > 50){
            $("#error").show();
        }
        else{
            $("#error").hide();
        }
    })
    $("#date").on("input",function(){
        var val = $(this).val();
        var now = new Date();
        // console.log(now.getTime() , (new Date(val).getTime()));
        if(now.getTime() < (new Date(val).getTime())){
           
            $("#error-date").show();
        }
        else{
            $("#error-date").hide();
        }
        console.log(val,now);
    })
    $("#range").on("input",function(){
        var val = $(this).val();
        $("#range-show").text(val);
    })
    $("#submit").click(function(){
        var product = $("#product-name").val();
        var date = $("#date").val();
        date = new Date(date);
        var now = new Date();
        if(product.length>=3 && product.length<=50 && date.getTime()<now.getTime()){
            alert("Dialog");
        }
        else{
            // $("#ok-form").hide();
        }
    })
});