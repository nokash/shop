

let getters = {
    suppliers: state => {
        return state.suppliers;
    },

    products: state => {
        return state.products.data;
    },

    orders: state => {
        return state.orders;
    },

    lasts: state => {
        return state.lasts;
    },
}

export default getters;
