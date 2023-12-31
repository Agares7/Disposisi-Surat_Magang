<?php
    //cek session
    if(!empty($_SESSION['admin'])){
?>

<noscript>
    <meta http-equiv="refresh" content="0;URL='./enable-javascript.html'" />
</noscript>

<!-- Footer START -->
<footer class="page-footer">
    <div class="container">
           <div class="row">
               <br/>
           </div>
    </div>
    <div class="footer-copyright green darken-2 white-text">
        <div class="container" id="footer">
            <?php
                $query = mysqli_query($config, "SELECT * FROM tbl_instansi");
                while($data = mysqli_fetch_array($query)){
            ?>
            <span class="white-text">&copy; <?php echo date("Y"); ?>
                <?php
                    if(!empty($data['nama'])){
                        echo $data['nama'];
                    } else {
                        echo ' Informatika  &nbsp;|&nbsp; <a class="white-text" href="http://masrud.com" target="_blank">By Ekky Ramadhan & Rega Muhammad Agassi</a>';
                    }
                ?>
            </a>
            </span>
            <div class="right hide-on-small-only">
                <?php
                    if(!empty($data['website'])){
                        echo '<i class="material-icons md-12">public</i> '.$data['website'].' &nbsp;&nbsp;&nbsp;';
                    } else {
                        echo '<i class="material-icons md-12">public</i>  &nbsp;&nbsp;';
                    }
                    if(!empty($data['email'])){
                        echo '<i class="material-icons">mail_outline</i> '.$data['email'].'';
                    } else {
                        echo '<i class="material-icons">mail_outline</i>  ';
                    }
                }
                ?>
            </div>
        </div>
    </div>
</footer>
<!-- Footer END -->

<!-- Javascript START -->
<script type="text/javascript" src="asset/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="asset/js/materialize.min.js"></script>
<script type="text/javascript" src="asset/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.min.js"></script>
<script data-pace-options='{ "ajax": false }' src='asset/js/pace.min.js'></script>
<script type="text/javascript">

//jquery dropdown
$(".dropdown-button").dropdown({ hover: false });

//jquery sidenav on mobile
$('.button-collapse').sideNav({
    menuWidth: 240,
    edge: 'left',
    closeOnClick: true
});

//jquery datepicker
$('#tgl_surat,#batas_waktu,#dari_tanggal,#sampai_tanggal').pickadate({
    selectMonths: true,
    selectYears: 10,
    format: "yyyy-mm-dd"
});

//jquery teaxtarea
$('#isi_ringkas').val('');
$('#isi_ringkas').trigger('autoresize');

//jquery dropdown select dan tooltip
$(document).ready(function(){
    $('select').material_select();
    $('.tooltipped').tooltip({delay: 10});
});

//jquery autocomplete
$(function() {
    $( "#kode" ).autocomplete({
        source: 'kode.php'
    });
});

//jquery untuk menampilkan pemberitahuan
$("#alert-message").alert().delay(5000).fadeOut('slow');

//jquery modal
$(document).ready(function(){
   $('.modal-trigger').leanModal();

 });

 function getval(sel)
    {
        if(sel.value=="internal"){
            document.getElementById("asal1").style.display = "none";
            document.getElementById("asal2").style.display = "block";
            // document.getElementById("no2").style.display = "block";
            // document.getElementById("no1").style.display = "none";
            // document.getElementById("no_surat").value = "";
            // document.getElementById("no_surat").required = false;
            // document.getElementById("no_surat1").required = true;
            // document.getElementById("no_surat3").required = true;
            document.getElementById("asal_surat1").required = false;
            document.getElementById("asal_surat2").required = true;

        }else{
            document.getElementById("asal1").style.display = "block";
            document.getElementById("asal2").style.display = "none";
            // document.getElementById("no2").style.display = "none";
            // document.getElementById("no1").style.display = "block";
            // document.getElementById("no_surat1").value = "";
            // document.getElementById("no_surat").required = true;
            // document.getElementById("no_surat1").required = false;
            // document.getElementById("no_surat3").required = false;
            document.getElementById("asal_surat2").required = false;
            document.getElementById("asal_surat1").required = true;
        }

    }

    function getval2(sel)
    {
        document.getElementById("no_surat2").value = sel.value;

    }

    function getval3(sel)
    {
        document.getElementById("no_surat3").value = sel.options[sel.selectedIndex].text;

    }

    function getval4(sel)
    {
        <?php 
            $year=date('Y');
            // echo "SELECT count(*) FROM tbl_surat_keluar WHERE year(tgl_surat)='$year'";
            $count = mysqli_query($config, "SELECT count(*) FROM tbl_surat_keluar WHERE year(tgl_surat)='$year'")->fetch_row()[0]+1;
            $no_surat=$count."/UN24.7/".$year;
        ?>
        document.getElementById("no_surat").value = "<?= $count ?>/UN24.7/"+sel.options[sel.selectedIndex].text+"/<?= $year ?>";

    }

</script>
<!-- Javascript END -->

<?php
    } else {
        header("Location: ../");
        die();
    }
?>
