<style>

.chartHeader {

  font-weight: bold;
  color: coral;
}

.body {

  background-color: white;
}

</style>

Medicare Spending Overview: An Interactive App
========================================================
author: Aimie Faucett, Associate Data Scientist
date: May 24, 2016
autosize: true
transition: rotate

<small>
Coursera Data Science Specialization <br/>
Data Products Course <br/>
Course Project
</small>

Motivation
========================================================
transition: rotate

The U.S. government spent appxoimately $2.45 trillon in mandatory spending, 38.4% was on Medicare & Health. An additional $66.03 billion was spent on discretionary spending in the same category. 
- The U.S. spends a significant amount on this category. 
- <span class='emphasized'>The public should have an easy to use app to better understand where the money is going.</span>

<p class='chartHeader'> Discretionary Spending 2015 </p>
<!-- PieChart generated in R 3.2.4 by googleVis 0.5.10 package -->
<!-- Tue May 24 12:38:51 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataPieChartID1f00b0c1b4b () {
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
function drawChartPieChartID1f00b0c1b4b() {
var data = gvisDataPieChartID1f00b0c1b4b();
var options = {};
options["allowHtml"] = true;
options["legend"] = {position: 'labeled'};

    var chart = new google.visualization.PieChart(
    document.getElementById('PieChartID1f00b0c1b4b')
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
callbacks.push(drawChartPieChartID1f00b0c1b4b);
})();
function displayChartPieChartID1f00b0c1b4b() {
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
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartPieChartID1f00b0c1b4b"></script>
 
<!-- divChart -->
  
<div id="PieChartID1f00b0c1b4b" 
  style="width: 500; height: automatic;">
</div>

<p class='chartHeader'> Discretionary Spending 2015 </p>
<!-- PieChart generated in R 3.2.4 by googleVis 0.5.10 package -->
<!-- Tue May 24 12:38:51 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataPieChartID1f00670873da () {
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
function drawChartPieChartID1f00670873da() {
var data = gvisDataPieChartID1f00670873da();
var options = {};
options["allowHtml"] = true;
options["legend"] = {position: 'labeled'};

    var chart = new google.visualization.PieChart(
    document.getElementById('PieChartID1f00670873da')
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
callbacks.push(drawChartPieChartID1f00670873da);
})();
function displayChartPieChartID1f00670873da() {
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
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartPieChartID1f00670873da"></script>
 
<!-- divChart -->
  
<div id="PieChartID1f00670873da" 
  style="width: 500; height: automatic;">
</div>

