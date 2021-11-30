<template>
  <div class="generic-pie-chart">
    <h5 class="generic-pie-chart__title">{{ chartTitle }}</h5>
    <div class="generic-pie-chart__chart" id="chart">
      <apexchart
        type="donut"
        :options="chartOptions"
        :series="series"
      ></apexchart>
    </div>
  </div>
</template>

<script>
import VueApexCharts from "vue-apexcharts";
// import ApexCharts from "apexcharts";
export default {
  components: {
    apexchart: VueApexCharts,
  },
  props: ["chartTitle", "labelsList", "seriesList"],
  data() {
    return {
      series: this.seriesList,
      renderDataTableFlag: false,
      indexOfSelectedItem: 0,
    };
  },
  computed: {
    chartOptions: function () {
      return {
        colors: ["#3094df", "#24bd93", "#df9f30", "#e85f4f"],
        chart: {
          type: "donut",
          events: {
            dataPointSelection: (e, chart, opts) => {
              this.renderDataTableFlag = true;
              this.indexOfSelectedItem = opts.dataPointIndex;
            //   this.$emit("renderDataTableFlag", this.renderDataTableFlag);
            //   this.$emit("indexOfSelectedItem", this.indexOfSelectedItem);
            },
          },
        },
        dataLabels: {
          enabled: false,
        },
        labels: this.labelsList,
        legend: {
          position: "bottom",
          itemMargin: {
            horizontal: 5,
            vertical: 5,
          },
          markers: {
            offsetX: 5,
          },
          fontFamily: "AlmaraiBold",
        },
        responsive: [
          {
            breakpoint: 40,
            options: {
              chart: {
                width: 50,
              },
              legend: {
                position: "bottom",
              },
            },
          },
        ],
        plotOptions: {
          pie: {
            donut: {
              labels: {
                show: true,
                name: {
                  show: true,
                  offsetY: 0,
                  formatter: function (w) {
                      // console.log(w)
                    return w;
                  },
                },
                value: {
                  offsetY: 0,
                  fontSize: "22px",
                  show: false,
                },
              },
              total: {
                show: true,
                showAlways: true,
                label: "Total",
                formatter: function (w) {
                  console.log(w);
                  return w.globals.seriesTotals;
                },
              },
            },
          },
        },
        title: {
          text: [],
          offsetX: 15,
        },
      };
    },
  },
};
</script>