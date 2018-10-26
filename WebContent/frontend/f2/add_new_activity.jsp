<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <link rel="stylesheet" href="css/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <style>
    body {
      background: #333;
      color: #fff; }
    #home-section {
      background: url("img/home.jpg") no-repeat;
      background-size: cover;
      background-attachment: fixed;
      min-height: 700px;
     }
      #home-section .dark-overlay {
        background-color: rgba(0, 0, 0, 0.7);
        min-height: 700px;
      }
      #home-section .home-inner {
        padding-top: 150px;
      }

      #home-section .card-form {
        opacity: 0.8;
      }
      #home-section .fa {
        color: #008ed6;
        background: #fff;
        padding: 4px;
        border-radius: 5px;
        font-size: 30px;
      }
      .navbar {
        border-bottom: #008ed6 3px solid;
        opacity: 0.8; }

  </style>
</head>
<body>
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <div class="container">
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>

      <a href="index.html" class="w3-bar-item w3-right navbar-brand"><img class="w3-circle" src="joinme.jpg" style="width:50px;margin-right:5px;">JOIN ME!</a>

    </div>
  </nav>

  <!-- HOme section -->

  <header id="home-section">
    <div class="dark-overlay">
      <div class="home-inner">
        <!-- HEADINGGG -->
        <h5 class="display-4 text-center mb-4"><strong> Add a new Activity!</strong></h5>
        <p class="display-5 text-center mb-4 lead">Just fill the form to add a new Activity.</p>
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="card bg-primary text-center card-form">
                <div class="card-body">
                  <h3>Activity Details</h3>
                  <p>please fill out this form to add activity</p>
                <form action="">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" placeholder="Tag Name">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" placeholder="Name(title)">
                  </div>
                  <div class="form-group">

                    <textarea type="text" class="form-control form-control-lg" placeholder="Description">Description of the event
                    </textarea>
                  </div>
                  <div class="form-group">
                    <map>
                      HEre GOES THE MAPPSS
                    </map>
                  </div>


                  <input type="submit" class="btn btn-outline-light btn-block">
                  </form>
                </div>
              </div>
          </div>

          </div>
        </div>
      </div>
    </div>
  </header>
</body>
</html>