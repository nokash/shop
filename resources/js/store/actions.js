

let actions = {
    createSupplier({commit}, supplier){
       console.log(supplier.name)
        axios.post('api/supplier/add', {name: supplier.name})
            .then(res => {
                console.log(supplier.name)
                    commit('CREATE_SUPPLIER', res.data)
                })
                .catch(err => {
                    console.log(err);
                })
    },

    createProduct({commit}, product){
        console.log(product.name)
         axios.post('api/product/add', {
             id: product.id,
             name: product.name,
             description: product.description,
             quantity: product.quantity,
             supplier_id: product.supplier_id

            })
             .then(res => {
                //  console.log(product.name)
                     commit('CREATE_PRODUCT', res.data)
                 })
                 .catch(err => {
                     console.log(err);
                 })
     },

     createOrder({commit}, order){
        console.log(order.order_number)
        for(var v in order.value){
            var products =  [];
            products = v;
        }
         axios.post('api/order/add', {
             order_id: order.order_id,
             order_number: order.order_number,
            //  products: order.value.id
            })
             .then(res => {
                //  console.log(product.name)
                     commit('CREATE_ORDER', res.data)
                 })
                 .catch(err => {
                     console.log(err);
                 })
     },

    updateSupplier({ commit }, currentPost) {
        axios.put(`/api/supplier/edit/${currentPost.id}`, { name: currentPost.name })
        .then(res => {
            commit('UPDATE_SUPPLIER', res.data)
        })
        .catch(err =>  {
            console.log(err);
        })


    },

    updateProduct({ commit }, currentPost) {
        axios.put(`/api/product/edit/${currentPost.product}`, {
            name: currentPost.name,
            description: currentPost.description,
            quantity: currentPost.quantity, })
        .then(res => {
            commit('UPDATE_PRODUCT', res.data)
        })
        .catch(err =>  {
            console.log(err);
        })


    },

    fetchSuppliers({commit}){
        axios.get(`api/supplier/all`)
            .then(res => {
                commit('FETCH_SUPPLIER', res.data)
            })
            .catch(err => {
                console.log(err);
            })
    },

    fetchProducts({commit}){
        axios.get(`api/product/detailed`)
            .then(res => {
                commit('FETCH_PRODUCTS', res.data)
            })
            .catch(err => {
                console.log(err);
            })
    },

    fetchLastId({commit}){
        axios.get(`api/product/last`)
            .then(res => {
                commit('FETCH_LASTID_', res.data)
            })
            .catch(err => {
                console.log(err);
            })
    },

    deleteSupplier({commit}, supplier_record){
        axios.delete(`api/supplier/delete/${supplier_record.id}`)
            .then(res => {
                if(res.data === 'ok'){
                    commit('DELETE_SUPPLIER', supplier_record);
                }
            }).catch(err => {
                console.log(err);
            })
    },

    deleteProduct({commit}, product){
        axios.delete(`api/product/delete/${product.id}`)
            .then(res => {
                if(res.data === 'ok'){
                    commit('DELETE_PRODUCT', product);
                }
            }).catch(err => {
                console.log(err);
            })
    }
}

export default actions;
