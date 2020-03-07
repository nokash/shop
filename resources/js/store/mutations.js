let mutations = {
    CREATE_SUPPLIER(state, supplier_record) {
        state.suppliers.unshift(supplier_record);
    },

    CREATE_PRODUCT(state, product) {
        state.products.data.unshift(product);
    },

    FETCH_PRODUCTS(state, products){
        return state.products = products;
    },

    FETCH_LASTID_(state, lasts){
        return state.lasts = lasts;
    },

    UPDATE_SUPPLIER(state, supplier_record){
        if(data.res.status === 200){
            let supplier = state.suppliers.findIndex(supplier => supplier.id === data.id);
        }
    },

    FETCH_SUPPLIER(state, suppliers){
        return state.suppliers = suppliers;
    },

    DELETE_SUPPLIER(state, post){
        let index = state.suppliers.findIndex(item => item.id === post.id);
        state.suppliers.splice(index, 1)
    },

    DELETE_PRODUCT(state, post){
        //find index of the JSON
        //splice at index of the JSON
        let index = state.products.data.findIndex(item => item.id === post.id);
        state.products.data.splice(index, 1)
    }
}

export default mutations;
