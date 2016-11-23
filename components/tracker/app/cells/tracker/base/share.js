$(window).ready(function(){
  var tmp = $('.share_statistic');
  if(tmp.length > 0){
    nv.addGraph(function(){
      var chart = nv.models.discreteBarChart()
          .x(function(d) { return d.label })    //Specify the data accessors.
          .y(function(d) { return d.value })
          .staggerLabels(true)    //Too many bars and not enough room? Try staggering labels.
          // .tooltips(false)        //Don't show tooltips
          .showValues(true)       //...instead, show the bar value right on top of each bar.
          // .transitionDuration(350)
          ;

      d3.select('#chart_pv svg')
          .datum(exampleData())
          .call(chart);
      d3.select('#bar_graph svg')
          .datum(exampleData())
          .call(chart);

      nv.utils.windowResize(chart.update);

      return chart;
    });

    //Each bar represents a single discrete quantity.
    function exampleData() {
     return [
        {
          key: "Cumulative Return",
          values: [
            {
              "label" : "2016/11/2" ,
              "value" : 29.765957771107
            } ,
            {
              "label" : "2016/11/3" ,
              "value" : 0
            } ,
            {
              "label" : "2016/11/4" ,
              "value" : 32.807804682612
            } ,
            {
              "label" : "2016/11/5" ,
              "value" : 196.45946739256
            } ,
            {
              "label" : "2016/11/6" ,
              "value" : 0.19434030906893
            } ,
            {
              "label" : "2016/11/7" ,
              "value" : 98.079782601442
            } ,
            {
              "label" : "2016/11/8" ,
              "value" : 13.925743130903
            } ,
            {
              "label" : "2016/11/10" ,
              "value" : 95.1387322875705
            },
            {
              "label" : "2016/11/11" ,
              "value" : 5.1387322875705
            },
            {
              "label" : "2016/11/12" ,
              "value" : 65.1387322875705
            },
            {
              "label" : "2016/11/13" ,
              "value" : 54.1387322875705
            },
            {
              "label" : "2016/11/14" ,
              "value" : 25.1387322875705
            }
          ]
        }
      ]
      ;
    };
  }
})
