<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .avatar{
            width: 50px;
            height: 50px;
        }
        .container-2{
            display: flex;
            justify-content: space-around;
        }
        .product-item{
            width: 160px;
            padding: 10px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .product-image{
            height: 80%;
            width:auto;
        }
        .view-bt{
            background-color: blue;

        }
        .action-bt{
            background-color: red;
        }
        .bt-container{
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
    <?php 
    $users = [
        ['name' => "Nguyễn Huy Hoàng", 'email'=>'hoang@gmail.com','phone'=> '0123123454','gender'=> 0,'avatar'=>'avatar.jpg'],
        ['name' => "Nguyễn Huy Phương", 'email'=>'phuong@gmail.com','phone'=> '0123123454','gender'=> 1,'avatar'=>'avatar.jpg']
    ];
    $products = [
        ['name'=>'Rau củ trộn', 'image'=>'avatar.jpg', 'price'=>'160,000', 'sale_price'=>'0'],
        ['name'=>'Rau củ trộn', 'image'=>'avatar.jpg', 'price'=>'180,000', 'sale_price'=>'160,000'],
        ['name'=>'Rau củ trộn', 'image'=>'avatar.jpg', 'price'=>'160,000', 'sale_price'=>'100,000']
    ];
    $products2 =[
        [ 'id'=> 1, 'name'=>'Rau', 'image'=>'avatar.jpg', 'price'=>100000, 'quantity'=>2],
        [ 'id'=> 2, 'name'=>'Rau', 'image'=>'avatar.jpg', 'price'=>20000, 'quantity'=>3],
        [ 'id'=> 3, 'name'=>'Rau', 'image'=>'avatar.jpg', 'price'=>45000, 'quantity'=>1],
        [ 'id'=> 4, 'name'=>'Rau', 'image'=>'avatar.jpg', 'price'=>300000, 'quantity'=>2],
    ]
    ?>
    <table border = '1' cellspacing = '0' cellpadding = '10'>
        <tr>
            <th>Tên</th>
            <th>Email</th>
            <th>SDT</th>
            <th>Giới tính</th>
            <th>Avatar</th>
        </tr>
        <?php foreach($users as $info){ ?>
        <tr>
            <td><?php echo $info['name'] ?></td>
            <td><?php echo $info['email'] ?></td>
            <td><?php echo $info['phone'] ?></td>
            <td><?php echo $info['gender']==0?'Nam':'Nữ' ?></td>
            <td><img src="imgs/<?php echo $info['avatar'] ?>" alt="" class="avatar"> </td>
        </tr>
        <?php }?>
    </table>
    <hr>
    <div class="container-2">
    <?php foreach($products as $info){ ?>
        <div class="product-item">
            <img src="imgs/<?php echo $info['image'] ?>" alt="" class="product-image">
            <h3><?php echo $info['name'] ?></h3>
            <p>
                <?php 
                    if($info['sale_price']=='0'){
                        echo "<span>Price: {$info['price']}</span>";
                    }
                    else{
                        echo "<del>Price: {$info['price']}</del>";
                        echo "<span>Sale: {$info['sale_price']}</span>";
                    }
                ?>
                
            </p>
            <div class="bt-container">
                <button class="view-bt">View</button>
                <button class="action-bt">Action</button>
            </div>
        </div>
    <?php }?>  
    </div>
    <hr>
    <table border = '1' cellspacing = '0' cellpadding = '10'>
        <tr>
            <th>ID</th>
            <th>Image</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Sub total</th>
        </tr>
        <?php 
        $total_quantity = 0;
        $total_price = 0;
        foreach($products2 as $info){ ?>
        <tr>
            <?php 
            $sub = $info['quantity'] * $info['price'];
            $total_quantity += $info['quantity'];
            $total_price += $sub;
            ?>
            <td><?php echo $info['id'] ?></td>
            <td><img src="imgs/<?php echo $info['image'] ?>" alt="" class="avatar"> </td>
            <td><?php echo $info['name'] ?></td>
            <td><?php echo $info['price'] ?></td>
            <td><?php echo $info['quantity'] ?></td>
            <td><?php echo $sub ?></td>
        </tr>
        <?php }?>
        <tfoot>
            <tr>
                <td colspan ='4' style="text-align: right;">Total Quantity</td>
                <td colspan ='2'><?php echo $total_quantity ?></td>
            </tr>
            <tr>
                <td colspan ='4' style="text-align: right;">Total Price</td>
                <td colspan ='2'><?php echo $total_price ?></td>
            </tr>
        </tfoot>
    </table>
    
</body>
</html>
