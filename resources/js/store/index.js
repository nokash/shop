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
        suppliers: [],
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

        deletePost({commit}, post) {
            axios.delete(`/api/suppliers/delete/${post.id}`)
                .then(res => {
                    if (res.data === 'ok')
                        commit('DELETE_POST', post)
                }).catch(err => {
                console.log(err)
            })
        },


    },

    mutations: {
        setPosts(state, response) {
            state.orders = response.data.data;

        },

        setSuppliers(state, response){
            state.suppliers = response.data;
        },

        setProducts(state, response) {
            state.products = response.data.data;

        },

        DELETE_SUPPLIER(state, post) {
            console.log(post.id)
            let index = state.suppliers.findIndex(item => item.id === post.id)
            state.suppliers.splice(index, 1)
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
