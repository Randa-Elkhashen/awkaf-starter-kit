<!-- Needed NPM Installs -->
<!-- npm i axios vue-multiselect v-calendar@1.0.0 -->

<template>
  <div>
    <h1>Reports</h1>
    <select
      name="LeaveType"
      @change="onFilterOneChange()"
      class="form-control"
      v-model="filterOne"
    >
      <option value="3">Filter 1</option>
      <option value="4">Filter 2</option>
    </select>

    <select name="LeaveType" class="form-control" v-model="filterTwo">
      <option value="3">Filter 1</option>
      <option value="4">Filter 2</option>
    </select>

    <button v-on:click="getReportResults(filterTwo)">Get Reports</button>
    <table class="table table-striped" v-if="reportList.length">
      <thead>
        <tr>
          <th>Image</th>
          <th>Title</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(report, i) in reportList" :key="i">
          <td scope="row">
            <img :src="report.thumbnailUrl"/>
          </td>
          <td>{{ report.title }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>


<script>
import axios from "axios";

export default {
  components: {},
  data: function () {
    return {
      filterOne: "",
      filterTwo: "",
      reportList: [],
    };
  },
  methods: {
    getData: function () {
      axios
        .get("https://jsonplaceholder.typicode.com/photos?albumId=1")
        .then(function (response) {
          if (response.data != "") {
            console.log(response.data);
          }
        });
    },
    getFilterTwoData: function (f1) {
      axios
        .get(`https://jsonplaceholder.typicode.com/photos?albumId=${f1}`)
        .then(function (response) {
          if (response.data != "") {
            console.log(response.data);
          }
        });
    },
    getReportResults: function (f2) {
      axios
        .get(`https://jsonplaceholder.typicode.com/photos?albumId=${f2}`)
        .then((response) => {
          if (response.data != "") {
            this.reportList = response.data;
            console.log(response.data);
          }
        });
    },
    onFilterOneChange() {
      this.getFilterTwoData(this.filterOne);
    },
  },
  computed: {},

  mounted() {
    this.getData();
  },
};
</script>