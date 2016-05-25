<style>

.chartHeader {

  font-weight: bold;
  color: coral;
}

</style>

Medicare Spending Overview: An Interactive App
========================================================
author: Aimie Faucett, Associate Data Scientist
date: May 24, 2016
autosize: true
transition: rotate
width: 1400
height: 1000

<small>
Coursera Data Science Specialization <br/>
Data Products Course <br/>
Course Project
</small>

</span>

Motivation
========================================================
transition: rotate

The U.S. government spends a significant amount of money on Medicare. The public should have an easy to use app to better understand where the money is going.

<p class='chartHeader'> Discretionary Spending 2015 </p>
<!-- PieChart generated in R 3.2.4 by googleVis 0.5.10 package -->
<!-- Tue May 24 20:09:01 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataPieChartIDc397fa2e880 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Social Security, Unemployment & Labor",
29.1 
],
[
 "Transportation",
26.3 
],
[
 "Food & Agriculture",
13.1 
],
[
 "Military",
598.5 
],
[
 "Government",
72.9 
],
[
 "Education",
70 
],
[
 "Medicare & Health",
66 
],
[
 "Veteran Benefits",
65.3 
],
[
 "Housing & Community",
63.2 
],
[
 "International Affairs",
40.9 
],
[
 "Energy & Environment",
39.1 
],
[
 "Science",
29.7 
] 
];
data.addColumn('string','Item');
data.addColumn('number','Spending');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartPieChartIDc397fa2e880() {
var data = gvisDataPieChartIDc397fa2e880();
var options = {};
options["allowHtml"] = true;
options["legend"] = {position: 'labeled'};

    var chart = new google.visualization.PieChart(
    document.getElementById('PieChartIDc397fa2e880')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartPieChartIDc397fa2e880);
})();
function displayChartPieChartIDc397fa2e880() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartPieChartIDc397fa2e880"></script>
 
<!-- divChart -->
  
<div id="PieChartIDc397fa2e880" 
  style="width: 500; height: automatic;">
</div>

<p class='chartHeader'> Discretionary Spending 2015 </p>
<!-- PieChart generated in R 3.2.4 by googleVis 0.5.10 package -->
<!-- Tue May 24 20:09:01 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataPieChartIDc397cd3dcb2 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Social Security, Unemployment & Labor",
1246.6 
],
[
 "Medicare & Health",
985.7 
],
[
 "Food & Agriculture",
122.6 
],
[
 "Veteran Benefits",
95.3 
],
[
 "Transportation",
58.7 
],
[
 "Other",
58.2 
] 
];
data.addColumn('string','Item');
data.addColumn('number','Spending');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartPieChartIDc397cd3dcb2() {
var data = gvisDataPieChartIDc397cd3dcb2();
var options = {};
options["allowHtml"] = true;
options["legend"] = {position: 'labeled'};

    var chart = new google.visualization.PieChart(
    document.getElementById('PieChartIDc397cd3dcb2')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartPieChartIDc397cd3dcb2);
})();
function displayChartPieChartIDc397cd3dcb2() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartPieChartIDc397cd3dcb2"></script>
 
<!-- divChart -->
  
<div id="PieChartIDc397cd3dcb2" 
  style="width: 500; height: automatic;">
</div>

Data Aggregation
========================================================
transition: rotate

<span class='chartHeader'> Raw Data </span> <br/>
- Inpatient Spending by state, service and year
- Outpatient Spending by state, service and year
- Spending on top prescription drugs by drug name and year

<span class='chartHeader'> Data Manipulation </span> <br/>
Prescription spending data are aggregated by drug indication (www.drugs.com website, brand-name drugs are classified by disease or therapy) as the indication is more meaningful than a brand name of drug. Inpatient/outpatient spending are computed per capita (using 2015 population estimates from www.census.gov/popest/data/).

<span class='chartHeader'> Chart and Table Output </span> <br/>
- Total spending is shown by year as a broad overview in an interactive stacked bar chart.
- Per capita spending on inpatient and outpatient care are aggregated by state over all years, and shown as an interactive geo-map chart.
- Top prescription spending is aggregated by drug indication and year. The data are displayed as a line chart. The data are limited to the indication selected by the user.

Interactive App Interface
========================================================
transition: rotate

<span class='chartHeader'> Sample Output </span> <br/>

<img src='img/screenshot.png'>


Further Work
========================================================
transition: rotate

<span class='chartHeader'> Adding More Data </span> <br/>
- Data on medical equipment and supplies (e.g. wheelchairs or oxygen tanks)
- Data on over-the-counter drugs and healthcare-related items
- Data on Medicare spending

<span class='chartHeader'> Adding More Inputs </span> <br/>
- Allowing the user to toggle between chart types
- Allowing the user to have mulitple inputs for drug indications or categories of care
- Allowing users to download charts and/or data tables
