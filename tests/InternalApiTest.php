<?php
/**
 * Testing script for the local/internal use of the api
 *
 * @package   OpenEMR
 * @link      http://www.open-emr.org
 * @author    Brady Miller <brady.g.miller@gmail.com>
 * @copyright Copyright (c) 2019 Brady Miller <brady.g.miller@gmail.com>
 * @license   https://github.com/openemr/openemr/blob/master/LICENSE GNU General Public License 3
 */


// comment below exit command to run this test script
//  (when done, remember to uncomment it again)
//exit;


//api/settings/menu/imaging-client
//api/translation/7
//api/settings/menu
require_once(dirname(__FILE__) . "/../../interface/globals.php");

use OpenEMR\Common\Csrf\CsrfUtils;
?>
<html>
<head>
    <script src="../../public/assets/jquery/dist/jquery.min.js"></script>


    <script language="JavaScript">

        urlsToRun =[
          "/apis/fhir/v4/Encounter",
          "/apis/fhir/v4/Encounter/1",
            "/apis/fhir/v4/Encounter?_id=1",
            "/apis/fhir/v4/Encounter?_id=8&status=planned&status=in progress",
            "/apis/fhir/v4/Encounter?appointment=1&patient=2",
            "/apis/fhir/v4/Encounter?appointment=2&patient=3",
            "/apis/fhir/v4/Encounter?date=gt2020-02-09",
            "/apis/fhir/v4/Encounter?date=eq2020-02-09",
            "/apis/fhir/v4/Encounter?date=eq2020-02-09",
            "/apis/fhir/v4/Encounter?_sort=date",
            "/apis/fhir/v4/Encounter?_sort=-date",
            "/apis/fhir/v4/Encounter?_sort=-date,patient",
            "/apis/fhir/v4/Encounter?_include=Encounter:patient",
            "/apis/fhir/v4/Encounter?_summary=count&date=01-02-2020",
            "/apis/fhir/v4/Encounter?_sort=date,-priority,service-type",
            "/apis/fhir/v4/Organization",
            "/apis/fhir/v4/Organization/3",
            "/apis/fhir/v4/Organization?_id=4",
            "/apis/fhir/v4/Organization?_id=3&active=1",
            "/apis/fhir/v4/Organization?name=אשק",
            "/apis/fhir/v4/Patient"


        ];


        function testAjaxApi() {
           urlsToRun.forEach(function(value,index,array){
            $.ajax({
                type: 'GET',
                url: '../../'+value,
                dataType: 'json',
                headers: {
                    'apicsrftoken': <?php echo js_escape(CsrfUtils::collectCsrfToken('api')); ?>
                },
                success: function(thedata){
                    let thedataJSON = JSON.stringify(thedata);
                    $("#ajaxapi").html($("#ajaxapi").html()+"<br/><b><u>"+value+"</u></b><br/>"+thedataJSON+"<br/>");
                },
                error:function(e){
                    $("#ajaxapi").html($("#ajaxapi").html()+e);
                }
            });
           });
        }


        $(document).ready(function(){
            testAjaxApi();
        });
    </script>


</head>

<?php

// CALL the api via a local jquery ajax call
//  See above testAjaxApi() function for details.
echo "<pre>";
echo "<b>local jquery ajax call:</b><br>";
echo "<div id='ajaxapi'></div>";
echo "<br><br>";

?>
</html>
