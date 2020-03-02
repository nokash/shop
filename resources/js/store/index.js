import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

const debug = process.env.NODE_ENV !== 'production';

export default new Vuex.Store({
    state: {
        orders: [],
        products: [],
        cart: [],
        cartCount: 0,
        suppliers: []
    },

    actions: {
        async getAllPosts({ commit }){
            return commit('setPosts', await window.axios.get('/api/order/detailed'))
        },

        async getProducts({ commit }){
            return commit('setProducts', await window.axios.get('/api/product/detailed'))
        },

        async getSuppliers({ commit }){
            return commit('setSuppliers', await window.axios.get('/api/supplier/all'))
        },




    },

    mutations: {
        setPosts(state, response) {
            state.orders = response.data.data;
           // console.log(state.orders)
        },

        setSuppliers(state, response){
            state.suppliers = response.data;
        },

        setProducts(state, response) {
            state.products = response.data.data;

        },

        addToCart(state, item){
            state.cart.push(item);

            state.cartCount++;
            console.log(item.name);
            console.log(state.cartCount);

        }
    },

    methods: {
        addToCart(item){
            this.$store.commit('addToCart', item)
        }
    },

    strict: debug
})
