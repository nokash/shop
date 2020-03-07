// import Vue from 'vue';
// import Vuex from 'vuex';

// Vue.use(Vuex);

// const debug = process.env.NODE_ENV !== 'production';

// export default new Vuex.Store({
//     state: {
//         orders: [],
//         products: [],
//         cart: [],
//         cartCount: 0,
//         suppliers: [],
//     },

//     actions: {
//         async getAllPosts({ commit }){
//             return commit('setOrders', await window.axios.get('/api/order/detailed'))
//         },

//         async getProducts({ commit }){
//             return commit('setProducts', await window.axios.get('/api/product/detailed'))
//         },

//         async getSuppliers({ commit }){
//             return commit('setSuppliers', await window.axios.get('/api/supplier/all'))
//         },
//         async createSupplier({ commit }){
//             return commit('setSupplier', await  window.axios.post("/api/supplier/add", {
//                 headers: { "Content-Type": "multipart/form-data"}
//             }))
//         }


//     },

//     mutations: {
//         setOrders(state, response) {
//             state.orders = response.data.data;

//         },

//         setSuppliers(state, response){
//             state.suppliers = response.data;
//         },

//         setProducts(state, response) {
//             state.products = response.data.data;

//         },
//     },

//     strict: debug
// })
