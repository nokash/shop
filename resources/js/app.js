import Home from './components/Home.vue';
import Supplier from './components/Supplier.vue';
import Product from './components/Product.vue';
import Order from './components/Order.vue';
import OrderDisplay from './components/OrderDisplay.vue';
import SupplierDisplay from './components/SupplierDisplay.vue';


import store from './store/index'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';



require('./bootstrap');

window.Vue = require('vue');

Vue.use(ElementUI);

Vue.component('home-component', Home);

Vue.component('order-component', Order);
Vue.component('product-component', Product);
Vue.component('supplier-component', Supplier);
Vue.component('orderdisplay-component', OrderDisplay);
Vue.component('supplierdisplay-component', SupplierDisplay);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    store,
    el: '#app',
});
