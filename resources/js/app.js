window.Vue = require('vue');
require('./bootstrap');

import Home from './components/Home.vue';
import Supplier from './components/Supplier.vue';
import Product from './components/Product.vue';
import Order from './components/Order.vue';
import OrderDisplay from './components/OrderDisplay.vue';
import SupplierDisplay from './components/SupplierDisplay.vue';
import Products from './components/Products.vue';

import store from './store/store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import Multiselect from 'vue-multiselect';







Vue.use(ElementUI);

Vue.component('home-component', Home);

Vue.component('order-component', Order);
Vue.component('product-component', Product);
Vue.component('supplier-component', Supplier);
Vue.component('orderdisplay-component', OrderDisplay);
Vue.component('supplierdisplay-component', SupplierDisplay);
Vue.component('products-component', Products);

Vue.component('multiselect', Multiselect)


const app = new Vue({
    store,
    el: '#app',
});
