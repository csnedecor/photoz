$(function () {

  // Initiate the chart
  $('#container').highcharts('Map', {

    chart: {
      height: 800
    },

    title : {
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
      min: 0
    },

    series : [{
      data : data,
      mapData: Highcharts.maps['countries/us/us-all'],
      joinBy: 'hc-key',
      name: 'Pageviews',
      states: {
        hover: {
          color: '#BADA55'
        }
      },
      dataLabels: {
        enabled: true,
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
