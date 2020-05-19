import Vue from 'vue/dist/vue.esm'
import Buefy from 'buefy/dist/buefy.esm'
import 'buefy/dist/buefy.css'
Vue.use(Buefy);

new Vue({
  el: '#datetime',
  data() {
        const min = new Date()
        min.setDate(min.getDate() - 7)
        min.setHours(9)
        min.setMinutes(0)
        min.setSeconds(0)
        const max = new Date()
        max.setDate(max.getDate() + 7)
        max.setHours(18)
        max.setMinutes(0)
        max.setSeconds(0)
        return {
            minDatetime: min,
            maxDatetime: max
        }
    }
})
