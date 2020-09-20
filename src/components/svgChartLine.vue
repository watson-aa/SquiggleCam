<template>
    <path v-bind:style="{strokeWidth: stroke.width, fill: stroke.fill, stroke: stroke.color}" :d="pathD"></path>
</template>

<script>
  export default {
    name: "svgChartLine",
    props: ["d", "stroke", "filterWhite"],
    computed: {
      pathD() {
        let path = "";
        let prevX = 0;
        this.d.values.forEach((point, index) => {
          if ((this.filterWhite == false && index === 0) ||
              (this.filterWhite == true && point[0] - prevX > 1)) {
            path += `M ${point[0]},${point[1]}`;
          } else {
            path += `L${Math.round(point[0] * 100) / 100},${Math.round(point[1]*100)/100}`
          }
          prevX = point[0];
        });
        return path;
      }
    }
  }
</script>
