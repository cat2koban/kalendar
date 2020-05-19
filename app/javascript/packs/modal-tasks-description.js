import Vue from 'vue/dist/vue.esm'
import Buefy from 'buefy/dist/buefy.esm'
Vue.use(Buefy);

new Vue({
    el: '#modal-tasks-description',
    data() {
        var array = []
        for (var i = 0 ; i < 32 ; i ++) {
            array.push(false)
        }

        return {
            isCardModalActive: array
        }
    },
    methods: {
        openModal: function (index) {
            Vue.set(this.isCardModalActive, index, true)
        }
    }
});
