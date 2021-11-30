<template>
  <div class="statistics-wrap">
    <!-- :class="{ 'chart-quarter-activated': this.showMonthChart }" -->

    <div id="chart-year" class="chart-box">
      <apexchart
        ref="chartYear"
        type="bar"
        height="350"
        :options="chartOptionsYear"
        :series="seriesYear"
      />
    </div>
    <!-- :class="{ active: this.showMonthChart }" -->

    <div id="chart-quarter" class="chart-box">
      <apexchart
        ref="chartQuarter"
        type="bar"
        height="350"
        :options="chartOptionsQuarter"
        :series="projectsByYearSeries"
      />
    </div>
  </div>
</template>

<script>
import VueApexCharts from "vue-apexcharts";
import ApexCharts from "apexcharts";

var colors = [
  "#008FFB",
  "#00E396",
  "#FEB019",
  "#FF4560",
  "#775DD0",
  "#00D9E9",
  "#FF66C3",
];
export default {
  components: {
    apexchart: VueApexCharts,
  },

  data() {
    return {
      // renderDataTableFlag: false,
      showMonthChart: false,
    };
  },
  props: [
    "seriesYear",
    "yearsLabel",
    "projectsByYearSeries",
    "projectsByYearNames",
  ],
  computed: {
    chartOptionsYear: function () {
      return {
        chart: {
          id: "barYear",
          height: 400,
          width: "100%",
          type: "bar",
          events: {
            dataPointSelection: (e, chart, opts) => {
              // you can call other methods now as "this" will point to the Vue instance if you use ES6 arrow function
              var quarterChartEl = document.getElementById("chart-quarter");
              var yearChartEl = document.getElementById("chart-year");

              if (opts.selectedDataPoints[0].length === 1) {
                if (quarterChartEl.classList.contains("active")) {
                  this.$emit("yearSelected",opts.w.globals.labels[opts.dataPointIndex]);
                  this.updateQuarterChart(chart, "barQuarter");
                } else {
                  yearChartEl.classList.add("chart-quarter-activated");
                  quarterChartEl.classList.add("active");
                  //   this.showMonthChart = true;
                  this.$emit("yearSelected",opts.w.globals.labels[opts.dataPointIndex]);
                  this.updateQuarterChart(chart, "barQuarter");
                }
              } else {
                // this.showMonthChart = true;

                this.$emit("yearSelected",opts.w.globals.labels[opts.dataPointIndex]);
                this.updateQuarterChart(chart, "barQuarter");
              }

              if (opts.selectedDataPoints[0].length === 0) {
                yearChartEl.classList.remove("chart-quarter-activated");
                quarterChartEl.classList.remove("active");
                // this.showMonthChart = false;
              }
            },
            updated: (chart) => {
              return this.updateQuarterChart(chart, "barQuarter");
            },
          },
        },
        labels: this.yearsLabel,
        plotOptions: {
          bar: {
            distributed: true,
            horizontal: false,
            endingShape: "arrow",
            barHeight: "75%",
            dataLabels: {
              position: "bottom",
            },
          },
        },
        dataLabels: {
          enabled: true,
          textAnchor: "start",
          style: {
            colors: ["#fff"],
          },
          formatter: function (val, opt) {
            return opt.w.globals.labels[opt.dataPointIndex];
          },
          offsetX: 0,
          dropShadow: {
            enabled: true,
          },
        },

        colors: colors,

        states: {
          normal: {
            filter: {
              type: "desaturate",
            },
          },
          active: {
            allowMultipleDataPointsSelection: true,
            filter: {
              type: "darken",
              value: 1,
            },
          },
        },
        tooltip: {
          x: {
            show: false,
          },
          y: {
            title: {
              formatter: function (val, opts) {
                return opts.w.globals.labels[opts.dataPointIndex];
              },
            },
          },
        },
        title: {
          text: "Yearly Results",
          offsetX: 125,
        },
        subtitle: {
          text: "(Click on bar to see details)",
          offsetX: 145,
        },
        grid: {
          yaxis: {
            lines: {
              show: false,
            },
          },
          xaxis: {
            lines: {
              show: true,
            },
          },
        },
        yaxis: {
          labels: {
            show: true,
          },
        },
      };
    },
    chartOptionsQuarter: function () {
      return {
        chart: {
          id: "barQuarter",
          height: 400,
          width: "100%",
          type: "bar",
          stacked: true,
          events: {
            dataPointSelection: (e, chart, opts) => {
              console.log(e, "e");
              console.log(chart, "chart");
              console.log(opts, "chart options");
              //   this.renderDataTableFlag = true;
                this.$emit(
                  "selectedMonth",
                  opts.w.globals.labels[opts.dataPointIndex]
                );
              //   this.$emit("renderDataTableFlag", this.renderDataTableFlag);
            },
          },
        },
        plotOptions: {
          bar: {
            columnWidth: "50%",
            horizontal: false,
          },
        },
        labels: this.projectsByYearNames,
        legend: {
          show: false,
        },
        grid: {
          yaxis: {
            lines: {
              show: false,
            },
          },
          xaxis: {
            lines: {
              show: true,
            },
          },
        },
        yaxis: {
          labels: {
            show: true,
          },
        },
        title: {
          text: "Quarterly Results",
          offsetX: 50,
        },
        tooltip: {
          x: {
            formatter: function (val, opts) {
              return opts.w.globals.seriesNames[opts.seriesIndex];
            },
          },
          y: {
            title: {
              formatter: function (val, opts) {
                return opts.w.globals.labels[opts.dataPointIndex];
              },
            },
          },
        },
      };
    },
  },

  methods: {
    updateQuarterChart(sourceChart, destChartIDToUpdate) {
      if (sourceChart.w.globals.selectedDataPoints[0]) {
        return ApexCharts.exec(destChartIDToUpdate, "updateOptions", {
          series: this.projectsByYearSeries,
        });
      }
    },
  },
};
</script>
<style lang="scss" >
@import "./src/assets/sass/GenericBarChart";
</style>
