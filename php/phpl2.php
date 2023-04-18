<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .image-modal{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .image-show{
            height: 80%;
            width: 80%;
        }
        .image-2-1{float: left;height: 120px;}
        .image-2-0{float:right;height: 120px;}
        .block-image{height: 120px;width: auto;clear: both;}
    </style>
</head>

<body>
    <div class="row">
        <?php for($i = 1; $i <= 4;$i++){ ?>
                <div class="col-sm-6 col-md-4 col-lg-3 image-modal">

            <img src="imgs/image1.jpg" alt="" class="image-show">
            <!-- Button to Open the Modal -->
            <p>Hình ảnh <?php echo $i?></p>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                View
            </button>
            <!-- The Modal -->
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Modal hình ảnh <?php echo $i?></h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <img src="imgs/image1.jpg" alt="">
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
            <?php } ?>
        
    </div>
    <?php for($i = 1; $i <= 4; $i++){ ?>
            <div class="<?php echo $i%2==0?"bg-primary text-light":"" ?> block-image">
                <img src="imgs/image1.jpg" alt="" class="image-2-<?php echo $i%2 ?>">
                <h3>Hình ảnh <?php echo $i ?></h3>
                <p>Text goes here...</p>
            </div>

        <?php }?>
    
    <table cellspacing= "0" border = "1" style="width: 100%;">
    <?php for($i = 1; $i <= 6; $i++){ ?>
        <tr>
            <td>Item <?php echo $i ?></td>
            <td style="width: 50px;"><span class="badge bg-secondary" style="justify-self: end;"><?php echo $i ?></span></td>
        </tr> 
        <?php }?>
    </table>
    <div class="checkbox-group row">
    <?php for($i = 1; $i <= 3*6; $i++){ ?>
        <div class="col col-lg-4">
        <input type="checkbox" name="" id="" <?php echo ($i>2&&$i%2==0)?"checked":"" ?> >Checkbox <?php echo ($i-1)%6+1 ?> 

        </div>
        <?php }?>
    </div>
    
</body>

</html>
