<section id="main-content">
  <section class="wrapper">
    <center>
      <section class="panel" style="width: 70%;">
          <header class="panel-heading">
              <b>New Nurse</b>
          </header>
          <div class="panel-body">
            <?php
              $attributes = array('class'=>'form-horizontal', 'role'=>'form');
              echo form_open('admin/insert_nurse', $attributes);
            ?>

            <div class="form-group">
                <label  class="col-lg-3 col-sm-3 control-label">Type: </label>
                <div class="col-lg-9">
                  <select class="form-control" name="nursetype">
                    <option value='3'>Nurse Manager</option>
                    <option value='4'>Charge Nurse</option>
                    <option value='5'>Bedside Nurse</option>
                  </select>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 col-sm-3 control-label">Last Name: </label>
                <div class="col-lg-9">
                    <input type="text" name="lastname" class="form-control" placeholder="Last Name">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 col-sm-3 control-label">First Name: </label>
                <div class="col-lg-9">
                    <input type="text" name="firstname" class="form-control" placeholder="First Name">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 col-sm-3 control-label">Middle Name: </label>
                <div class="col-lg-9">
                    <input type="text" name="middlename" class="form-control" placeholder="Middle Name">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 col-sm-3 control-label">User Name: </label>
                <div class="col-lg-9">
                    <input type="text" name="username" class="form-control" placeholder="Username">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 col-sm-3 control-label">Email</label>
                <div class="col-lg-9">
                    <input type="email" name="email" class="form-control" placeholder="Email">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 col-sm-3 control-label">Gender: </label>
                <div class="col-lg-9">
                  <div class="radios">
                      <label class="label_radio" for="radio-01">
                          <input name="gender" id="radio-01" value="M" type="radio" checked /> MALE &nbsp;
                          <input name="gender" id="radio-02" value="F" type="radio" /> FEMALE
                      </label>
                  </div>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 col-sm-3 control-label">Birth Date: </label>
                <div class="col-lg-9">
                    <input type="date" name="birthday" class="form-control">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 col-sm-3 control-label">Mobile Number: </label>
                <div class="col-lg-9">
                    <input type="text" name="mobile_number" class="form-control" placeholder="Mobile Number">
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-12">
                  <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info">
                </div>
            </div>
          </div>
      </section>
    </center>
  </section>
</section>
