var chart = c3.generate({
  bindto: "#chart",
  data: {
    x: "x",
    url: "visits.csv"
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
