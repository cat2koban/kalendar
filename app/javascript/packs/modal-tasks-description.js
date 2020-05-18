import Vue from 'vue/dist/vue.esm'
import Buefy from 'buefy/dist/buefy.esm'
import 'buefy/dist/buefy.css'
Vue.use(Buefy);

new Vue({
    el: '#modal-tasks-description',
    data() {
        return {
            isCardModalActive: false
        }
    }
});
