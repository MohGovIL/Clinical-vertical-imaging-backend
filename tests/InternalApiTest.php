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
    <style>
        pre {outline: 1px solid #89b7cc; padding: 5px; margin: 5px; }
        .string { color: green; }
        .number { color: darkorange; }
        .boolean { color: blue; }
        .null { color: magenta; }
        .key { color: red; }

    </style>
    <script src="../../public/assets/jquery/dist/jquery.min.js"></script>


    <script language="JavaScript">

        urlsToRun =[
            "/apis/fhir/v4/Encounter",
            "/apis/fhir/v4/Encounter/1",
            "/apis/fhir/v4/Encounter?_id=1",
            "/apis/fhir/v4/Encounter?_id=1&status=planned&status=in progress",
            "/apis/fhir/v4/Encounter?_id=2&status=planned&status=in progress",
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
            "/apis/fhir/v4/Patient",
            "/apis/fhir/v4//Encounter?date=gt2020-02-04&_sort=date&status=arrived&status=triaged&status=in-progress&_include=Encounter:patient"





        ];

        function output(inp,count) {
            var temp =(document.createElement('pre'));
            temp.innerHTML = inp;
            if(typeof (count)!=undefined) {
                temp.id = "pre_" + counter;


            }
            else{
                temp.id = "pre_" + counter++;
            }

            $("#answer").append(temp);
            $("#"+temp.id).on("click",function(){
                var id = Number(this.id.split("_")[1])+1;
                $("#pre_"+id).slideToggle( "slow", function() {
                    // Animation complete.
                });
            });
            counter++;
        }
        function syntaxHighlight(json) {
            json = json.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
            return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function (match) {
                var cls = 'number';
                if (/^"/.test(match)) {
                    if (/:$/.test(match)) {
                        cls = 'key';
                    } else {
                        cls = 'string';
                    }
                } else if (/true|false/.test(match)) {
                    cls = 'boolean';
                } else if (/null/.test(match)) {
                    cls = 'null';
                }
                return '<span class="' + cls + '">' + match + '</span>';
            });
        }

        function testAjaxApi() {
            counter = 0;
            urlsToRun.forEach(function(value,index,array){
                $.ajax({
                    type: 'GET',
                    url: '../../'+value,
                    dataType: 'json',
                    headers: {
                        'apicsrftoken': <?php echo js_escape(CsrfUtils::collectCsrfToken('api')); ?>
                    },
                    success: function(thedata){

                        output(value,counter);
                        output(syntaxHighlight(JSON.stringify(thedata, undefined, 4)));


                        /* let thedataJSON = JSON.stringify(thedata);
                         thedataJSON = JSON.stringify(thedataJSON, null, 2);
                         $("#ajaxapi").html($("#ajaxapi").html()+"<br/><b style='font-size: 24px;'><u>"+value+"</u></b><br/>"+thedataJSON+"<br/>");*/
                    },
                    error:function(e){
                        output(value,counter);
                        output(JSON.stringify({'responseText':e.responseText,'status':e.status,'ststusText':e.statusText}));
                        output("refresh page");

                    }
                });
            });
        }


        $(document).ready(function(){
            testAjaxApi();



            $("#runAPI").on("click",function(){
                $("#answer").html("");
                urlsToRun = [$("#url").val()];
                testAjaxApi();
            });

        });
    </script>


</head>

<?php

// CALL the api via a local jquery ajax call
//  See above testAjaxApi() function for details.
echo "<pre>";
echo "<b>local jquery ajax call:</b><br>";
echo "<div id='ajaxapi'> <textArea style='width:80%' id='url' value='' placeholder='enter your call here'></textArea>        <button id='runAPI'>run api</button> </div>";
echo "<br><br> <div id='answer'></div>";

?>
</html>
