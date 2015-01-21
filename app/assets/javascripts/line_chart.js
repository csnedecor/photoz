var chart = c3.generate({
  bindto: "#chart",
  data: {
    x: "x",
    url: "visits.csv"
  },
  color: {
    pattern: ['#3B9FDD', '#FFCC66' ]
  },
  axis: {
    x: {
      type: "timeseries",
      tick: {
        format: "%Y-%m-%d"
      }
    }
  }
});
