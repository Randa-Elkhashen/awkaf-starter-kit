<template>
  <div>
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <generic-pie-chart
            :chartTitle="chartTitle"
            :labelsList="labelsList"
            :seriesList="seriesList"
          ></generic-pie-chart>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <generic-bar-chart
            :seriesYear="seriesYear"
            :yearsLabel="yearsLabel"
            :projectsByYearSeries="projectsByYearSeries"
            :projectsByYearNames="projectsByYearNames"
            @yearSelected="yearSelected($event)"
            @selectedMonth="selectedMonth($event)"
          ></generic-bar-chart>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import GenericBarChart from "../components/GenericBarChart.vue";
import GenericPieChart from "../components/GenericPieChart.vue";
export default {
  components: { GenericPieChart, GenericBarChart },
  data() {
    return {
      chartTitle: "gender",
      labelsList: ["Male", "Female"],
      seriesList: [20, 80],
      seriesYear: [
        {
          data: [2010, 2011, 2012, 2013, 2015],
        },
      ],
      yearsLabel: ["2010", "2011", "2012", "2013", "2015"],
      projectsByYearSeries: [
        {
          data: [20, 50, 40, 10, 15, 80],
        },
      ],
      projectsByYearNames: ["Aug", "june", "july", "jan", "oct", "feb"],
      selectedYear: "",
      monthSelected:""
    };
  },
  methods: {
    yearSelected(event) {
      this.selectedYear = event;
    },
    selectedMonth(event) {
      this.monthSelected = event;
      console.log(this.monthSelected, "YEAR")
      
    },
  },
};
</script>