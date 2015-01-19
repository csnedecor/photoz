$(function () {

  // Prepare demo data

  // Initiate the chart
  $('#container').highcharts('Map', {

    title : {
      text : 'Highmaps basic demo'
    },

    subtitle : {
      text : 'Source map: <a href="http://code.highcharts.com/mapdata/custom/usa-and-canada.js">Canada and United States of America</a>'
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
      mapData: Highcharts.maps['custom/usa-and-canada'],
      joinBy: 'hc-key',
      name: 'Random data',
      states: {
        hover: {
          color: '#BADA55'
        }
      },
      dataLabels: {
        enabled: true,
        format: '{point.name}'
      }
    }]
  });
});
