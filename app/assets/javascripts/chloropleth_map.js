$(function () {

  // Initiate the chart
  $('#container').highcharts('Map', {

    chart: {
      style: {
        fontFamily: 'Arimo',
        color: "rgba(21,21,23,0.85)"
      },
      height: 800
    },

    title : {
      style: {
        fontSize: "1.6875rem"
      },
      text : 'Pageviews By State'
    },

    subtitle : {
      text : 'Source map: <a href="http://code.highcharts.com/mapdata/countries/us/us-all.js">United States of America</a>'
    },

    mapNavigation: {
      enabled: true,
      buttonOptions: {
        verticalAlign: 'bottom'
      }
    },

    colorAxis: {
      min: 0,
      minColor: "#B7E3FF",
      maxColor: "#005990"
    },

    series : [{
      data : data,
      mapData: Highcharts.maps['countries/us/us-all'],
      joinBy: 'hc-key',
      name: 'Pageviews',
      borderColor: '#A3A3A3',
      states: {
        hover: {
          color: '#FFCC66'
        }
      },
      dataLabels: {
        enabled: true,
        style: {
          fontWeight: 'normal'
        },
        format: '{point.name}'
      }
    }, {
      name: 'Separators',
      type: 'mapline',
      data: Highcharts.geojson(Highcharts.maps['countries/us/us-all'], 'mapline'),
      color: 'silver',
      showInLegend: false,
      enableMouseTracking: false
    }]
  });
});
