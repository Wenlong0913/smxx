$(window).ready(function() {
  var body = $('body.admin-trackers_visits.index')
  /*These lines are all chart setup.  Pick and choose which chart features you want to utilize. */
  if (body.length > 0) {
    nv.addGraph(function() {
      var chart = nv.models.lineChart().useInteractiveGuideline(true);
                    // .margin({left: 100})  //Adjust chart margins to give the x-axis some breathing room.
                    // .useInteractiveGuideline(true)  //We want nice looking tooltips and a guideline!
                    // .transitionDuration(350)  //how fast do you want the lines to transition?
                    // .showLegend(true)       //Show the legend, allowing users to turn on/off line series.
                    // .showYAxis(true)        //Show the y-axis
                    // .showXAxis(true)        //Show the x-axis

      chart.xAxis     //Chart x-axis settings
          .axisLabel('日期 (ms)')
          .tickFormat(function(d) {
            return d3.time.format('%Y/%m/%d')(new Date(parseInt(d+'000')))
          });

      chart.yAxis     //Chart y-axis settings
          .axisLabel('访问量 (v)')
          .tickFormat(d3.format('.02f'));

      /* Done setting the chart up? Time to render it!*/
      var myData = get_data();   //You need data...

      d3.select('#chart svg')    //Select the <svg> element you want to render the chart in.
          .datum(myData)         //Populate the <svg> element with chart data...
          .transition().duration(500)
          .call(chart);          //Finally, render the chart!

      //Update the chart when window resizes.
      nv.utils.windowResize(function() { chart.update() });
      return chart;
    });
  }
  /**************************************
   * get data
   */
  function get_data() {
    data = $('#trackers_visits .chart-content #chart').data('json');
    return [
      {
        values: data[0],      //values - represents the array of {x,y} data points
        key: 'IP量', //key  - the name of the series.
        color: '#ff7f0e', //color - optional: choose your own line color.
        area: true
      },
      {
        values: data[1],
        key: '访客数',
        color: '#7777ff',
        area: true      //area - set to true if you want this line to turn into a filled area chart.
      }
    ];
  }
})
